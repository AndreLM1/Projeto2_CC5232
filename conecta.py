import random
import faker
from datetime import datetime, timedelta

# Instanciando o gerador de dados aleatórios
fake = faker.Faker()

# Função para gerar data aleatória dentro de um intervalo
def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

# Função para gerar valores aleatórios para a tabela USUARIO
def generate_usuario(num_records):
    usuarios = []
    for _ in range(num_records):
        nome = fake.name()
        email = fake.email()
        data_registro = random_date(datetime(2010, 1, 1), datetime(2024, 11, 1)).date()
        usuarios.append(f"('{nome}', '{email}', '{data_registro}')")
    return usuarios

# Função para gerar valores aleatórios para a tabela LISTA
def generate_lista(num_records, max_usuario_id):
    listas = []
    for _ in range(num_records):
        nome = fake.word()
        data_criacao = random_date(datetime(2010, 1, 1), datetime(2024, 11, 1)).date()
        usuario_id = random.randint(1, max_usuario_id)
        listas.append(f"('{nome}', '{data_criacao}', {usuario_id})")
    return listas

# Função para gerar valores aleatórios para a tabela FILME
def generate_filme(num_records):
    filmes = []
    for _ in range(num_records):
        titulo = fake.sentence(nb_words=3)
        duracao = random.randint(90, 180)  # Duracao em minutos
        data_lancamento = random_date(datetime(2000, 1, 1), datetime(2024, 11, 1)).date()
        filmes.append(f"('{titulo}', {duracao}, '{data_lancamento}')")
    return filmes

# Função para gerar valores aleatórios para a tabela SERIE
def generate_serie(num_records):
    series = []
    for _ in range(num_records):
        titulo = fake.sentence(nb_words=3)
        temporadas = random.randint(1, 10)
        data_lancamento = random_date(datetime(2000, 1, 1), datetime(2024, 11, 1)).date()
        series.append(f"('{titulo}', {temporadas}, '{data_lancamento}')")
    return series

# Função para gerar valores aleatórios para a tabela DIRETOR
def generate_diretor(num_records):
    diretores = []
    for _ in range(num_records):
        nome = fake.name()
        data_nascimento = random_date(datetime(1940, 1, 1), datetime(1980, 1, 1)).date()
        diretores.append(f"('{nome}', '{data_nascimento}')")
    return diretores

# Função para gerar dados para as tabelas intermediárias (M:N)
def generate_relacao_mn(num_records, max_lista_id, max_filme_id, max_serie_id, max_diretor_id):
    relacoes_lista_conteudo = []
    relacoes_diretor_filme = []
    relacoes_diretor_serie = []

    for _ in range(num_records):
        lista_id = random.randint(1, max_lista_id)
        filme_id = random.randint(1, max_filme_id)
        serie_id = random.randint(1, max_serie_id)
        diretor_id = random.randint(1, max_diretor_id)

        relacoes_lista_conteudo.append(f"({lista_id}, {filme_id}, {serie_id})")
        relacoes_diretor_filme.append(f"({diretor_id}, {filme_id})")
        relacoes_diretor_serie.append(f"({diretor_id}, {serie_id})")

    return relacoes_lista_conteudo, relacoes_diretor_filme, relacoes_diretor_serie

# Função para gerar o arquivo SQL
def generate_sql():
    # Quantidade de registros
    num_usuarios = 10
    num_listas = 5
    num_filmes = 10
    num_series = 10
    num_diretores = 5
    num_relacoes = 20
    
    # Gerar os dados aleatórios
    usuarios = generate_usuario(num_usuarios)
    listas = generate_lista(num_listas, num_usuarios)
    filmes = generate_filme(num_filmes)
    series = generate_serie(num_series)
    diretores = generate_diretor(num_diretores)
    
    # IDs máximos para as relações M:N
    max_usuario_id = num_usuarios
    max_lista_id = num_listas
    max_filme_id = num_filmes
    max_serie_id = num_series
    max_diretor_id = num_diretores
    
    # Gerar as relações M:N
    lista_conteudo, diretor_filme, diretor_serie = generate_relacao_mn(num_relacoes, max_lista_id, max_filme_id, max_serie_id, max_diretor_id)
    
    # Gerar o arquivo SQL
    sql = []
    
    sql.append("INSERT INTO USUARIO (Nome, Email, Data_Registro) VALUES " + ",\n".join(usuarios) + ";")
    sql.append("INSERT INTO LISTA (Nome, DATA_Criacao, ID_Usuario) VALUES " + ",\n".join(listas) + ";")
    sql.append("INSERT INTO FILME (Titulo, Duracao, Data_lancamento) VALUES " + ",\n".join(filmes) + ";")
    sql.append("INSERT INTO SERIE (Titulo, Temporadas, Data_lancamento) VALUES " + ",\n".join(series) + ";")
    sql.append("INSERT INTO DIRETOR (Nome, Data_Nascimento) VALUES " + ",\n".join(diretores) + ";")
    
    sql.append("INSERT INTO LISTA_CONTEUDO (ID_Lista, ID_Filme, ID_Serie) VALUES " + ",\n".join(lista_conteudo) + ";")
    sql.append("INSERT INTO Diretor_Filme (ID_Diretor, ID_Filme) VALUES " + ",\n".join(diretor_filme) + ";")
    sql.append("INSERT INTO Diretor_Serie (ID_Diretor, ID_Serie) VALUES " + ",\n".join(diretor_serie) + ";")
    
    # Salvar em um arquivo .sql
    with open("inserts.sql", "w") as f:
        f.write("\n\n".join(sql))
    
    print("Arquivo SQL gerado com sucesso!")

# Chamar a função para gerar o arquivo SQL
generate_sql()
