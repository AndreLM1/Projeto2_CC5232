use project_netflix;

-- ----------------------------- ALGEBRA RELACIONAL ----------------------------
-- item 1 Encontre os nomes de todos os diretores que gravaram mais de 3 filmes.
select count(a.id_diretor) as  Filmes,  a.* from diretor a
left join diretor_filme b on a.id_diretor = b.id_diretor
left join filme c on b.id_filme = c.ID_Filme
group by a.id_diretor
having count(a.id_diretor) > 3;

-- item 2 Mostre todos os Usuários e sua lista e os filmes nessa lista
select  a.nome as Usuario, b.nome as Lista, d.titulo as Filmes  from usuario a
inner join lista b on a.id_usuario = b.id_usuario
inner join lista_conteudo c on b.id_lista = c.id_lista
inner join filme d on c.id_filme = d.id_filme;


-- item 3 Mostre todos os Usuários e sua lista e as series nessa lista
select  a.nome as Usuario, b.id_lista, d.titulo as Series  from usuario a
inner join lista b on a.id_usuario = b.id_usuario
inner join lista_conteudo c on b.id_lista = c.id_lista
inner join serie d on c.id_serie = d.id_serie;


-- 4 Mostre a serie com mais temporadas  de cada lista 
select a.nome as Lista, d.titulo as Serie, d.temporadas as Temporadas from usuario a
left join lista b on a.id_usuario = b.id_usuario
left join lista_conteudo c on b.id_lista = c.id_lista
left join serie d on c.id_serie = d.id_serie
where d.temporadas = (
        select max(s.temporadas)
        from lista_conteudo l
        left join serie s on l.id_serie = s.id_serie
        where l.id_lista = b.id_lista        
);

-- item 5 Liste os filmes que aparecem em mais de uma lista.
select a.titulo as Filme, count(c.id_lista) as Num_Listas  from filme a
left join lista_conteudo b on a.id_filme =  b.id_filme
inner join lista c on b.id_lista = c.id_lista
group by Filme
having count(c.id_lista) > 1;

-- item 6 Qual é a duração média dos filmes de um diretor específico?
select round(avg(a.duracao),2) as Duracao_Media, c.nome as Diretor from filme a
left join diretor_filme b on a.id_filme = b.id_filme
left join diretor c on b.id_diretor = c.id_diretor
where c.nome='Zack Snyder';

-- item 7  Quais são os nomes dos diretores que têm series em listas criadas por um usuário específico?
select a.nome as Diretor, c.titulo as Serie, f.nome as Usuario from diretor a 
left join diretor_serie b on a.id_diretor = b.id_diretor
left join serie c on b.id_serie = c.id_serie 
left join lista_conteudo d on c.id_serie = d.id_serie
left join lista e on d.id_lista = e.id_lista
left join usuario f on e.id_usuario = f.id_usuario
where f.nome="Marcelo";

-- item 8 Liste todos os usuários e suas listas, mas apenas para as listas que contêm pelo menos 5 filmes e 5 series?
select a.nome as Usuario, b.id_lista, count(c.id_filme) as Quantidade_Filmes, count(c.id_serie) as Quantidade_Series  from usuario a
left join lista b on a.id_usuario = b.id_usuario
left join lista_conteudo c on b.id_lista = c.id_lista
group by Usuario, id_lista
having count(c.id_filme) >= 5 and count(c.id_serie) >= 5;

-- item 9 Encontre os nomes dos usuários que têm lista que incluem o filme 'Bastardos Inglorios'.
select a.nome as Usuario, b.nome as Lista, b.DATA_Criacao, d.titulo as Filme from usuario a
left join lista b on a.id_usuario = b.id_usuario
left join lista_conteudo c on b.id_lista = c.id_lista
left join filme d on c.id_filme = d.id_filme
where d.titulo='Bastardos Inglorios';


-- item 10 Qual é o nome do usuario que tem a serie mais recente em sua lista?
select a.nome as Usuario, d.Data_lancamento, d.titulo as Serie  from usuario a
left join lista b on a.id_usuario = b.id_usuario
left join lista_conteudo c on b.id_lista = c.id_lista
left join serie d on c.id_serie = d.id_serie
order by d.data_lancamento desc
limit 1;




