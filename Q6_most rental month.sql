SELECT EXTRACT(YEAR FROM rental_date) AS rental_year,
       EXTRACT(MONTH FROM rental_date) AS rental_month,
       COUNT(rental_id) AS total_rental_orders
FROM rental
GROUP BY rental_year, rental_month
ORDER BY rental_year, total_rental_orders DESC;
