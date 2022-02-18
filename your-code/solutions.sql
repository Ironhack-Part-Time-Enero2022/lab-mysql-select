USE publications;

-- CHALLENGE 1:
SELECT ta.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS "PUBLISHER"
FROM titleauthor AS ta
LEFT JOIN authors AS a ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
ORDER BY ta.au_id;

-- CHALLENGE 2:
SELECT ta.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", COUNT(t.title) AS "TITLE COUNT"
FROM titles AS t
LEFT JOIN titleauthor AS ta ON t.title_id = ta.title_id
INNER JOIN authors AS a ON ta.au_id = a.au_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY ta.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY ta.au_id DESC;

-- CHALLENGE 3:
SELECT ta.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", sum(s.qty) AS "TOTAL"
FROM titleauthor AS ta
LEFT JOIN authors AS a ON ta.au_id = a.au_id
LEFT JOIN sales AS s ON ta.title_id = s.title_id
GROUP BY ta.au_id
ORDER BY sum(s.qty) DESC
LIMIT 3;

-- CHALLENGE 4:
SELECT ta.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", sum(s.qty) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN sales AS s ON ta.title_id = s.title_id
GROUP BY ta.au_id, a.au_lname, a.au_fname
ORDER BY sum(s.qty) DESC;

