# Projeto2_CC5232
Projeto 2 da matéria Banco de Dados (CC5232)


# Integrantes 
Andre Lourenco Marques - 11.120.386-5

Henrique Barros Simões - 11.120.157-0

Leonardo Martins Qualharello - 11.120.470-7

# Modelo Entidade-Relacional

![Modelo Entidade-Relacional](MER2.png)

# Modelo Relacional

![Modelo Relacional](MR2.png)

# Como rodar o código 

  - O arquivo query_tables.sql contém todas as queries necessárias para a construção do projeto.
  - O arquivo algebra_relacional.sql contém todas as queries necessárias para tratar as questões de algebra relacional do projeto 
      - O arquivo conecta.py contém o código para a geração de dados aleatórios.

    1° Importe os arquivos "query_tables.sql" e "algebra_relacional.sql" dentro do seu banco, execute os comandos:
       - **CREATE DATABASE  IF NOT EXISTS `project_netflix`;**
       - **USE `project_netflix`;**
       - Esses códigos estão no arquivo "query_tables.sql", e são responsáveis para criar um novo database.

    2° Para a inserção dos dados aleatórios:
      - Execute o seguinte código no terminal do windows: ** pip install faker**
      - Importe o arquivo conecta.py no vscode
      - Execute o arquivo conecta.py
      - Irá gerar um arquivo chamado seeder.sql no próprio vscode
      - Se preferir,há um arquivo dados_aleatorios.sql na branch.
      - Importe o arquivo dados_aleatorios.sql no banco de dados. Na primeira linha do arquivo escreva o comando **USE `project_netflix`;** e execute, agora é só executar o resto das queries de inserção
      

    3° Volte para o banco de dados e execute as queries do arquivo "algebra_relacional.sql"
  



