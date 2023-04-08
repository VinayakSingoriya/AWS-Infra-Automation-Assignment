resource "aws_db_instance" "strapi" {
  db_name                = "vinayakRecord"
  identifier             = "flask-db"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7"
  username               = "admin"
  password               = "vinayak123"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  publicly_accessible    = true
  skip_final_snapshot    = true

}


resource "aws_security_group" "db_sg" {
  name        = "dbSG"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "flaskSG"
  }
}