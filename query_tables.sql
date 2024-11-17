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
     Nome VARCHAR(255) NOT NULL,
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
     Temporadas INT NOT NULL,
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
 
 
 -- Dados para inserção e funcionamento das queries
 -- Diretores:
insert into diretor(Nome, Data_Nascimento) values
('Quentin Tarantino','1963-03-27'),
('Zack Snyder','1966-03-01'),
('Shonda Lynn Rhimes','1970-01-13'),
('Bryan Cranston','1956-03-07'),
('Eric Kripke','1974-04-24'),
('Kevin S. Bright','1954-10-15'),
('Charles Michael Levine','1952-10-18'),
('Eric Kripke','1974-04-24');


-- Filmes:
insert into FILME(titulo, duracao, data_lancamento) values 
('Os Oito Odiados',187,'2016-01-07'),
('Bastardos Inglórios',153,'2009-10-09'),
('Liga da Justiça de Zack Snyder',242,'2019-03-18'),
('Watchmen - O Filme',265,'2009-03-06'),
('300',94,'2007-03-09'),
('Aquaman',134,'2018-12-13');

-- Series:
insert into SERIE(titulo, temporadas, data_lancamento) values
('Greys Anatomy ',21,'2005-03-27'),
('The Office ',9,'2005-03-24'),
('Supernatural ',15,'2005-09-13'),
('Friends ',10,'1994-09-22'),
('The Big Bang Theory',12,'2007-09-24'),
('The Boys',4,'2019-07-26');

-- Diretor_Filme
insert into diretor_filme(id_diretor, id_filme) values
(1,1),
(1,2),
(2,3),
(2,4),
(2,5),
(2,6);

-- Diretor_Serie
insert into diretor_serie(id_diretor, id_serie) values
(4,2),
(3,1),
(5,3),
(6,4),
(7,5),
(8,6);

-- Usuario
insert into usuario(nome, email, data_registro) values
('Andre Marques','andre@gmail','2020-01-27'),
('Marcelo','marcelo@gmail','2020-04-01');

-- Lista
insert into lista(nome, data_criacao, id_usuario) values
('Minha Lista','2020-01-27',1),
('Meus Filmes','2020-04-14',2);

-- Lista_Conteudo
insert into lista_conteudo(id_lista, id_filme, id_serie) values
(1,1,NULL),
(1,3,NULL),
(1,4,NULL),
(2,4,NULL),
(1,NULL,1),
(2,3,NULL),
(1,2,NULL),
(2,2,NULL),
(2,NULL,2),
(2,NULL,3),
(1,5,NULL),
(1,6,NULL),
(1,NULL,2),
(1,NULL,3),
(1,NULL,4),
(1,NULL,5),
(2,NULL,6);

select * from filme;
select * from serie;
select * from diretor;
select * from diretor_filme;
select * from diretor_serie;
select * from usuario;
select * from lista;
select * from lista_conteudo;
















 

-- drop table diretor;
-- drop table serie;
-- drop table diretor_filme;
-- drop table diretor_serie;
-- drop table lista;
-- drop table lista_conteudo;




