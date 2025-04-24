pipeline {
  agent any
  stages {
    stage('Rvm Install') {
      steps {
        sh 'gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'
        sh 'curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles'
        sh 'source ~/.rvm/scripts/rvm'
        echo 'Rvm Instalado com sucesso!'
        sh '''rvm install 3.3.6 &&
rvm use 3.3.6'''
        echo 'Ruby 3.3.6 instalada com sucesso!'
      }
    }

    stage('Installing dependencies') {
      steps {
        sh 'bundle install'
        echo 'Gem\'s Instaladas!'
        sh 'bundle update'
        echo 'Gem\'s Atualizadas!'
      }
    }

    stage('Getting up DB') {
      steps {
        sh 'make run && make setup'
        echo 'Banco de dados criado/migrado com sucesso!'
      }
    }

    stage('Tests') {
      steps {
        sh 'make test_rubocop && make test_Rspec'
        echo 'Testes do Rubocop/Rspec funcionando corretamente!'
      }
    }

    stage('error') {
      steps {
        echo 'Tudo funcionando perfeitamente!'
      }
    }

  }
}