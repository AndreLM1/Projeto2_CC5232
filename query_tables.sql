use project_netflix;

-- Criação das tabelas
 CREATE TABLE USUARIO (
     ID_Usuario INT PRIMARY KEY auto_increment,
     Nome VARCHAR(255) NOT NULL,
     Email VARCHAR(255) UNIQUE NOT NULL,
     Data_Registro DATE NOT NULL
 );
 
  CREATE TABLE LISTA (
     ID_Lista INT PRIMARY KEY auto_increment,
     Duracao VARCHAR(255) NOT NULL,
     DATA_Criacao DATE NOT NULL,
     ID_Usuario INT,
     FOREIGN KEY (ID_Usuario) REFERENCES USUARIO(ID_Usuario)
     ON UPDATE CASCADE ON DELETE CASCADE
 );

CREATE TABLE FILME (
     ID_Filme INT PRIMARY KEY auto_increment,
     Titulo VARCHAR(255) NOT NULL,
     Duracao INT NOT NULL,
     Data_lancamento DATE NOT NULL
 );
 
 CREATE TABLE SERIE (
     ID_Serie INT PRIMARY KEY auto_increment,
     Titulo VARCHAR(255) NOT NULL,
     Duracao INT NOT NULL,
     Data_lancamento DATE NOT NULL
 );

 CREATE TABLE DIRETOR (
     ID_Diretor INT PRIMARY KEY auto_increment,
     Nome VARCHAR (255) NOT NULL, 
     Data_Nascimento DATE NOT NULL
 );

 -- Tabela intermediária para relação M:N
 CREATE TABLE LISTA_CONTEUDO(
	ID_Lista INT,
    ID_Filme INT,
    ID_Serie INT,
    PRIMARY KEY (ID_Lista),
	FOREIGN KEY (ID_Lista) REFERENCES LISTA(ID_Lista)
	ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_Filme) REFERENCES FILME(ID_Filme)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_Serie) REFERENCES SERIE(ID_Serie)
    ON UPDATE CASCADE ON DELETE CASCADE
 );
 
 -- Tabela intermediária para relação M:N
 CREATE TABLE Diretor_Filme(
	ID_Diretor INT,
    ID_Filme INT,
    FOREIGN KEY (ID_Diretor) REFERENCES DIRETOR(ID_Diretor)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_Filme) REFERENCES FILME(ID_Filme)
    ON UPDATE CASCADE ON DELETE CASCADE
 );

CREATE TABLE Diretor_Serie(
	ID_Diretor INT,
    ID_Serie INT,
    FOREIGN KEY (ID_Diretor) REFERENCES DIRETOR(ID_Diretor)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_Serie) REFERENCES SERIE(ID_Serie)
    ON UPDATE CASCADE ON DELETE CASCADE
 );
 
 
 insert into diretor(Nome, Data_Nascimento) values
('Taranti', '1979-07-27');

