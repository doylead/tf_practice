# Create an EC2 instance in the public subnet
resource "aws_instance" "tf_practice_server" {
  # Amazon Linux 2023
  ami           = "ami-0ccabb5f82d4c9af5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.tf_practice_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.tf_practice_sg.id]
  key_name = var.AWS_key_pair_name # Defined in private_variables.tf, not included in git

  tags = {
    Name = "tf_practice_server"
  }

  # Install a web server on startup to demonstrate basic functionality
  user_data = "${file("install_httpd.sh")}"

}

# Provide information about our server's public IP address
output "tf_practice_server_IP" {
    value = "${aws_instance.tf_practice_server.public_ip}"
}

# ssh access is now possible with a fun one-liner like
# ssh -i $KEYPATH ec2-user@$(terraform output tf_practice_server_IP | tr -d '"')
# where $KEYPATH is a bash environmental variable storing the PEM key corresponding to 'macbook-air'