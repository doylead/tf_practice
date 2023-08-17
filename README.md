# Goals:

This repository is designed to serve as a learning space for projects in Terraform.

## Demonstrated in AWS:
- Setting up a custom VPC
- Creating and implementing a public subnet with IGW and appropriate routing rules
- Creating an EC2 instance
- Running commands on EC2 startup
- Using a key pair for remote SSH access
- Configuring inbound security rules for local SSH, ICMP, and HTTP traffic

## Useful Commands:
- To SSH into the first server with a public IP address using a private key specified in environmental variable $KEYPATH, use:
<pre>ssh -i $KEYPATH ec2-user@$(terraform output public_server_IP | head -n 2 | tail -n 1 | tr -d '", ')</pre>

## Current Questions:
- What are the benefits/drawbacks to using terraform workspace name over a variable?

## Possible Extensions:
- Including private subnet
- Including other AWS resources (e.g. EMR, Route 53)
- Learn and implement Terraform best practices
- Building applications (e.g. Cassandra, or public github repos)
- Incorporating Docker
- Incorporating Kubernetes