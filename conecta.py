import random
from faker import Faker
from datetime import datetime, timedelta

# Inicializando o Faker
faker = Faker()

# Quantidade de registros que você deseja gerar
NUM_USUARIOS = 10
NUM_LISTAS = 15
NUM_FILMES = 20
NUM_SERIES = 15
NUM_DIRETORES = 10

# Funções para gerar dados
def gerar_dados_usuarios(num):
    usuarios = []
    for _ in range(num):
        nome = faker.name()
        email = faker.unique.email()
        data_registro = faker.date_between(start_date="-2y", end_date="today")
        usuarios.append((nome, email, data_registro))
    return usuarios

def gerar_dados_listas(num, usuarios_ids):
    listas = []
    for _ in range(num):
        data_criacao = faker.date_between(start_date="-1y", end_date="today")
        id_usuario = random.choice(usuarios_ids)
        listas.append((data_criacao, id_usuario))
    return listas

def gerar_dados_filmes(num):
    filmes = []
    for _ in range(num):
        titulo = faker.catch_phrase()
        duracao = random.randint(80, 180)  # duração entre 80 e 180 minutos
        data_lancamento = faker.date_between(start_date="-30y", end_date="today")
        filmes.append((titulo, duracao, data_lancamento))
    return filmes

def gerar_dados_series(num):
    series = []
    for _ in range(num):
        titulo = faker.catch_phrase()
        temporadas = random.randint(1, 12)
        data_lancamento = faker.date_between(start_date="-30y", end_date="today")
        series.append((titulo, temporadas, data_lancamento))
    return series

def gerar_dados_diretores(num):
    diretores = []
    for _ in range(num):
        nome = faker.name()
        data_nascimento = faker.date_of_birth(minimum_age=25, maximum_age=80)
        diretores.append((nome, data_nascimento))
    return diretores

# Gerando dados
usuarios = gerar_dados_usuarios(NUM_USUARIOS)
usuarios_ids = list(range(1, NUM_USUARIOS + 1))
listas = gerar_dados_listas(NUM_LISTAS, usuarios_ids)
filmes = gerar_dados_filmes(NUM_FILMES)
series = gerar_dados_series(NUM_SERIES)
diretores = gerar_dados_diretores(NUM_DIRETORES)

# Gerando comandos SQL para inserir os dados
def gerar_comandos_insert(tabela, dados):
    comandos = []
    for dado in dados:
        valores = ", ".join(f"'{valor}'" if isinstance(valor, str) or isinstance(valor, datetime) else str(valor) for valor in dado)
        comandos.append(f"INSERT INTO {tabela} VALUES (NULL, {valores});")
    return comandos

# Gerando os comandos
comandos_usuarios = gerar_comandos_insert("USUARIO", usuarios)
comandos_listas = gerar_comandos_insert("LISTA", listas)
comandos_filmes = gerar_comandos_insert("FILME", filmes)
comandos_series = gerar_comandos_insert("SERIE", series)
comandos_diretores = gerar_comandos_insert("DIRETOR", diretores)

# Salvando os comandos em um arquivo
with open("inserts.sql", "w") as file:
    file.write("-- Comandos para a tabela USUARIO\n")
    file.write("\n".join(comandos_usuarios) + "\n\n")
    file.write("-- Comandos para a tabela LISTA\n")
    file.write("\n".join(comandos_listas) + "\n\n")
    file.write("-- Comandos para a tabela FILME\n")
    file.write("\n".join(comandos_filmes) + "\n\n")
    file.write("-- Comandos para a tabela SERIE\n")
    file.write("\n".join(comandos_series) + "\n\n")
    file.write("-- Comandos para a tabela DIRETOR\n")
    file.write("\n".join(comandos_diretores) + "\n")

print("Comandos gerados e salvos no arquivo 'inserts.sql'.")
