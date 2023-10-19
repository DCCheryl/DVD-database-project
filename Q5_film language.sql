SELECT
	f.language_id,
	l.name AS language,
	COUNT(r.rental_id) AS rental_count
FROM film f
JOIN language l ON f.language_id = l.language_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.language_id, l.name
