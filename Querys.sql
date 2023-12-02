-- 1 - Quantas vezes Natalie Portman foi indicada ao Oscar?
SELECT COUNT(*) FROM filmes WHERE nome_do_indicado LIKE '%Natalie Portman%';

-- 2 - Quantos Oscars Natalie Portman ganhou?
SELECT COUNT(*) FROM filmes WHERE nome_do_indicado LIKE '%Natalie Portman%' AND vencedor LIKE '%Sim%';

-- 3 - Amy Adams já ganhou algum Oscar?
SELECT COUNT(*) FROM filmes WHERE nome_do_indicado LIKE '%Amy Adams%' AND vencedor LIKE '%Sim%';

-- 4 - A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT nome_do_indicado, ano_cerimonia FROM filmes WHERE nome_filme LIKE '%Toy Story 3%' AND vencedor LIKE '%Sim%';

-- 5 - A partir de que ano que a categoria "Actress" deixa de existir? 
SELECT MAX(ano_cerimonia) FROM filmes WHERE categoria = 'ACTRESS';

-- 6 - O primeiro Oscar para melhor Atriz foi para quem? Em que ano?
SELECT ano_cerimonia, nome_do_indicado FROM filmes WHERE categoria LIKE '%ACTRESS%' AND vencedor LIKE '%Sim%';
SELECT MIN(ano_cerimonia) FROM filmes WHERE categoria LIKE '%ACTRESS%' AND vencedor LIKE '%Sim%';

-- Comando para tirar restrições
SET SQL_SAFE_UPDATES=0;

-- 7 - Na coluna/campo "Vencedor", altere todos os valores com "Sim" para 1 e todos os valores "Não" para 0.
UPDATE filmes SET vencedor = '1' WHERE vencedor LIKE '%Sim%';
UPDATE filmes SET vencedor = '0' WHERE vencedor LIKE '%Não%';

-- 8 - Em qual edição do Oscar "Crash" ganhou o prêmio principal?
SELECT ano_cerimonia, nome_filme, categoria FROM filmes WHERE nome_filme LIKE '%Crash' AND vencedor LIKE '%1%';

-- 9 - Bom... dê um Oscar para um filme que merece muito, mas não ganhou.
SELECT nome_filme, ano_cerimonia, vencedor FROM filmes WHERE nome_filme LIKE '%Joker%' AND vencedor LIKE '%0%';
UPDATE filmes SET vencedor = '1' WHERE nome_filme LIKE '%Joker%';
SELECT nome_filme, ano_cerimonia, categoria, vencedor FROM filmes WHERE nome_filme LIKE '%Joker%' AND vencedor LIKE '%1%';

-- 10 - O filme Central do Brasil aparece no Oscar?
SELECT * FROM filmes WHERE nome_filme LIKE '%Central do Brasil%';

-- 11 - Inclua no banco 3 filmes que nunca foram nem nomeados ao Oscar, mas que merecem ser. 
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) VALUES
(2014, 2015, '87', 'Melhor Filme', 'Matthew McConaughey', 'Interstellar', '0'),
(2008, 2009, '81', 'Melhor Filme', 'Christian Bale', 'Batman: O Cavaleiro das Trevas', '0'),
(1994, 1995, '67', 'Melhor Filme', 'John Travolta', 'Pulp Fiction', '0');

-- 12 - Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?

SELECT * FROM filmes WHERE ano_cerimonia LIKE "2003" AND categoria LIKE "CINEMATOGRAPHY" AND vencedor LIKE '%1%';
SELECT * FROM filmes WHERE ano_cerimonia LIKE "2003" AND categoria LIKE "%ACTRESS%" AND vencedor LIKE '%1%';
SELECT * FROM filmes WHERE ano_cerimonia LIKE "2003" AND categoria LIKE "%DIRECTING%" AND vencedor LIKE '%1%';

-- 13 - Agora procure 7 atrizes que não sejam americanas, europeias ou brasileiras.  Vamos cadastrá-los no nosso banco com o prêmio que você quiser. 
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor)
VALUES
(2023, 2023, 95, 'Melhor atriz', 'Ava DuVernay', 'The Woman King', 1),
(2022, 2022, 94, 'Melhor atriz coadjuvante', 'Yuh-jung Youn', 'Minari', 1),
(2021, 2021, 93, 'Melhor atriz', 'Chloé Zhao', 'Nomadland', 1),
(2020, 2020, 92, 'Melhor atriz', 'Frances McDormand', 'Nomadland', 1),
(2019, 2019, 91, 'Melhor atriz', 'Olivia Colman', 'The Favourite', 1),
(2018, 2018, 90, 'Melhor atriz', 'Yalitza Aparicio', 'Roma', 1);

-- 16- Agora vamos falar da sua vida. Me diga o nome de uma pessoa que você admira e o que ela fez na sua vida. 
-- Agora me diz: Quê prêmio essa pessoa merece? 
CREATE TABLE IF NOT EXISTS pessoas_admiradas(
    nome VARCHAR(255),
    relacionamento VARCHAR(255),
    motivo VARCHAR(255),
    premio VARCHAR(255)
);

INSERT INTO pessoas_admiradas (nome, relacionamento, motivo, premio) VALUES ('Simone', 'Mãe', 'Ela é uma pessoa forte, resiliente e amorosa. Ela sempre esteve ao meu lado, me apoiando em todos os momentos.', 'Melhor Mãe do Mundo');
INSERT INTO pessoas_admiradas (nome, relacionamento, motivo, premio) VALUES ('Aguinaldo', 'Pai', 'Um homem forte, trabalhador e íntegro. Sempre foi minha maior inspiração do tipo de homem que quero me tornar.', 'Melhor Pai do Mundo');
SELECT * FROM pessoas_admiradas;
