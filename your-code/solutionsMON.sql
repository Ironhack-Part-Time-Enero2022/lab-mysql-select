USE publications;
SELECT authors.au_id, au_lname, au_fname, pub_name
from authors
inner join titleauthor ON authors.au_id = titleauthor.au_id
inner join titles ON titleauthor.title_id = titles.title_id
inner join publishers ON titles.pub_id = publishers.pub_id;

select ttlau.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRSTNAME", pub.pub_name as "PUBLISHER", count(t.title) as "TITLE COUNT"-- Cambie las cols como en README
from titles as t
left join titleauthor as ttlau on t.title_id = ttlau.title_id
inner join authors as au on ttlau.au_id = au.au_id
inner join publishers as pub on t.pub_id = pub.pub_id
group by ttlau.au_id, au.au_lname, au.au_fname, pub.pub_name
order by count(t.title) desc;-- de publishers va a title, de title va a titleauthor y de titleauthor a authors;
