SELECT 
	RANK() OVER (ORDER BY COUNT(r.rental_id) DESC) AS category_rank,
	c.category_id, 
	c.name AS category_name, 
	COUNT(r.rental_id) AS rental_count
FROM rental r
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film f ON i.film_id = f.film_id
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
ORDER BY rental_count DESC;

