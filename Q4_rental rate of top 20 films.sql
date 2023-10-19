SELECT
	f.film_id,
	COUNT(r.rental_id) as rental_frequency,
    f.title AS film_title,
    f.rental_rate
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title, f.rental_rate
ORDER BY rental_frequency DESC
LIMIT 20;





