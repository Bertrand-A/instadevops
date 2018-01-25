provider "aws" {
  access_key = "*****"
  secret_key = "*****"
  region     = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA4HSsxvb9CRMaHLaolxn2NMgr0/gxhRAh0knsfT6okB2qIAt6TGkGMqzUPyx43/MwYC7KYCL876ZxTyjI7St08bH6PsP+NVeWc6PC5I0G64KVIOonjRb1VWAURPuAKqHkUG5u1sBMiTqv3xM7w5Ktd6oQU/LrRHFRVD5Rke7uBhoPBQ/ejdu0WXYC9TTBsEbBu5qCtnSEjQpKCJ0S0Mr7tiLIYhloAnHE62MXfJtmY77Djvh5l+SJfuKMKBpiVJ+FYexbVrlzsduzEpYVHBfqml8orkKtI8RzzXgVa89vncM0UEXHB9fRGZSwcheEo0mkX0lscV5SRM39Bv0tc3DZ+w== rsa-key-20180125"
  }

resource "aws_instance" "testweb" {
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