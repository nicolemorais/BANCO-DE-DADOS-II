# Banco de dados II (Atividade 1: Criar 30 consultas.)

# CLASSIFICANDO OS DADOS

USE sakila; 

-- #1 Classificando o primeiro nome dos atores em ordem ascendente

SELECT 
	first_name,
    last_name
FROM
	actor
ORDER BY 
	first_name;

-- #2 Classificando os títulos em ordem ascendente
SELECT 
	title
FROM
	film_list
ORDER BY 
	title;

-- #3 Classificando a categoria em ordem descendente;
SELECT 
	name
FROM
	category
ORDER BY 
	name DESC;

-- #4 Classificando sobrenome dos atores em ordem ascendente
SELECT 
	first_name,
    last_name
FROM
	actor
ORDER BY 
	last_name ;

-- #5 Calculando o subtotal do custo de reposição e o valor dos alugueis dos filmes
SELECT
    replacement_cost,
    price,
    replacement_cost * price as 'subtotal'
FROM
	film_list, film;

# FILTRANDO OS DADOS

-- #6 Filtrando os idiomas disponíveis
SELECT 
    name
FROM
   language
WHERE
    language_id;

-- #7 Filtrando e ordenando os títulos dos filmes por preço determinado

SELECT 
    title,
    description
FROM
	film_list
WHERE
    price = '4.99'
ORDER BY 
	title ;

-- #8 Filtrando atores por ID entre 1 e 23
SELECT 
	actor_id,
    first_name, 
    last_name
FROM
    actor_info
WHERE
    actor_id BETWEEN 1 AND 23
ORDER BY 	
	actor_id;

-- #9 Filtrando e retornando o ator que participa do filme de acordo que o título termina com "TH"
SELECT 
   title,
   first_name,
   last_name
FROM
    actor_info, film
WHERE
    title LIKE '%th'
ORDER BY 
	first_name;

# UNINDO TABELAS

-- #10 Unindo as tabelas 'film' e 'film_text' e retornando os IDs dos filmes do 1 até 23
SELECT
    P.film_id,
    P.title,
    P.description
FROM
  film P
INNER JOIN
  film_text C
ON
  C.film_id = P.film_id
WHERE
    P.film_id BETWEEN 1 AND 23
GROUP BY
  P.film_id;

-- #11 Une as informações das tabelas 'customer' e 'customer_list'
SELECT 
    customer.customer_id,
    first_name,
    email
FROM
    customer
LEFT JOIN customer_list ON 
    customer_list.name = customer.last_name;
 
 # AGRUPANDO TABELAS
 
-- #12 Agrupando as tabelas para retornar os valores, as datas de pagamento e o valores correspondentes
SELECT 
	customer_id,
    payment_date,
    payment_id,
    amount
FROM
    payment
GROUP BY 
	customer_id;

-- #13 Soma do valor total dos alugueis dos filmes por mês
SELECT
	SUM(amount) as TOTAL,
    MONTH(payment_date) as MES
  FROM
    payment
  GROUP BY
    MES;
    
-- #14 Utilizando ROLLUP
SELECT 
    title AS TÍTULO, 
    rating AS CLASSIFICAÇÃO,
    SUM(price) as PREÇO  
FROM
    film_list
GROUP BY 
    title, 
    rating
WITH ROLLUP;

-- #15 Utilizando subquery para verificar os clientes com maiores quantias a pagar 
SELECT 
    payment_id, 
    customer_id, 
    amount
FROM
    payment
WHERE
    amount = (SELECT MAX(amount) FROM payment);

-- #16 alteração do nome da coluna name da tabela language para languages_name
ALTER TABLE language
CHANGE name languages_name char(20);

-- #17 deletado um dado da tabela pelo id correspondente
DELETE FROM inventory WHERE inventory_id = '5';

-- #18 alteração no valor de pagamento
UPDATE  
	payment
SET 
	amount = '34.99' 
WHERE 
	rental_id ='670';

-- #19 União de valores menores que 2 e maiores que 3
SELECT 
	payment_id, amount
FROM 
	payment
where 
	amount <='2.00'
UNION	SELECT 
	payment_id, amount
FROM 
	payment
where
	amount >= '3.00';

-- #20 mudando o nome da coluna
ALTER TABLE 
	actor
CHANGE 
	last_name sobrenome char(20);

-- #21 mudando o nome do cliente
UPDATE  
	customers
SET 
	first_name = 'Heloisa' 
WHERE 
	rental_id ='15';

-- #22 acrescentando uma coluna nova na tabela
ALTER TABLE 
	payment
ADD 
	forma_pagamento varchar(20);
    
-- #23 inserindo valores a coluna nova
UPDATE  
	payment
SET 
	forma_pagamento = 'Cartão de Credito' 
WHERE 
	payment_id <30;
    
-- #24 terminando de inserir valor a coluna
UPDATE  
	payment
SET 
	forma_pagamento = 'Dinheiro' 
WHERE 
	payment_id >70;
    
-- #25  excluindo coluna criada
ALTER TABLE 
	payment
DROP COLUMN 
	forma_pagamento;
    
-- #26 CROSS JOIN entre cidades e paises
SELECT 
    c.city_id,
    c.city,
    y.country_id,
    y.country
FROM
    city c
CROSS JOIN country y ON 
    c.country_id = y.country_id;
    
-- #27 filtro de filmes de acordo com limite de 6 itens em estoque
SELECT
	inventory_id,
    last_update
FROM
  inventory
WHERE
	film_id between 4 and 10
    ORDER BY inventory_id
    limit 6;
    
-- #28 	Mudando nome da tabela
ALTER TABLE film
CHANGE  title title_film char(255);

-- #29
SELECT 
	first_name,
    last_name
FROM
	customer
where active = 'true'
ORDER BY 
	first_name DESC;
    
-- #30 clientes que alugaram com valor maior de 10
SELECT 
	p.customer_id,
    c.first_name,
    c.last_name,
    amount
FROM
	payment p
    inner join customer c
    on
    p.customer_id = c.customer_id
where amount > '10.00'
ORDER BY 
	first_name;
