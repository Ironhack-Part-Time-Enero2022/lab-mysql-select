USE publications;
SELECT authors.au_id, au_lname, au_fname, pub_name
from authors
inner join titleauthor ON authors.au_id = titleauthor.au_id
inner join titles ON titleauthor.title_id = titles.title_id
inner join publishers ON titles.pub_id = publishers.pub_id;

SELECT 