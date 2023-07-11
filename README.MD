# Terraform AWS Instance Configuration

Este repositório contém o código Terraform para criar uma instância EC2 da AWS com o provedor HashiCorp AWS.

## Pré-requisitos

- Terraform versão >= 1.2.0
- Provedor AWS da HashiCorp versão ~> 4.16

## Configuração

1. Certifique-se de ter configurado suas credenciais AWS corretamente. Isso pode ser feito através de variáveis de ambiente, arquivo de configuração `~/.aws/credentials`, ou outros métodos suportados pelo provedor AWS da HashiCorp.

2. Faça o download ou clone este repositório para o seu ambiente local.

## Uso

1. Navegue até o diretório onde o código Terraform está localizado.

2. Execute o comando `terraform init` para inicializar o diretório do projeto.

3. Execute o comando `terraform plan` para visualizar as alterações que serão aplicadas na infraestrutura.

4. Execute o comando `terraform apply` para criar a instância EC2.

5. Após a conclusão bem-sucedida, você poderá acessar a instância EC2 criada na região us-west-2 da AWS.

## Personalização

Você pode personalizar o código Terraform de acordo com suas necessidades:

- Altere a região da instância EC2 modificando o valor da variável `region` no bloco `provider`.

- Modifique o tipo de instância EC2 ajustando o valor da variável `instance_type` no bloco `resource "aws_instance" "app_server"`.

- Personalize as tags da instância EC2 ajustando o bloco `tags` no bloco `resource "aws_instance" "app_server"`.

## Limpeza

Após concluir o uso da instância EC2, execute o comando `terraform destroy` para remover a infraestrutura criada.

# Ansible Setup

Este repositório contém o código Ansible para configurar um ambiente com Python, virtualenv, instalação de dependências, criação de um projeto Django e alteração do arquivo de configuração `settings.py`.

## Pré-requisitos

- Ansible instalado no seu sistema.
- Conhecimento básico do Ansible.

## Uso

1. Certifique-se de que os hosts especificados no arquivo de inventário (`hosts`) estão corretamente configurados e acessíveis.

2. Navegue até o diretório onde o código Ansible está localizado.

3. Execute o comando `ansible-playbook playbook.yml` para executar o playbook Ansible.
no meu caso como estava fazendo o playbbok para configurar uma instancia na aws fiz o seguinte comando: ansible-playbook playbook.yml -u ubuntu --private-key iac-lafuente.pem -i hosts.yml

## Tarefas

Este playbook Ansible executa as seguintes tarefas:

1. Instala o Python 3 e o virtualenv usando o módulo `apt`.

2. Instala as dependências Django e Djangorestframework usando o módulo `pip`.

3. Inicia um projeto Django usando o comando `django-admin startproject` e o ambiente virtual ativado.

4. Altera o arquivo `settings.py` do projeto Django para permitir que qualquer host acesse o projeto.

## Personalização

Você pode personalizar o código Ansible de acordo com suas necessidades:

- Adicione ou remova pacotes no bloco `apt` para instalar ou desinstalar dependências adicionais.

- Modifique a lista `name` no bloco `pip` para adicionar ou remover dependências Python.

- Personalize o caminho do arquivo `settings.py` e a expressão regular no bloco `lineinfile` para fazer alterações específicas no arquivo.

## Limpeza

Este playbook Ansible não inclui etapas de limpeza, pois não há ação que precise ser desfeita. No entanto, se você desejar reverter as alterações feitas pelo playbook, você pode criar um playbook adicional para desfazer as alterações ou executar as tarefas manualmente.


