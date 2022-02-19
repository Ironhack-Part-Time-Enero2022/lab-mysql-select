USE publications;
SELECT authors.au_id, au_lname, au_fname, pub_name
from authors
inner join titleauthor ON authors.au_id = titleauthor.au_id
inner join titles ON titleauthor.title_id = titles.title_id
inner join publishers ON titles.pub_id = publishers.pub_id;

select ttlau.au_id AS "AUTHORID", au.au_lname AS "LASTNAME", au.au_fname AS "FIRSTNAME", pub.pub_name AS "PUBLISHER", count(titles.title) AS "TITLECOUNT"
from titles
left join titleauthor ON titles.title_id = titleauthor.title_id
inner join authors ON titleauthor.authors_id = authors.au_id
inner join publishers AS pub ON t.pub_id = pub.pub_id
group by titleauthor.au_id, authors.au_lname, authors.au_fname, pub.pub_name
order by count(titles.title) desc;
