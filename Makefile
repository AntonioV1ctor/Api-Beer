#Makefile by Antônio Victor


#Execuções

.PHONY: help
help:
	@echo "Makefile by Antônio Victor"
	@echo "Comandos Disponiveis:"
	@echo "+==================================Comandos Disponiveis==================================+"
	@echo "| make run --> Inicia o container na porta 3307.					 |"
	@echo "| make stop --> Para o container.  						 	 |"
	@echo "| make help --> Mostra as opções de comando.				 	  	 |"
	@echo "| make test --> Executa os testes do projeto.						 |"
	@echo "| make setup --> Realiza a migração do Banco de Dados.			         	 |"
	@echo "| make acess --> Mostra as rotas de acesso do projeto.					 |"
	@echo "| make clean --> Limpa o container (Vai necessitar da execução do make setup e make run).|"
	@echo "| make docker_config --> Configura o docker caso não esteja funcionando corretamente.	 |"
	@echo "| make rails_up --> Inicia o servidor do rails.					   	 |"
	@echo "| make rails_stop --> Para o servidor do rails.						 |"
	@echo "| make test_rspec --> Executa os testes do projeto.					 |"
	@echo "| make test_rubocop --> Executa o rubocop do projeto.					 |"
	@echo "+========================================================================================+"

.PHONY: run
run:
#sudo dockerd
	docker-compose up -d
	clear
	@echo " Docker-compose iniciado com sucesso!"


.PHONY: stop
stop:
	docker-compose down
	clear
	@echo " Docker-compose parado com sucesso!"

.PHONY: setup
setup:
	bundle install
	rails db:migrate
	clear
	@echo " Migração concluída com sucesso!"


.PHONY: clean
clean:
	@echo " Limpando containers, volumes e imagens não utilizados... "
	docker-compose down --volumes --remove-orphans
	docker system prune -f --volumes
	clear
	@echo " Limpeza concluída com sucesso!"

.PHONY: test
test:
	@echo "Executando Testes"
	bin/rails test

.PHONY: acess
acess:
	@echo "+=============================Rotas de Acesso================================+"
	@echo "|-> Acesse a aplicação em [ http://localhost:9292 ]			     |"				
	@echo "|-> Uma cerveja em especifico em [ ttp://localhost:9292/beers/{id} ]	     |"   
	@echo "|-> Liste todas as Beers em [ http://localhost:9292/beers ]		     |"			
	@echo "|-> Se quiser uma cerveja aleatória em [ http://localhost:9292/beers/random ]|"
	@echo "|-> Se quiser dar verificar o Swagger em [ http://localhost:9292/api-docs ]  |"
	@echo "+============================================================================+"

#Caso o docker/docker-compose não esteje funcionando corretamente no "KALI-LINUX BULLYEAI ROALLING" execute o comando
.PHONY: docker_config
docker_config:
	python3 Docker_U.I/Docker_configs.py

.PHONY: rails_up
rails_up:
	bundle install
	rails s -d
	clear
	@echo " Servidor Rails iniciado com sucesso!"

.PHONY: rails_stop
rails_stop:
	chmod +x kill_rails.py
	python3 kill_rails.py
	clear
	@echo " Servidor parado com sucesso!"
#docker-compose --file '/home/antonio/Documentos/Beer_api_Baikal/beer_api/docker-compose.yml' --project-name 'beer_api' down 

.PHONY: test_rubocop
test_rubocop:
	bundle exec rubocop

.PHONY: test_rspec
test_rspec:
	bundle exec rspec