USE sakila; 

-- 1. Select all the actors with the first name ‘Scarlett’.

SELECT *
FROM sakila.actor
WHERE first_name = 'Scarlett'; 

-- 2. How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(film_id) as movies_for_rent,
COUNT(rental_rate > 0) AS movies_rented
FROM sakila.film;

-- 3. What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.

SELECT max(length) as max_duration, min(length) as min_duration
FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT ROUND(AVG(length/60 + (length%60)/100), 2) as avg_duration
FROM sakila.film; 

-- 5. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name)
FROM sakila.actor;

-- 6. Since how many days has the company been operating?

SELECT DATEDIFF(MAX(last_update), MIN(rental_date)) -- i am assuming that those values could rerpresent the operation length
AS day_in_operation
FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, EXTRACT(MONTH FROM rental_date) as month, 
WEEKDAY(rental_date) as day
FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT rental_date, EXTRACT(MONTH FROM rental_date) as month, 
WEEKDAY(rental_date) as day, 
CASE 
WHEN WEEKDAY(rental_date) = 0 OR WEEKDAY(rental_date) = 6 THEN 'weekend' 
ELSE 'workday'   
END AS day_type
FROM sakila.rental;

-- 9. Get release years.

SELECT release_year, title
FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.

SELECT film_id, title
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.

SELECT title 
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.

SELECT film_id, length 
FROM sakila.film
ORDER BY length DESC
LIMIT 10;


-- 13. How many films include **Behind the Scenes** content?

SELECT COUNT(film_id) 
FROM sakila.film
WHERE special_features LIKE '%Behind the Scene%';




