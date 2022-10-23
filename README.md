# Secure your AWS Servers for Algorithmic Trading - Complete Guide

This is a complete guide to securing your AWS servers for algorihtmic trading. The blog post will be linked here soon upon publication.

In this repository you will find an automated script to deploy a secure AWS server for algorithmic trading. The script will do the following:

- Create a VPC with a public and private subnet
- Attach an internet gateway to the VPC
- Setup Route Tables
- Create Security Groups for the VPC
- Create an SSH key pair
- Create an EC2 instance with the SSH key pair and Security Groups

The part of the article that the script does not cover is setting up EC2 hardening, 2FA, and setting up a VPN. These are all covered in the article