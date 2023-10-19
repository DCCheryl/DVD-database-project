WITH total_revenue AS (
    SELECT SUM(amount) AS total_payment
    FROM payment
),
total_outstanding_payment AS (
    SELECT SUM(f.rental_rate) AS total_outstanding_amount
    FROM rental r
    LEFT JOIN payment p ON r.rental_id = p.rental_id
    LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
    LEFT JOIN film f ON i.film_id = f.film_id
    WHERE p.rental_id IS NULL
)
SELECT
    (total_outstanding_payment.total_outstanding_amount / total_revenue.total_payment) * 100 AS percentage_outstanding_to_revenue
FROM total_outstanding_payment, total_revenue;
