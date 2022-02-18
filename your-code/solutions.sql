use publications;

-- Challenge 1 - Who Have Published What At Where?

select au.au_id as AUTHOR_ID, au.au_lname as LAST_NAME, au.au_fname as FIRST_NAME, t.title as TITLE, pub.pub_name as PUBLISHER -- Cambie las cols como en README
from authors as au
inner join titleauthor as ttlau on au.au_id = ttlau.au_id
inner join titles as t on ttlau.title_id = t.title_id   
inner join publishers as pub on t.pub_id = pub.pub_id;  -- de publishers va a title, de title va a titleauthor y de titleauthor a authors 

select count(au_id) from titleauthor; -- para comprobar

-- Challenge 2 - Who Have Published How Many At Where?

select au.au_id as AUTHOR_ID, au.au_lname as LAST_NAME, au.au_fname as FIRST_NAME, pub.pub_name as PUBLISHER-- Cambie las cols como en README
from authors as au
inner join titleauthor as ttlau on au.au_id = ttlau.au_id
inner join titles as t on ttlau.title_id = t.title_id   
inner join publishers as pub on t.pub_id = pub.pub_id
-- group by count(au.au_id); -- de publishers va a title, de title va a titleauthor y de titleauthor a authors 

