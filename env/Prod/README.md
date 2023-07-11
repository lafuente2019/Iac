# Módulo AWS Prod
Este módulo é usado para provisionar uma instância AWS de produção.

## Uso
module "aws-prod" {
  source      = "../../infra"
  instancia   = "t2.micro"
  regiao_aws  = "us-west-2"
  chave       = "Iac-Prod"
}

output "IP" {
  value = module.aws-prod.IP_publico
}

## Inputs
Os seguintes inputs são suportados:

instancia (obrigatório): O tipo de instância para a instância de produção AWS.
regiao_aws (obrigatório): A região AWS onde a instância de produção será provisionada.
chave (obrigatório): O nome do par de chaves AWS a ser associado com a instância de produção.

## Outputs
O módulo fornece as seguintes saídas:

IP (string): O endereço IP público da instância de produção provisionada.
## Exemplo

module "aws-prod" {
  source      = "../../infra"
  instancia   = "t2.micro"
  regiao_aws  = "us-west-2"
  chave       = "Iac-Prod"
}

output "IP" {
  value = module.aws-prod.IP_publico
}
Este exemplo cria uma instância AWS de produção usando o tipo de instância especificado (t2.micro) na região us-west-2. Ele associa o par de chaves Iac-Prod com a instância. O endereço IP público da instância de produção é então exposto como saída.

## Dependência do Módulo
Este módulo requer a existência de um módulo de infraestrutura separado localizado em ../../infra para fornecer os recursos de infraestrutura necessários.

# Configuração Terraform-Ansible
Este repositório contém um playbook do Ansible para configurar um ambiente usando Terraform e Ansible. O playbook realiza uma série de tarefas, incluindo a instalação do Python 3 e do Virtualenv, o clone de um repositório Git, a instalação de dependências usando o PIP, a modificação do arquivo de configuração hosts, a configuração do banco de dados, o carregamento de dados iniciais e a inicialização do servidor.

## Tarefas
O playbook realiza as seguintes tarefas:

Instala o Python 3 e o Virtualenv usando o módulo apt do Ansible.
Faz o clone de um repositório Git usando o módulo git do Ansible.
Instala as dependências usando o PIP e o Virtualenv com o módulo pip do Ansible.
Altera o arquivo de configuração settings.py para permitir todas as hosts usando o módulo lineinfile do Ansible.
Configura o banco de dados executando o comando manage.py migrate com o módulo shell do Ansible.
Carrega dados iniciais executando o comando manage.py loaddata com o módulo shell do Ansible.
Inicia o servidor executando o comando manage.py runserver com o módulo shell do Ansible.
## Uso
Certifique-se de ter as chaves SSH configuradas corretamente para acessar o servidor de destino.
Clone este repositório:

git clone https://github.com/seu-usuario/terraform-ansible.git
Navegue até o diretório do repositório:

Ajuste o arquivo hosts para fornecer o endereço IP ou o nome de host do servidor de destino.
Execute o seguinte comando para iniciar a execução do playbook:

ansible-playbook -i hosts playbook.yml

## Configuração Adicional
Certifique-se de ajustar o arquivo hosts para fornecer o endereço IP ou o nome de host do servidor de destino. Além disso, verifique se o caminho para o arquivo de configuração settings.py está correto no arquivo playbook.yml.