#Inspect the database structure and find the best-fitting table to analyse for the next task.
use sakila;
#Using multiple JOIN() clauses display the store ID, city, and country of each store.
select store_id, city, country from store
join address on address.address_id=store.address_id
join city on address.city_id=city.city_id
join country on city.country_id=country.country_id;
#Display the total payment amount for each store.
select sum(amount) as total_amount, store_id from payment
join staff on payment.staff_id=staff.staff_id
group by store_id;
#What is the average film length per each category? Which category of films are the longest?;
select name, avg(length) from category
join film_category using (category_id)
join film using (film_id)
group by name
order by avg(length) desc;
#Display the 2 most frequently rented movies in descending order.
select title, count(rental_id) from rental 
join inventory using (inventory_id)
join film using (film_id)
group by title
order by count(rental_id) DESC
limit 2;
#Display the top 5 categories with highest revenue (payment amount) in descending order.
select name, amount, dense_rank() over (order by amount DESC) from payment
join rental using (rental_id)
join inventory using (inventory_id)
join film_category using (film_id)
join category using (category_id)
group by name
limit 5;
#Is the Academy Dinosaur movie available for rent from Store 1? #If yes, display the title, store_id and inventory_id of the available copies of that movie.
select title, store_id, inventory_id from store
join inventory using (store_id)
join film using (film_id)
where store_id=1 AND title='ACADEMY DINOSAUR';


