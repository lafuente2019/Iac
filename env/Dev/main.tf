module "aws-dev" {
  source = "../../infra"
  instancia = "t2.micro"
  regiao_aws = "us-west-2"
  chave = "Iac-Dev"
  grupoDeSeguranca = "Dev"
  minimo = 0
  maximo = 1
  nomeGrupo = "Dev"
}

output "IP" {
  value = module.aws-dev.IP_publico
}