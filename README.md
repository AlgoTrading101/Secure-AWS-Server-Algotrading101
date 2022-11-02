# Secure your AWS Servers for Algorithmic Trading - Complete Guide

This is a complete guide to securing your AWS servers for algorihtmic trading. The blog post will be linked here soon upon publication.

In this repository you will find an automated script to deploy a secure AWS server for algorithmic trading. The script will do the following:

- Create a VPC with a public and private subnet
- Attach an internet gateway to the VPC
- Setup Route Tables
- Create Security Groups for the VPC
- Create an SSH key pair
- Create an EC2 instance with the SSH key pair and Security Groups

The part of the article that the script does not cover is setting up EC2 hardening, 2FA, and setting up a VPN. These are all covered in the article.

## Table of contents

<ol><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#what-is-aws-trading-server-security">What is AWS trading server security?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-pros">Why should I secure my AWS trading servers?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-cons">Why shouldn’t I secure my AWS trading servers?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-start">How to get started with securing your AWS trading servers?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-vpc">What is AWS VPC?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-create-vpc">How to create a secure VPC for trading on AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-vpc-subnet">What is a VPC Subnet in AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-vpc-create-subnet">How to create a VPC Subnet in AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-internet-gateway">What is AWS Internet Gateway?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-setup-internet-gateway">How to set up your Internet Gateway for trading on AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-security-groups">What are AWS Security Groups?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-create-security-groups">How to create a Security Group for trading on AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-key-pairs">What are Key Pairs in AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-create-key-pairs">How to create Key Pairs in AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-ec2">What is AWS EC2?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-create-ec2">How to create a secure EC2 trading server on AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-harden">How to harden your trading server on AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-2fa-ec2">How to enable 2FA for an EC2 instance on AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-vpn">What is an AWS VPN?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-create-vpn">How to create your secure VPN connection for trading on AWS?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-additional-features">What are some additional AWS features that increase Security?</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-setup-script">Setup script</a></li><li><a href="https://algotrading101.com/learn/trading-servers-security-aws-guide/#secure-aws-trading-closing-thoughts">Closing thoughts</a></li></ol>

----------
## Info

| Author | Igor Radovanovic
--- | ---
| Published | November 2, 2022
