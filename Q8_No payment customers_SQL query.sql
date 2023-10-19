SELECT r.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count_without_payment
FROM rental r
LEFT JOIN payment p ON r.rental_id = p.rental_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE p.rental_id IS NULL
GROUP BY r.customer_id, c.first_name, c.last_name
ORDER BY rental_count_without_payment DESC;