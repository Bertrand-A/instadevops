provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws-key"
  public_key = "ssh key"
  }

resource "aws_instance" "testweb" {
  ami           = "ami-41e0b93b"
  instance_type = "t2.micro"
  security_groups = ["MyDMZ"]
  key_name   = "aws-key"
}

resource "aws_instance" "haproxy" {
  ami           = "ami-41e0b93b"
  instance_type = "t2.micro"
  security_groups = ["MyDMZ"]
  key_name   = "aws-key"
}

resource "aws_db_instance" "wordpress_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.6.37"
  instance_class       = "db.t2.micro"
  name                 = "wordpress_db"
  username             = "imad"
  password             = "insta75005"
  }