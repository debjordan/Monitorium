# Monitorium

Monitorium é uma plataforma de monitoramento e visualização de métricas utilizando **Prometheus** para coleta de dados e **Grafana** para visualização.

## Tecnologias Utilizadas

- **Docker**: Para containerização dos serviços.
- **Docker Compose**: Para orquestrar os containers do Prometheus, Grafana e outros serviços.
- **Prometheus**: Sistema de monitoramento e coleta de métricas.
- **Grafana**: Plataforma de visualização de métricas.

## Estrutura do Projeto

O projeto é composto pelos seguintes serviços:

- **Prometheus**: Responsável pela coleta de métricas dos serviços monitorados.
- **Grafana**: Utilizado para criar dashboards e visualizar as métricas coletadas pelo Prometheus.
  
## Pré-requisitos

Antes de rodar o projeto, é necessário ter o Docker e o Docker Compose instalados no seu sistema.

- **Docker**: [Instruções de instalação](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Instruções de instalação](https://docs.docker.com/compose/install/)

## Como Rodar o Projeto

### 1. Clone o repositório

```bash
git clone https://github.com/debjordan/Monitorium.git
cd Monitorium
2. Suba os containers usando Docker Compose
Execute o seguinte comando para iniciar o ambiente de monitoramento:

docker-compose up -d
3. Acesse as aplicações
Grafana: http://localhost:3000
Prometheus: http://localhost:9090
As credenciais padrão do Grafana são:

Usuário: admin
Senha: admin
4. Configuração do Grafana
Após acessar o Grafana, você pode adicionar o Prometheus como uma fonte de dados:

Vá até "Configurações" -> "Fontes de Dados".
Adicione o Prometheus como fonte de dados, com a URL http://prometheus:9090.
5. Dashboards
Você pode criar ou importar dashboards para visualizar as métricas de forma mais detalhada. O Grafana possui diversos dashboards prontos para Prometheus, ou você pode customizar o seu próprio.

Comandos Úteis
Para parar os containers:

docker-compose down
Para ver os logs de um container específico (exemplo: Grafana):

docker-compose logs grafana
Estrutura dos Arquivos
docker-compose.yml: Arquivo de configuração do Docker Compose, que define os containers e redes.
Dockerfile: Arquivo para construção de imagens personalizadas, caso necessário.
prometheus.yml: Arquivo de configuração do Prometheus, que define quais endpoints ele deve monitorar.
