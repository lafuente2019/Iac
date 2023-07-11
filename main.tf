terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03f65b8614a860c29"
  key_name      = "iac-lafuente"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Ansible python"
  }
}

resource "aws_key_pair" "chaveSSH" {
  key_name = DEV
  public_key = file("Iac-Dev.pub")
  
}