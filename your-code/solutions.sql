use publications;

-- Challenge 1 - Who have published what and where?
select distinct
	au.au_id 		as author_id, 
	au.au_lname 	as last_name, 
	au.au_fname 	as first_name,
    t.title			as title,
    pub.pub_name 	as publisher,
    pub.city		as city
from `publications`.`authors` au
	inner join `publications`.`titleauthor` tau 
		on au.au_id = tau.au_id
	inner join `publications`.`titles` t 
		on tau.title_id = t.title_id
	inner join `publications`.`publishers` pub 
		on t.pub_id = pub.pub_id;


-- Challenge 2 - Who have published how many and where?
select
	au.au_id 					as author_id, 
	au.au_lname 				as last_name, 
	au.au_fname 				as first_name,
    pub.pub_name 				as publisher,
    count(distinct t.title) 	as title_count
from `publications`.`authors` au
	inner join `publications`.`titleauthor` tau 
		on au.au_id = tau.au_id
	inner join `publications`.`titles` t 
		on tau.title_id = t.title_id
	inner join `publications`.`publishers` pub 
		on t.pub_id = pub.pub_id
group by 1,2,3,4
order by title_count desc;

-- Challenge 3 - Best Selling Authors
select distinct
	au.au_id 						as author_id, 
	au.au_lname 					as last_name, 
	au.au_fname 					as first_name,
    count(distinct t.title)			as total
from `publications`.`authors` au
	inner join `publications`.`titleauthor` tau 
		on au.au_id = tau.au_id
	inner join `publications`.`titles` t 
		on tau.title_id = t.title_id
group by 1,2,3
order by total desc,first_name,last_name
limit 3;

-- Challenge 4 - Best Selling Authors Ranking
select distinct
	au.au_id 						as author_id, 
	au.au_lname 					as last_name, 
	au.au_fname 					as first_name,
    count(distinct t.title)			as total
from `publications`.`authors` au
	left join `publications`.`titleauthor` tau 
		on au.au_id = tau.au_id
	left join `publications`.`titles` t 
		on tau.title_id = t.title_id
group by 1,2,3 
order by total desc,first_name,last_name;