provider "aws" {
  access_key = "******"
  secret_key = "******"
  region     = "us-east-1"
}

# "typederessourcedeployé" "nomdelamachine" numéro ami à récuperer sur les free tier eligible - utiliser toujours t2.micro
resource "aws_instance" "testweb" {
  ami           = "ami-41e0b93b"
  instance_type = "t2.micro"
}