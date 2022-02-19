USE publications;

SHOW TABLES; -- ejercicio 1: 

SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_name
ORDER BY au_id;

-- Ejercicio 2: 

SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(titles.title)
FROM titles
LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY titleauthor.au_id DESC;

-- ejercicio 3: 

SELECT authors.au_id, authors.au_lname, authors.au_fname, sales.qty
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty)
LIMIT 3; 