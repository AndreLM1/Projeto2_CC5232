from faker import Faker
import random

# Inicializando o Faker e as variáveis de quantidade de registros para cada tabela
fake = Faker()
num_usuarios = 10
num_listas = 20
num_filmes = 15
num_series = 15
num_diretores = 10
num_lista_conteudo = 20
num_diretor_filme = 10
num_diretor_serie = 10

# Variável para armazenar o conteúdo SQL
sql_content = ""

# Tabela USUARIO
sql_content += "-- Dados para a tabela USUARIO\n"
for i in range(1, num_usuarios + 1):
    nome = fake.name()
    email = fake.unique.email()
    data_registro = fake.date_this_year()
    sql_content += f"INSERT INTO USUARIO (Nome, Email, Data_Registro) VALUES ('{nome}', '{email}', '{data_registro}');\n"

# Tabela LISTA
sql_content += "\n-- Dados para a tabela LISTA\n"
for i in range(1, num_listas + 1):
    duracao = f"{random.randint(1, 3)}:{random.randint(0, 59):02}"  # Formato de duração como horas:minutos
    data_criacao = fake.date_this_year()
    id_usuario = random.randint(1, num_usuarios)
    sql_content += f"INSERT INTO LISTA (Duracao, DATA_Criacao, ID_Usuario) VALUES ('{duracao}', '{data_criacao}', {id_usuario});\n"

# Tabela FILME
sql_content += "\n-- Dados para a tabela FILME\n"
for i in range(1, num_filmes + 1):
    titulo = fake.sentence(nb_words=3)
    duracao = random.randint(60, 180)  # Duração entre 60 e 180 minutos
    data_lancamento = fake.date_this_century()
    sql_content += f"INSERT INTO FILME (Titulo, Duracao, Data_lancamento) VALUES ('{titulo}', {duracao}, '{data_lancamento}');\n"

# Tabela SERIE
sql_content += "\n-- Dados para a tabela SERIE\n"
for i in range(1, num_series + 1):
    titulo = fake.sentence(nb_words=3)
    duracao = random.randint(20, 60)  # Duração entre 20 e 60 minutos por episódio
    data_lancamento = fake.date_this_century()
    sql_content += f"INSERT INTO SERIE (Titulo, Duracao, Data_lancamento) VALUES ('{titulo}', {duracao}, '{data_lancamento}');\n"

# Tabela DIRETOR
sql_content += "\n-- Dados para a tabela DIRETOR\n"
for i in range(1, num_diretores + 1):
    nome = fake.name()
    data_nascimento = fake.date_of_birth(minimum_age=30, maximum_age=70)
    sql_content += f"INSERT INTO DIRETOR (Nome, Data_Nascimento) VALUES ('{nome}', '{data_nascimento}');\n"

# Tabela LISTA_CONTEUDO
sql_content += "\n-- Dados para a tabela LISTA_CONTEUDO\n"
for i in range(1, num_lista_conteudo + 1):
    id_lista = random.randint(1, num_listas)
    id_filme = random.randint(1, num_filmes) if random.choice([True, False]) else 'NULL'
    id_serie = random.randint(1, num_series) if id_filme == 'NULL' else 'NULL'  # Escolhe filme ou série, mas não ambos
    sql_content += f"INSERT INTO LISTA_CONTEUDO (ID_Lista, ID_Filme, ID_Serie) VALUES ({id_lista}, {id_filme}, {id_serie});\n"

# Tabela Diretor_Filme
sql_content += "\n-- Dados para a tabela Diretor_Filme\n"
diretor_filmes = set()
while len(diretor_filmes) < num_diretor_filme:
    id_diretor = random.randint(1, num_diretores)
    id_filme = random.randint(1, num_filmes)
    if (id_diretor, id_filme) not in diretor_filmes:
        diretor_filmes.add((id_diretor, id_filme))
        sql_content += f"INSERT INTO Diretor_Filme (ID_Diretor, ID_Filme) VALUES ({id_diretor}, {id_filme});\n"

# Tabela Diretor_Serie
sql_content += "\n-- Dados para a tabela Diretor_Serie\n"
diretor_series = set()
while len(diretor_series) < num_diretor_serie:
    id_diretor = random.randint(1, num_diretores)
    id_serie = random.randint(1, num_series)
    if (id_diretor, id_serie) not in diretor_series:
        diretor_series.add((id_diretor, id_serie))
        sql_content += f"INSERT INTO Diretor_Serie (ID_Diretor, ID_Serie) VALUES ({id_diretor}, {id_serie});\n"

# Salva o conteúdo em um arquivo SQL
with open("dados_aleatorios.sql", "w") as file:
    file.write(sql_content)

print("Arquivo SQL gerado com sucesso!")
