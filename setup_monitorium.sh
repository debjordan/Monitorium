#!/bin/bash

# Define a pasta do projeto
PROJECT_DIR="Monitorium"
PROMETHEUS_CONFIG="prometheus.yml"
DOCKER_COMPOSE="docker-compose.yml"
GITIGNORE=".gitignore"

echo "Criando o diretório do projeto: $PROJECT_DIR"
mkdir -p $PROJECT_DIR && cd $PROJECT_DIR

echo "Criando o arquivo docker-compose.yml"
cat > $DOCKER_COMPOSE <<EOL
services:
  prometheus:
    image: prom/prometheus
    container_name: prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
    networks:
      - monitorium_network

  grafana:
    image: grafana/grafana
    container_name: grafana
    ports:
      - "3000:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
    depends_on:
      - prometheus
    networks:
      - monitorium_network

networks:
  monitorium_network:
    driver: bridge
EOL

echo "Criando o arquivo prometheus.yml"
cat > $PROMETHEUS_CONFIG <<EOL
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['prometheus:9090']
EOL

echo "Subindo os containers com Docker Compose"
docker-compose up -d

echo "Status dos containers:"
docker-compose ps

echo "Projeto Monitorium configurado com sucesso!"
