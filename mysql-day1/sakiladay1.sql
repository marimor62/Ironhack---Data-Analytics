use sakila;
show tables;
select title from film;
select name as language from language;
select count(staff_id) from staff;
select count(store_id) from store;
select first_name from staff;
select count(distinct date(rental_date)) as days from rental;