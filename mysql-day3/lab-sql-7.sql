#In the actor table, which are the actors whose last names are not repeated?
select first_name, last_name from actor
group by first_name, last_name
having count(last_name) = 1;

#Which last names appear more than once? 
select first_name, last_name from actor
group by first_name, last_name
having count(last_name) > 1;

# Using the rental table, find out how many rentals were processed by each employee.
select staff_id, first_name, count(rental_id) as rentals from rental
inner join staff using (staff_id)
group by first_name;

# Using the film table, find out how many films were released each year
select release_year, count(film_id) as films from film
group by release_year;

# Using the film table, find out for each rating how many films were there
select rating, count(film_id) as films from film
group by rating;

# What is the average length of films for each rating? Round off the average lengths to two decimal places.
select rating, round(avg(length),2) as average_length from film
group by rating;

#Which kind of movies (based on rating) have an average duration of two hours or more?
select rating, round(avg(length)) as average_length from film
group by rating
having avg(length) >= 120;