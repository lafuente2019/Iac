module "aws-prod" {
  source = "../../infra"
  instancia = "t2.micro"
  regiao_aws = "us-west-2"
  chave = "Iac-Prod"
  grupoDeSeguranca = "Prod"
  minimo = 1
  maximo = 10
  nomeGrupo = "Prod"
  producao = true
}

# o output é utilizado quando trabalhamos com instancia, ele nos traz o IP publico da maquina
#output "IP" {
#  value = module.aws-prod.IP_publico
#}