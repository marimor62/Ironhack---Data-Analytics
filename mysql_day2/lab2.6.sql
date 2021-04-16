USE sakila;
#Get the unique release years.
SELECT DISTINCT(release_year) from film;

#Get all films with ARMAGEDDON in the title.
SELECT * FROM film
WHERE title LIKE '%ARMAGEDDON%';

# Get all films which title ends with APOLLO.
SELECT * FROM film
WHERE title LIKE '%APOLLO';

# Get 10 the longest films.
SELECT title, length FROM film
ORDER BY length DESC 
LIMIT 10;

#How many films include Behind the Scenes content?
SELECT count(title) as number FROM film
WHERE special_features LIKE '%Behind the Scenes%';

#Drop column picture from staff.
# ALTER TABLE staff DROP COLUMN picture;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
SELECT ('3',first_name, last_name, address_id, email, store_id, active, 'Tammy', 'null', last_update)
FROM customer
WHERE first_name in ('TAMMY') and last_name in ('SANDERS');

SELECT * FROM STAFF;
#Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1. 
INSERT INTO rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
select '2002', curdate(), inventory_id from inventory
where film_id in (select film_id from film where title in ('Academy Dinosaur'));
select customer_id, 'null' from customer
where first_name in ('Charlotte') and last_name in ('Hunter');

# Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
#Check if there are any non-active users
select * from customer
where active = 0;
# Create a table backup table as suggested to store customer_id, email, and the date for the users that would be deleted
CREATE TABLE backup_table;
# Insert the non active users in the table backup table
SELECT customer_id, email, create_date FROM customers
where active = 0;
# Delete the non active users from the table customer
 DELETE FROM customer WHERE active =0;
 