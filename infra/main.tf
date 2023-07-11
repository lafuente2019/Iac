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
  region  = var.regiao_aws
}

resource "aws_instance" "app_server" {
  ami           = "ami-03f65b8614a860c29"
  key_name      = var.chave
  instance_type = var.instancia

  tags = {
    Name = "Terraform Ansible python"
  }
}

resource "aws_key_pair" "chaveSSH" {
<<<<<<< HEAD:infra/main.tf
  key_name = var.chave
  public_key = file("${var.chave}.pub")
=======
  key_name = DEV
  public_key = file("Iac-Dev.pub")
  
>>>>>>> dc9b94598960ac904068802091ecf07a9036a2ed:main.tf
}