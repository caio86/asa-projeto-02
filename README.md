**Projeto 02 - Docker com Vagrant e Ansible**

Repositorio com a infraestrutura completa para subir o Wordpress usando Vagrant, Ansible e Docker.

**Estrutura do Projeto**
- `Vagrantfile`: cria a VM Debian, configura IP/hostname e chama o Ansible local.
- `playbook_ansible.yml`: atualiza o sistema, instala Docker, copia o `docker-compose.yml` para `/opt` e executa `docker compose up -d`.
- `docker-compose.yml`: define os containers `webproxy` (Nginx customizado), `webserver` (Wordpress) e `database` (MySQL) com volumes persistentes.
- `Dockerfile`: gera a imagem customizada do Nginx baseada em `nginx:stable-alpine`, instalando `curl` e `ping`.
- `nginx.conf`: configuracao de proxy L4 no bloco `stream`, encaminhando para `webserver:80`.
- `flake.nix` e `flake.lock`: definem ambiente de desenvolvimento opcional com Nix.
- `docker-compose.yml`, `nginx.conf`, `playbook_ansible.yml`, `Vagrantfile`: entregaveis principais do projeto.

**Configuracoes Atuais**
- Hostname da VM: `caio.gabriel`
- IP da VM: `192.168.56.122`
- Imagem do proxy: `caio86/asa-projeto-02-webproxy`

**Requisitos**
- VirtualBox
- Vagrant
- Ansible instalado na maquina host (usado pelo provisioner do Vagrant)
- Docker Hub para publicar a imagem do `webproxy`

**Como Executar**

1. Suba a VM e rode o provisionamento:

```bash
vagrant up
```

2. Acesse no navegador:

```
http://192.168.56.122:8080
```

**Observacoes**
- O `webproxy` expoe apenas a porta `8080` no host da VM e encaminha para `webserver:80`.
- O `docker-compose.yml` cria volumes persistentes `app` (Wordpress) e `my` (MySQL).
