## id de connexion à l'IAM AWS

provider "aws" {
  access_key = "******"
  secret_key = "******"
  region     = "us-east-1"
  }


##  création de la clé d'accès ssh

resource "aws_key_pair" "deployer" {
  key_name   = "aws-key"
  public_key = "ssh key"
  }

## installation de la VM serveur WEB
  
resource "aws_instance" "testweb" {
  ami           = "ami-41e0b93b"
  instance_type = "t2.micro"
  security_groups = ["MyDMZ"]
  key_name   = "aws-key"
  }
 
## Création du security group pour la db

resource "aws_security_group" "allow_db" {
  name        = "allow_db"
  description = "Allow db traffic"
  vpc_id      = "vpc-53c6d12b"

  ingress {
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 3306
    to_port         = 3306
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

## installation de la VM load-balancer

resource "aws_instance" "haproxy" {
  ami           = "ami-41e0b93b"
  instance_type = "t2.micro"
  security_groups = ["MyDMZ"]
  key_name   = "aws-key"
  }

## installation de RDS

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