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

resource "aws_launch_template" "maquina" {
  image_id      = "ami-03f65b8614a860c29"
  key_name      = var.chave
  instance_type = var.instancia
  tags = {
    Name = "Terraform Ansible python"
  }
  security_group_names = [var.var.grupoDeSeguranca]
}

resource "aws_key_pair" "chaveSSH" {
  key_name = var.chave
  public_key = file("${var.chave}.pub")
}

output "IP_publico" {
  value = aws_instance.app_server.public_ip
}

resource "aws_autoscaling_group" "grupo" {
  name = var.nomeGrupo
  max_size = var.maximo
  min_size = var.minimo
  launch_template {
      id = aws_launch_template.maquina.id
      version = "$Latest"
    }
}