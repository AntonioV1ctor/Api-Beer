pipeline {
  agent {
    docker {
      image 'ubuntu:latest'
      args 'sudo apt update'
    }

  }
  stages {
    stage('Rvm Install') {
      steps {
        sh '\\curl -sSL https://get.rvm.io | bash -s stable '
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

    stage('') {
      steps {
        echo 'Tudo funcionando perfeitamente!'
      }
    }

  }
}