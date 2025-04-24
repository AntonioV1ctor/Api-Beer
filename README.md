# 🚀 BEER-API Test Ci

API desenvolvida em **Ruby on Rails** para integração e gerenciamento de sistemas.
Esse é um mesmo repositório do Beer-Api porém com CI usando Jenkins.
---

## 🛠️ Tecnologias Utilizadas

- **Ruby**: Versão 3.3.6  
- **Controle de Versão**: RVM  
- **Rails**: Versão 8.0.1  
- **Documentação**: Swagger  
- **Verificação de Código**: Rubocop  
- **Testes**: Rspec  

---

## 📋 Acessos da API

- **URL Base**: `http://localhost:3000`  
- **Documentação**: Acesse `http://localhost:3000/api-docs` para interagir com a API via Swagger.  

---

## 🚀 Como Executar

### 1. **Instale o Ruby**  
Certifique-se de ter o Ruby 3.3.6 instalado. Recomendamos o uso do RVM:

```bash
rvm install 3.3.6
rvm use 3.3.6

2. Instale as Dependências

No diretório do projeto, execute:

bundle install

3. Configure o Banco de Dados

Crie e migre o banco de dados:

make run
make setup

4. Execute a API

Inicie o servidor:

make rails_up

Pare o Servidor:

make rails_down

🧪 Testes
Rubocop

Verifique o estilo do código:

Rubocop:

make test_rubocop

Rspec:

make test_Rspec

```
---
#### Essa API foi feita e testada por Antônio Victor 👨‍💻
#### Contato: [antoniocvictor.me@gmail.com]

