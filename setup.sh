#!/bin/bash

# Edit Begin
security_group_name="my_security_group"
security_group_description="my_security_group_description"
key_pair_name="my_key_pair"
inbound_rule_ip="0.0.0.0/0" # you can set this to your IP address or leave it as
image_ami="ami-051835d754b74795c" # AMI ID
instance_user="ubuntu" # can be ec2-user, ubuntu, centos, etc.
instance_count="1"
instance_type="t2.micro"
instance_name="my_instance"
# Edit End


# Do not edit below this line

# Create VPC and save vpc_id
echo "Creating VPC..."
vpc_id=$(aws ec2 create-vpc \
    --cidr-block 172.16.0.0/16 \
    --query Vpc.VpcId \
--output text)
echo "VPC created."

# Create subnet and save subnet_id
echo "Creating subnet..."
subnet_id=$(aws ec2 create-subnet \
    --vpc-id $vpc_id \
    --cidr-block 172.16.1.0/24 \
    --query Subnet.SubnetId \
--output text)
echo "Subnet created."

# Create Internet Gateway
echo "Creating Internet Gateway..."
internet_gateway_id=$(aws ec2 create-internet-gateway \
    --query InternetGateway.InternetGatewayId \
--output text)
echo "Internet Gateway created."

# Attach Internet Gateway to VPC
echo "Attaching Internet Gateway to VPC..."
aws ec2 attach-internet-gateway \
--vpc-id $vpc_id \
--internet-gateway-id $internet_gateway_id
echo "Internet Gateway attached to VPC."

# Create Route Table
echo "Creating Route Table..."
route_table_id=$(aws ec2 create-route-table \
    --vpc-id $vpc_id \
    --query RouteTable.RouteTableId \
--output text)
echo "Route Table created."

# Add Route to Route Table
echo "Adding Route to Route Table..."
aws ec2 create-route \
--route-table-id $route_table_id \
--destination-cidr-block 0.0.0.0/0 --gateway-id $internet_gateway_id
echo "Route added to Route Table."

# Associate Route Table with Subnet
echo "Associating Route Table with Subnet..."
aws ec2 associate-route-table \
--subnet-id $subnet_id \
--route-table-id $route_table_id
echo "Route Table associated with Subnet."

# Create Security Group
echo "Creating Security Group..."
security_group_id=$(aws ec2 create-security-group \
    --group-name $security_group_name \
    --description $security_group_description \
    --vpc-id $vpc_id \
    --query GroupId \
--output text)
echo "Security Group created."

# Add Inbound Rule to Security Group
echo "Adding Inbound Rule to Security Group..."
aws ec2 authorize-security-group-ingress \
--group-id $security_group_id \
--protocol tcp \
--port 22 \
--cidr $inbound_rule_ip
echo "Inbound Rule added to Security Group."

# Create Key Pair and save key_pair_name.pem
echo "Creating Key Pair..."
touch $key_pair_name.pem
key=$(aws ec2 create-key-pair \
    --key-name $key_pair_name \
    --query "KeyMaterial" \
--output text)
# save key to key_pair_name.pem
echo "$key" > $key_pair_name.pem
echo "Key Pair created."

# Permissions for Key Pair
echo "Setting permissions for Key Pair..."
chmod 400 $key_pair_name.pem
echo "Permissions set for Key Pair."

# Create Instance
echo "Creating Instance..."
instance_id=$(aws ec2 run-instances \
    --image-id $image_ami \
    --count $instance_count \
    --instance-type $instance_type \
    --key-name $key_pair_name \
    --security-group-ids $security_group_id \
    --subnet-id $subnet_id \
    --associate-public-ip-address \
    --query Instances[0].InstanceId \
--output text)
echo "Instance created."

# Find Public IP
echo "Finding Public IP..."
instance_ip=$(aws ec2 describe-instances \
    --instance-ids $instance_id \
    --query Reservations[0].Instances[0].PublicIpAddress \
--output text)
echo "Public IP found."

# Wait for Instance to be running
echo "Waiting for Instance to be running..."
aws ec2 wait instance-running --instance-ids $instance_id
echo "Instance is running."

echo "Run the following command to SSH into the instance:"
echo "ssh -i $key_pair_name.pem $instance_user@$instance_ip"
