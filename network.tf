# Create a virtual private cloud to contain public and private subnets
resource "aws_vpc" "tf_practice_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "tf_practice_vpc"
    }
}

# Create a public subnet within the new VPC
resource "aws_subnet" "tf_practice_public_subnet" {
    vpc_id = aws_vpc.tf_practice_vpc.id
    cidr_block = "10.0.0.0/24"

    tags = {
        Name = "tf_practice_public_subnet"
    }
}

# Create an IGW for the new VPC
resource "aws_internet_gateway" "tf_practice_igw" {
  vpc_id = aws_vpc.tf_practice_vpc.id

  tags = {
    Name = "tf_practice_igw"
  }
}

# Create a routing table for public traffic
resource "aws_route_table" "tf_practice_public_route_table" {
    vpc_id = aws_vpc.tf_practice_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf_practice_igw.id
    }

    tags = {
        Name = "tf_practice_public_route_table"
    }
}

# Set the new routing table as main for the VPC
resource "aws_route_table_association" "tf_practice_association" {
    subnet_id = aws_subnet.tf_practice_public_subnet.id
    route_table_id = aws_route_table.tf_practice_public_route_table.id
}