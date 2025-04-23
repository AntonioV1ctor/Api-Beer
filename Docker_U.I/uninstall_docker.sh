#!/bin/bash

# Parar serviços do Docker
echo "Parando o Docker..."
sudo systemctl stop docker

# Remover Docker e Docker Compose
echo "Removendo Docker e Docker Compose..."
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt-get autoremove -y

# Remover arquivos residuais
echo "Removendo arquivos residuais..."
sudo rm -rf /var/lib/docker /etc/docker /var/run/docker.sock
sudo rm -rf /usr/bin/docker-compose

echo "Docker e Docker Compose desinstalados com sucesso!"
