SELECT city.city, country.country, SUM(p.amount) as amount_total
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ON a.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY city.city, country.country
ORDER BY SUM(p.amount) DESC

