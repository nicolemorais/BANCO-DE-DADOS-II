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
	first_name ASC;

-- #2 Classificando os títulos em ordem ascendente
SELECT 
	title
FROM
	film_list
ORDER BY 
	title ASC;

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
	last_name ASC;

-- #5 Calculando o subtotal do custo de reposição e o valor dos alugueis dos filmes e ordernando em forma descentente
SELECT
	replacement_cost, 
    price,
    replacement_cost * price AS subtotal
FROM
	film_list, film
ORDER BY 
	replacement_cost * price DESC;

# FILTRANDO OS DADOS

-- #6 Filtrando os idiomas disponíveis
SELECT 
    name
FROM
   language
WHERE
    language_id;

-- #7 Filtrando e ordenando os títulos dos filmes por preço

SELECT 
    title,
    description
FROM
	film_list
WHERE
    price = '4.99'
ORDER BY 
	title ASC;

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
    SUM(price) PREÇO  
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

-- #16

-- #17 

-- #18

-- #19

-- #20

-- #21

-- #22

-- #23

-- #24

-- #25

-- #26

-- #27 

-- #28

-- #29

-- #30

