USE publications;

SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id  = authors.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;


SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id  = authors.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, publishers.pub_name
ORDER BY count(titles.title) DESC;

SELECT authors.au_id, authors.au_lname, authors.au_fname, sales.qty
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty)
LIMIT 3;

SELECT authors.au_id, authors.au_lname, authors.au_fname, sales.qty
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id ##Puse left porque era el único modo de que aparecieran los valores null, aunque no entiendo muy bien por qué lo empleo. Entiendo que es porque coges todos los autores y, dentro de ellos, también los que tengan ventas. En caso de ser valor nulo, como haces left también te aparece el autor.
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC; ##No me los ordena correctamente. 