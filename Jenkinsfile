pipeline {
    agent {
        docker {
            image 'ruby:3.3.6-alpine'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    
    stages {
        stage('Preparação') {
            steps {
                checkout scm
                sh 'apk add --no-cache docker docker-compose mysql-client build-base libxml2-dev libxslt-dev git'
            }
        }
        
        stage('Configuração do Ambiente') {
            steps {
                sh 'docker-compose up -d db'
                
                sh '''
                    for i in {1..30}; do
                      if mysqladmin ping -h localhost -P 3307 -u root -proot --silent; then
                        echo "MySQL está pronto!"
                        break
                      fi
                      echo "Aguardando MySQL inicializar... ($i/30)"
                      sleep 2
                    done
                '''
            }
        }
        
        stage('Instalação de Dependências') {
            steps {
                sh 'bundle install --jobs=4 --retry=3'
            }
        }
        
        stage('Configuração do Banco de Dados') {
            steps {
                sh '''
                cat > config/database.yml << EOL
test:
  adapter: mysql2
  host: localhost
  port: 3307
  database: beer_api_test
  username: root
  password: root
  encoding: utf8mb4
EOL
                '''
                

                sh 'bundle exec rails db:create'
                sh 'bundle exec rails db:migrate'
            }
        }
        
        stage('Testes') {
            steps {
                sh 'bundle exec rspec'
            }
            post {
                always {
                    junit 'spec/reports/*.xml'
                }
            }
        }
        
        stage('Análise de Código') {
            parallel {
                stage('Rubocop') {
                    steps {
                        sh 'bundle exec rubocop --format progress'
                    }
                }
            }
        }
    }
    
    post {
        always {
            sh 'docker-compose down'
            cleanWs()
        }
        success {
            echo 'Pipeline executado com sucesso!'
        }
        failure {
            echo 'Pipeline falhou. Verifique os logs para mais detalhes.'
        }
    }
}