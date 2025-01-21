provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "bastion" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
  }