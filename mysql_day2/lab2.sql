#Select all the actors with the first name ‘Scarlett’.
use sakila;
select * from actor
where first_name='Scarlett';
#How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(film_id ) AS "Number of available movies" FROM inventory;
SELECT COUNT(DISTINCT inventory_id) AS "Number of rented movies" FROM rental;
#What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT title, length AS min_duration FROM film
ORDER BY length ASC;
SELECT title, length AS max_duration FROM film
ORDER BY length DESC;

#What's the average movie duration expressed in format (hours, minutes)?
SELECT
floor(AVG(length)/60) as hours,
floor(AVG(length)%60) as min
FROM film;

#How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM actor;

#Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date),MIN(rental_date)) as operation_days FROM rental;

#Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
# SELECT *, month(rental_date) as month, dayofweek(rental_date) as weekday FROM rental LIMIT 20
SELECT *,
date_format(convert(rental_date,datetime) , "%M") as month,
date_format(convert(rental_date,datetime) , "%W") as weekday
from rental
limit 20;

# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
select *, 
case 
  when date_format(convert(rental_date,datetime) , "%W")='Sunday' OR 'Saturday' then 'weekend'  
  else 'workday'  
end as day_type
from rental;

# How many rentals were made in the last month of renting activity?
select month(max(rental_date)) from rental;
select
COUNT(RENTAL_ID)
from rental
WHERE MONTH(rental_date)=2
