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

# o output é utilizado quando trabalhamos com instancia, ele nos traz o IP publico da maquina
#output "IP" {
#  value = module.aws-prod.IP_publico
#}