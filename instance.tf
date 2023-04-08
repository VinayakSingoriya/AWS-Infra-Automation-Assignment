resource "aws_instance" "strapi" {
  ami             = "ami-014d05e6b24240371"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance_sg.name]
  key_name        = aws_key_pair.deployer.key_name

  tags = {
    Name = "Server-1"
  }
}


resource "aws_security_group" "instance_sg" {
  name        = "cloudSG"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = [80, 443, 22, 8000]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "strapi_sg"
  }
}