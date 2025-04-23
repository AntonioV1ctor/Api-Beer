#!/bin/bash

# Atualizar repositórios
echo "Atualizando repositórios..."
sudo apt-get update -y

# Verificar se docker.io está disponível no Kali Linux
echo "Verificando pacotes disponíveis..."
if apt-cache search docker.io | grep -q "docker.io"; then
    echo "Instalando Docker via pacote docker.io..."
    sudo apt-get install -y docker.io

    # Ativar e iniciar o serviço Docker
    echo "Ativando e iniciando o serviço Docker..."
    sudo systemctl enable docker --now

    # Adicionar o usuário ao grupo docker
    echo "Adicionando o usuário ao grupo Docker..."
    sudo usermod -aG docker $USER
else
    echo "Pacote docker.io não encontrado. Instalando docker-ce do repositório oficial..."

    # Adicionar chave GPG e repositório Docker CE
    echo "Adicionando chave GPG e repositório Docker CE..."
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Atualizar repositórios e instalar Docker CE
    echo "Atualizando repositórios e instalando Docker CE..."
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Ativar e iniciar o serviço Docker
    echo "Ativando e iniciando o serviço Docker..."
    sudo systemctl enable docker --now

    # Adicionar o usuário ao grupo docker
    echo "Adicionando o usuário ao grupo Docker..."
    sudo usermod -aG docker $USER
fi

# Verificar a instalação do Docker
echo "Verificando a instalação do Docker..."
docker --version
if [ $? -ne 0 ]; then
    echo "Erro: Docker não foi instalado corretamente."
    exit 1
fi

# Informar o usuário sobre reinício de sessão
echo "Instalação concluída com sucesso!"
echo "OBSERVAÇÃO: Para usar o Docker sem sudo, faça logout e login novamente."
