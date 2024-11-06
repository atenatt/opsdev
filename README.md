# DevOps Toolkit

**DevOps Toolkit** é uma ferramenta projetada para auxiliar engenheiros de DevOps em suas atividades diárias diretamente no terminal. O objetivo é oferecer uma solução portátil, robusta e fácil de usar, com suporte para diversas distribuições Linux, utilizando apenas Docker e Shell Script.

## Características

- **Interface amigável**: Utilizando **whiptail** para criar menus interativos no terminal.
- **Portabilidade**: Funciona em diversas distribuições Linux (Slackware, Ubuntu, Debian, Mint, etc.).
- **Arquitetura modular**: Composta por duas máquinas:
  - **App**: Máquina principal que contém a aplicação.
  - **DB**: Máquina que hospeda o banco de dados **PostgreSQL**.
- **Sistema de usuários**:
  - **Admin**: Acesso total a todas as funcionalidades.
  - **Usuário comum**: Funções limitadas definidas pelo administrador.

## Funcionalidades Planejadas

- **Backup automatizado**.
- **Análise de rede**.
- **Checagem de disco**.
- **Provisionamento de infraestrutura como código (IaC)**.
- **Monitoramento de serviços**.

## Estrutura do Projeto

```plaintext
/devops-toolkit
├── docker-compose.yml      # Orquestração dos serviços
├── app/                    # Aplicação principal
│   ├── Dockerfile          # Configuração do Docker para o App
│   ├── scripts/            # Scripts utilitários
│   └── auth/               # Sistema de autenticação e permissões
├── db/                     # Banco de dados PostgreSQL
│   ├── Dockerfile          # Configuração do Docker para o DB
│   └── init/               # Scripts de inicialização do banco
└── infra/                  # Scripts de provisionamento e monitoramento
```

## Configuração e Execução

### Pré-requisitos

- **Docker** e **Docker Compose** instalados.

### Passos

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/devops-toolkit.git
   cd devops-toolkit
   ```

2. Configure o arquivo `.env`:
   ```plaintext
   DB_USER=devops_admin
   DB_PASSWORD=securepassword
   ```

3. Inicie os serviços:
   ```bash
   docker-compose up --build
   ```

4. Acesse o terminal interativo:
   ```bash
   docker exec -it <app_container> ./scripts/main.sh
   ```

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE).