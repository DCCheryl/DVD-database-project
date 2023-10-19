SELECT customer_id, first_name, last_name,
    (SELECT COUNT(*) FROM rental WHERE rental.customer_id = customer.customer_id)
	AS rental_count
FROM customer
ORDER by rental_count DESC;