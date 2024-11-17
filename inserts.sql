INSERT INTO USUARIO (Nome, Email, Data_Registro) VALUES ('Yvette Sullivan', 'williamsmargaret@example.net', '2014-10-24'),
('Hannah Turner', 'tiffanylane@example.com', '2012-01-30'),
('Rachel Fisher', 'scottdavenport@example.com', '2014-11-24'),
('Tina Brooks', 'kimberly68@example.net', '2012-07-24'),
('Phyllis Price', 'dgoodman@example.com', '2024-03-26'),
('Justin Church', 'rebekah05@example.com', '2018-08-10'),
('John Bradford', 'kendra82@example.org', '2013-11-08'),
('Norman Gibson', 'christopher25@example.org', '2017-06-15'),
('Mary Mercer', 'teresa37@example.org', '2011-08-21'),
('Natalie Huang', 'yhansen@example.com', '2023-08-11');

INSERT INTO LISTA (Nome, DATA_Criacao, ID_Usuario) VALUES ('can', '2015-08-24', 5),
('agreement', '2013-05-10', 7),
('reality', '2010-10-13', 7),
('indicate', '2016-02-03', 7),
('total', '2022-01-31', 8);

INSERT INTO FILME (Titulo, Duracao, Data_lancamento) VALUES ('Popular parent.', 140, '2004-11-29'),
('Garden cultural.', 163, '2005-05-01'),
('Avoid whom anything.', 162, '2019-04-13'),
('Send light as.', 159, '2020-12-27'),
('Drive be central.', 165, '2008-10-17'),
('Him feeling agency.', 110, '2008-01-26'),
('Daughter source future.', 148, '2017-12-22'),
('Word necessary.', 108, '2015-10-24'),
('Ahead each bar.', 155, '2014-05-01'),
('Push game.', 111, '2006-11-11');

INSERT INTO SERIE (Titulo, Temporadas, Data_lancamento) VALUES ('Behind need.', 3, '2021-07-27'),
('Claim west world.', 4, '2016-04-16'),
('Toward total among.', 6, '2014-05-10'),
('Blue sign radio.', 3, '2021-07-21'),
('Reach source large.', 10, '2020-12-17'),
('You sound.', 10, '2023-08-21'),
('Total within do.', 5, '2004-01-08'),
('Poor growth medical.', 7, '2019-08-16'),
('Born success.', 5, '2000-07-30'),
('Help environment material.', 9, '2015-07-29');

INSERT INTO DIRETOR (Nome, Data_Nascimento) VALUES ('Sherry Reese', '1974-03-28'),
('Shannon Mckay', '1973-03-04'),
('Amber Christensen', '1962-10-02'),
('John Hall', '1962-01-29'),
('Kenneth Stewart', '1949-09-02');

INSERT INTO LISTA_CONTEUDO (ID_Lista, ID_Filme, ID_Serie) VALUES (5, 9, 3),
(4, 2, 1),
(4, 4, 3),
(2, 9, 8),
(1, 1, 8),
(1, 8, 8),
(3, 5, 1),
(5, 2, 6),
(4, 7, 7),
(4, 2, 10),
(5, 8, 6),
(4, 2, 4),
(5, 8, 2),
(5, 5, 8),
(5, 7, 1),
(4, 1, 8),
(4, 7, 6),
(4, 2, 9),
(2, 7, 3),
(3, 10, 9);

INSERT INTO Diretor_Filme (ID_Diretor, ID_Filme) VALUES (4, 9),
(1, 2),
(1, 4),
(4, 9),
(3, 1),
(4, 8),
(4, 5),
(4, 2),
(4, 7),
(4, 2),
(1, 8),
(1, 2),
(3, 8),
(1, 5),
(3, 7),
(3, 1),
(1, 7),
(3, 2),
(3, 7),
(5, 10);

INSERT INTO Diretor_Serie (ID_Diretor, ID_Serie) VALUES (4, 3),
(1, 1),
(1, 3),
(4, 8),
(3, 8),
(4, 8),
(4, 1),
(4, 6),
(4, 7),
(4, 10),
(1, 6),
(1, 4),
(3, 2),
(1, 8),
(3, 1),
(3, 8),
(1, 6),
(3, 9),
(3, 3),
(5, 9);