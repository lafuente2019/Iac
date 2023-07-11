#!/bin/bash
cd /home/ubuntu
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo python3 -m pip install ansible
tee -a playbook.yml > /dev/null <<EOT
- hosts: localhost
  tasks:
  - name: Instalando python3 e virtualenv
    apt:
      pkg:
      - python3
      - virtualenv
      update_cache: yes
    become: yes
  - name: Git clone
    ansible.builtin.git: 
      repo: https://github.com/alura-cursos/clientes-leo-api.git
      dest: /home/ubuntu/dependencias
      version: master
      force: yes
  - name: Instalando dependencias com PIP
    pip:
      virtualenv: /home/ubuntu/dependencias/venv
      requirements: /home/ubuntu/dependencias/requirements.txt
  - name: Alterando o hosts do arquivo settings
    lineinfile:
      path: /home/ubuntu/dependencias/setup/settings.py
      regexp: 'ALLOWED_HOSTS'
      line: 'ALLOWED_HOSTS = ["*"]'
      backrefs: yes
  - name: configurando o banco de dados
    shell: '. /home/ubuntu/dependencias/venv/bin/activate;python /home/ubuntu/dependencias/manage.py migrate'
  - name: Carregando dados iniciais
    shell: '. /home/ubuntu/dependencias/venv/bin/activate;python /home/ubuntu/dependencias/manage.py loaddata clientes.json'
  - name: Iniciando servidor
    shell: '. /home/ubuntu/dependencias/venv/bin/activate; nohup python /home/ubuntu/dependencias/manage.py runserver 0.0.0.0:8000 &'  
EOT
ansible-playbook playbook.yml