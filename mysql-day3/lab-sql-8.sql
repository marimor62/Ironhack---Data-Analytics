# Inspect the database structure and find the best-fitting table to analyse for the next task.

# Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). 
select title, length, rank() over (order by length desc) as ranking
from sakila.film
where length is not null or ' ';

#Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
select title, length, rating, rank() over (partition by rating order by length desc) as rank2
from film
WHERE length IS NOT NULL or '0';

#How many films are there for each of the categories?
select category_id as category, count(*) from film
inner join film_category
on film.film_id=film_category.film_id
group by category_id;

# Which actor has appeared in the most films?
select actor.first_name, actor.last_name, count(actor_id) as film_count from actor
inner join film_actor using (actor_id)
group by actor_id
order by film_count desc
limit 1;

#Most active customer (the customer that has rented the most number of films)
select customer.first_name, customer.last_name, count(customer_id) as film_count2 from customer
inner join rental using (customer_id)
group by customer_id
order by film_count2 desc
limit 1;

#Which is the most rented film?
SELECT title, count(film_id) as film_count3 FROM film
    INNER JOIN inventory using(film_id)
    INNER JOIN rental using(inventory_id)
group by film_id
order by film_count3 desc
limit 1;
