USE publications;

SELECT a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name
FROM publishers as p 
JOIN authors as a
ON a.state = p.state
JOIN titles as t
ON p.pub_id = t.pub_id;

SELECT distinct pub_name
FROM publishers
GROUP BY pub_id;



