# Create security group for this environment
resource "aws_security_group" "tf_practice_sg" {
    name  = "tf_practice_sg"
    vpc_id = aws_vpc.tf_practice_vpc.id
}

# Allow inbound SSH from my machine
resource "aws_vpc_security_group_ingress_rule" "tf_practice_ssh" {
    security_group_id = aws_security_group.tf_practice_sg.id

    # Originating IP address(es)
    cidr_ipv4 = var.my_ip_address # Defined in private_variables.tf, not included in git

    # Defines a port range
    from_port = 22
    to_port = 22

    # Protocol
    ip_protocol = "tcp"
}

# Allow inbound ICMP from my machine
resource "aws_vpc_security_group_ingress_rule" "tf_practice_icmp" {
    security_group_id = aws_security_group.tf_practice_sg.id

    # Originating IP address(es)
    cidr_ipv4 = var.my_ip_address # Defined in private_variables.tf, not included in git

    # I'm unsure what this means for icmp
    from_port = -1
    to_port = -1

    # Protocol
    ip_protocol = "icmp"
}

# Allow inbound HTTP from my machine
resource "aws_vpc_security_group_ingress_rule" "tf_practice_http" {
    security_group_id = aws_security_group.tf_practice_sg.id

    # Originating IP address(es)
    cidr_ipv4 = var.my_ip_address # Defined in private_variables.tf, not included in git

    # I'm unsure what this means for icmp
    from_port = 80
    to_port = 80

    # Protocol
    ip_protocol = "tcp"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "tf_practice_outbound" {
    security_group_id = aws_security_group.tf_practice_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = -1
    to_port = -1
    ip_protocol = -1
}
