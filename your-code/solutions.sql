USE publications;

-- Query 1

SELECT aut.au_id AS author_id, aut.au_lname AS last_name, aut.au_fname AS first_name, title, pub.pub_name AS publishers
FROM authors AS aut
INNER JOIN titleauthor AS tit ON aut.au_id = tit.au_id
INNER JOIN titles AS t ON tit.title_id = t.title_id
INNER JOIN publishers AS pub ON t.pub_id = pub.pub_id;

-- Query 2

SELECT aut.au_id AS author_id, aut.au_lname AS last_name, aut.au_fname AS first_name, pub.pub_name AS publishers, COUNT(title) AS title_count
FROM authors AS aut
INNER JOIN titleauthor AS tit ON aut.au_id = tit.au_id
INNER JOIN titles AS t ON tit.title_id = t.title_id
INNER JOIN publishers AS pub ON t.pub_id = pub.pub_id
GROUP BY aut.au_id, pub.pub_name
ORDER BY title_count DESC;

-- Query 3

SELECT aut.au_id AS author_id, aut.au_lname AS last_name, aut.au_fname AS first_name, SUM(s.qty) AS total
FROM authors AS aut
LEFT JOIN titleauthor AS tit ON aut.au_id = tit.au_id
LEFT JOIN titles AS t ON tit.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY aut.au_id
ORDER BY total DESC
LIMIT 3;

-- Query 4

SELECT aut.au_id AS author_id, aut.au_lname AS last_name, aut.au_fname AS first_name, IFNULL(SUM(s.qty),0) AS total
FROM authors AS aut
LEFT JOIN titleauthor AS tit ON aut.au_id = tit.au_id
LEFT JOIN titles AS t ON tit.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY aut.au_id
ORDER BY total DESC;

