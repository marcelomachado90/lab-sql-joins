#lab4
USE sakila;

#SELECT category.name AS category_name, 
		#COUNT(film.film_id) AS number_of_films
#FROM category
#JOIN film_category ON category.category_id = film_category.category_id
#JOIN film ON film_category.film_id = film.film_id
#GROUP BY category_name;
# order by NUMBER_OF_FILMS desc; extra

SELECT name as category_name, count(*) as num_films
FROM category
JOIN film_category USING (category_id)
GROUP BY name
ORDER BY num_films desc;

# Break down:

SELECT * FROM film_category

JOIN film ON film_category.film_id = film.film_id;


SELECT * FROM category

JOIN film_category ON category.category_id = film_category.category_id;



#2
SELECT 
    store.store_id, 
    city.city, 
    country.country
FROM 
    store
JOIN 
    address ON store.address_id = address.address_id
JOIN 
    city ON address.city_id = city.city_id
JOIN 
    country ON city.country_id = country.country_id;
    
#3
SELECT 
    store.store_id, 
    SUM(payment.amount) AS total_revenue
FROM 
    payment
JOIN 
    rental ON payment.rental_id = rental.rental_id
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    store ON inventory.store_id = store.store_id
GROUP BY 
    store.store_id;

#4
SELECT 
    category.name AS category_name, 
    AVG(film.length) AS average_running_time
FROM 
    category
JOIN 
    film_category ON category.category_id = film_category.category_id
JOIN 
    film ON film_category.film_id = film.film_id
GROUP BY 
    category.name
ORDER BY 
    average_running_time DESC;
