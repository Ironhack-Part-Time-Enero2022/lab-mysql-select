USE publications;
SELECT authors.au_id, au_lname, au_fname, pub_name
from authors
inner join titleauthor ON authors.au_id = titleauthor.au_id
inner join titles ON titleauthor.title_id = titles.title_id
inner join publishers ON titles.pub_id = publishers.pub_id;

select titleauthor.au_id AS "AUTHORID", authors.au_lname AS "LASTNAME", authors.au_fname AS "FIRSTNAME", publishers.pub_name AS "PUBLISHER", count(titles.title) AS "TITLECOUNT"
from titles
left join titleauthor ON titles.title_id = titleauthor.title_id
inner join authors ON titleauthor.au_id = authors.au_id
inner join publishers ON titles.pub_id = publishers.pub_id
group by titleauthor.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
order by count(titles.title) desc;

Select 
titleauthor.au_id AS AUTHORID
, authors.au_lname AS LASTNAME
, authors.au_fname AS FIRSTNAME
, count(titles.title) AS TOTAL
from titles
left join titleauthor ON titles.title_id = titleauthor.title_id
inner join authors ON titleauthor.au_id = authors.au_id
group by titleauthor.au_id, authors.au_lname, authors.au_fname
order by TOTAL desc, FIRSTNAME, LASTNAME
limit 3;



