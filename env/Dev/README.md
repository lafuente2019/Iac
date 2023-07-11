# Módulo AWS Dev

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Este repositório contém um módulo para provisionar uma instância AWS para fins de desenvolvimento.

## Uso

module "aws-dev" {
  source      = "../../infra"
  instancia   = "t2.micro"
  regiao_aws  = "us-west-2"
  chave       = "Iac-Dev"
}

output "IP" {
  value = module.aws-dev.IP_publico
}

## Inputs
Os seguintes inputs são suportados:

instancia (obrigatório): O tipo de instância para a instância AWS.
regiao_aws (obrigatório): A região AWS onde a instância será provisionada.
chave (obrigatório): O nome do par de chaves AWS a ser associado com a instância.
Outputs
O módulo fornece as seguintes saídas:

IP (string): O endereço IP público da instância provisionada.
Exemplo
hcl
Copy code
module "aws-dev" {
  source      = "../../infra"
  instancia   = "t2.micro"
  regiao_aws  = "us-west-2"
  chave       = "Iac-Dev"
}

output "IP" {
  value = module.aws-dev.IP_publico
}

Este exemplo cria uma instância AWS usando o tipo de instância especificado (t2.micro) na região us-west-2. Ele associa o par de chaves Iac-Dev com a instância. O endereço IP público da instância é então exposto como saída.

## Dependência do Módulo
Este módulo requer a existência de um módulo de infraestrutura separado localizado em ../../infra para fornecer os recursos de infraestrutura necessários.


# Configuração Terraform-Ansible
Este repositório contém um playbook do Ansible para configurar um ambiente usando Terraform e Ansible. O playbook realiza uma série de tarefas, incluindo a instalação do Python 3 e do Virtualenv, a instalação de dependências usando o PIP, a verificação da existência de um projeto, a inicialização de um projeto Django e a modificação do arquivo de configuração hosts.

## Tarefas
O playbook realiza as seguintes tarefas:

Instala o Python 3 e o Virtualenv usando o módulo apt do Ansible.
Instala as dependências usando o PIP e o Virtualenv com o módulo pip do Ansible.
Verifica se o projeto já existe no caminho /home/ubuntu/dependencias/setup/settings.py usando o módulo stat do Ansible.
Inicializa o projeto Django usando o comando django-admin startproject com o módulo shell do Ansible. Essa tarefa só é executada se o projeto não existir.
Altera o arquivo de configuração settings.py para permitir todas as hosts usando o módulo lineinfile do Ansible.

## Uso
Certifique-se de ter as chaves SSH configuradas corretamente para acessar o servidor de destino.
Clone este repositório:

git clone https://github.com/seu-usuario/terraform-ansible.git
Navegue até o diretório do repositório:

Ajuste o arquivo hosts para fornecer o endereço IP ou o nome de host do servidor de destino.
Execute o seguinte comando para iniciar a execução do playbook:
ansible-playbook -i hosts playbook.yml 

## Configuração Adicional
Certifique-se de ajustar o arquivo hosts para fornecer o endereço IP ou o nome de host do servidor de destino. Além disso, verifique se o caminho do arquivo de configuração settings.py está correto no arquivo playbook.yml.