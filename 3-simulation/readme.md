# Build Plan
## Components:
- VPC
- Public Subnet
- Router
- Private Subnet
- Internet Gateway
- NAT
- 1 EC2 in Public Subnet
- 1 EC2 in Private Subnet
- Security Group
  
### EC2 Public Instance
Running nodejs server

### EC2 Private Instance
Running mongodb server

## Key Improvements
- Ec2_public <--> Ec2_private
- NAT working so that ec2_private is not exposed
- Autoscaling Group using CLoudWatch on node instances