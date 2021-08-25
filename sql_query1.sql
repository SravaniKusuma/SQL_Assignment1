# Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

SELECT film.title
FROM film ,film_category ,category 
WHERE film.film_id=film_category.film_id
AND film_category.category_id=category.category_id
AND category.name="Comedy"
AND film.rating="PG-13";

#Find out the top 3 rented horror movies.
use sakila;

SELECT film.title,sum(payment.amount) AS Total_rent
FROM film,payment ,rental ,inventory ,film_category ,category 
WHERE payment.rental_id = rental.rental_id
AND film_category.category_id = category.category_id
AND film_category.film_id = film.film_id
AND rental.inventory_id = inventory.inventory_id
AND inventory.film_id = film_category.film_id
AND category.name = "Horror"
GROUP BY film.title
ORDER BY sum(payment.amount) DESC
LIMIT 3;

# Find out the list of customers from India who have rented sports movies.

SELECT  customer_list.ID,customer_list.name
FROM customer_list ,rental,film_list ,inventory 
WHERE customer_list.ID = rental.customer_id
AND inventory.inventory_id = rental.inventory_id
AND inventory.film_id = film_list.FID
AND customer_list.country = "India"
AND film_list.category = "Sports";

# Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

SELECT  customer_list.ID,customer_list.name
FROM customer_list ,actor,rental,inventory ,film_actor
WHERE customer_list.ID = rental.customer_id
AND inventory.film_id = film_actor.film_id
AND film_actor.actor_id = actor.actor_id
AND rental.inventory_id = inventory.inventory_id
AND actor.last_name = "WAHLBERG"
AND customer_list.country = "Canada"
AND actor.first_name = "NICK";

# Find out the number of movies in which “SEAN WILLIAMS” acted.

SELECT COUNT(film.film_id) AS MOVIESACTED
FROM actor,film_actor,film
WHERE actor.actor_id = film_actor.actor_id
AND film_actor.film_id = film.film_id
AND actor.first_name="SEAN"
AND actor.last_name="WILLIAMS";

