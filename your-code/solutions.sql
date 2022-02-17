USE publications;
--
-- CHALLENGE 1
--
SELECT a.au_id AS `AUTHOR ID`, a.au_lname AS `LAST NAME`, a.au_fname AS `FIRST NAME`, t.title AS `TITLE`, p.pub_name AS `PUBLISHER`
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
INNER JOIN publishers AS p
ON t.pub_id = p.pub_id
ORDER BY a.au_id;
--
-- CHALLENGE 2
--
SELECT a.au_id AS `AUTHOR ID`, a.au_lname AS `LAST NAME`, a.au_fname AS `FIRST NAME`, p.pub_name AS `PUBLISHER`, 
COUNT(DISTINCT t.title) AS `TITLE COUNT`
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
INNER JOIN publishers AS p
ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_id DESC;
--
-- CHALLENGE 3
--
SELECT a.au_id AS `AUTHOR ID`, a.au_lname AS `LAST NAME`, a.au_fname AS `FIRST NAME`, sum(s.qty) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN sales AS s
ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;
--
-- CHALLENGE 4
--
SELECT a.au_id AS `AUTHOR ID`, a.au_lname AS `LAST NAME`, a.au_fname AS `FIRST NAME`, COALESCE(sum(s.qty), 0) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN sales AS s
ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;