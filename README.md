<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/54deb3f7-15c2-4dde-b681-78897eb0ac03" height=20%>

# DVD Rental Data Analysis

The database used in this project pertains to a DVD rental company and is retrieved from PostgreSQL. 
The objective of this project is to deliver insights to the company owner for optimizing business performance. 
This is achieved through an analysis of the database, focusing on discerning customer preferences and evaluating the company's financial health.

Database can be downloaded in this link: 
https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/

## Customer Preferences

### Query 1: Actor Ranking
The query offers insights into the actors whose films are in high demand, ranking them from the most frequently rented to the least. 
This query helps the company develop strategies to boost rental revenue. 

The company can invest in acquiring more films featuring the top-ranked actors. 
Moreover, the company can offer promotional discounts on the rental rates of films featuring these popular actors which can attract and retain customers. 

```
SELECT
	RANK() OVER (ORDER BY COUNT(r.rental_id) DESC) AS actor_rank,
	a.actor_id,
	a.first_name,
	a.last_name,
	COUNT(r.rental_id) AS rental_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN inventory i ON fa.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY COUNT(r.rental_id) DESC;
```

<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/88b48ecd-7cbe-418a-b149-fcaa9d6df8f0" width=55% height=55%>

### Query 2: Category Ranking
The query offers insights into the film category that are in high demand, ranking them from the most frequently rented to the least. 

Same as actor ranking, the company can invest in acquiring more films of the popular film categories. 
Moreover, the company can offer promotional discounts on the rental rates of films of those popular film categories to boost rental revenue. 

```
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
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/c2728337-ad4b-4166-8452-9f9227bc1048" width=45% height=45%>

### Query 3: Rental Rate of Category
The query unveils the average rental rates for films in each category, arranging them from highest to lowest rates. 
It's noteworthy that the most favoured film category, sports, ranks fifth in terms of average rental rate. Moreover, animation, the second most popular category, 
occupies the fourth spot in terms of lower rates. 

This information suggests that factors other than rental rates may be influencing customers' film choices. 
To gain a deeper understanding of customer preferences, the company may consider conducting surveys. 
If rental rates are not the primary consideration for customers, the company could make adjustments to rental rates to boost rental revenue.

```
SELECT c.name AS category, AVG(f.rental_rate) AS avg_rental_rate
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY avg_rental_rate DESC;
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/72c13744-b51f-4c56-b8cd-232f164e301a" width=35% height=35%>

### Query 4: Rental Rate of Top 20 Films
The query displays the top 20 most frequently rented films with their respective rental rates. 

Interestingly, some highly popular films have relatively lower rental rates. 
This analysis suggests that the company could consider optimizing its revenue by adjusting the rental rates of these popular films.

```
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
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/18ce8449-5659-41dc-ab32-105c84e98b39" width=50% height=50%>


### Query 5: Film Language
The query reveals that all films in the company's collection are in English. 

To expand the company's market and potentially increase rental revenue, 
the company might consider diversifying their film collection by adding movies in different languages to cater to a broader range of customers. 
This approach can arouse the interest of a more diverse audience and boost overall rental revenue.

```
SELECT
	f.language_id,
	l.name AS language,
	COUNT(r.rental_id) AS rental_count
FROM film f
JOIN language l ON f.language_id = l.language_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.language_id, l.name
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/ae25cb4a-153a-4abe-a499-343679e5eddf" width=30% height=30%>

### Query 6: Most Rented Month
The query presents a list of rental records across all months, highlighting the two months with the highest rental activity. 

Recognizing these peak periods, the company can hold a targeted summer campaign tailored to attract students and promote business expansion. 

```
SELECT EXTRACT(YEAR FROM rental_date) AS rental_year,
       EXTRACT(MONTH FROM rental_date) AS rental_month,
       COUNT(rental_id) AS total_rental_orders
FROM rental
GROUP BY rental_year, rental_month
ORDER BY rental_year, total_rental_orders DESC;
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/ce063894-055d-4618-a624-bf1a559f226f" width=33% height=33%>

### Query 7: Customer Rental Record
The query provides a list of customers with count of their rental records. 
It reveals that all customers have rented films over 10 times. 

To enhance loyalty and attract new patrons, the company can introduce loyalty programs, offering rental rate discounts based on rental history. 
Additionally, a referral program can be established, encouraging customers to refer others ad receive rewards, fostering growth and loyalty.

```
SELECT customer_id, first_name, last_name,
    (SELECT COUNT(*) FROM rental WHERE rental.customer_id = customer.customer_id)
	AS rental_count
FROM customer
ORDER by rental_count DESC;
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/38fb846f-16ab-459f-9807-1c68a0e48cb0" width=50% height=50%>

## Financial Health

### Query 8: No Payment Customers
The query reveals that there are 530 customers with outstanding payments, and 377 of them have more than one unpaid rental record. 
The highest unpaid rental record for a single customer reaches 10. 

To enhance revenue sustainability and promote responsible rental practices, 
it is recommended that the company implement a proactive measure to suspend rental services for customers who accumulate multiple unpaid rental records.

```
SELECT r.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count_without_payment
FROM rental r
LEFT JOIN payment p ON r.rental_id = p.rental_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE p.rental_id IS NULL
GROUP BY r.customer_id, c.first_name, c.last_name
ORDER BY rental_count_without_payment DESC;
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/89eb4e56-6f57-4179-9dd9-e07e9eb13151" width=60% height=60%>

### Query 9: Percentage of Total Outstanding Payment to Total Revenue
The query shows that the total outstanding payment to total revenue amounts to 7%.
It may not bring a significant impact to the total revenue of the company, but it does signal a potential financial risk. 

In response to this insight, it is advisable for management to take proactive measures to minimize outstanding payments and ensuring the company's financial stability.

```
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
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/dd628400-e85d-4266-9b43-bd14fb104179" width=23% height=23%>

### Query 10: Top Revenue City
The query provides a list of cities along with their respective rental revenues, ordered in descending order of revenue. 

Identifying cities with high revenue allows the company to tailor specific marketing strategies to target and further boost revenue in those key locations.

```
SELECT city.city, country.country, SUM(p.amount) as amount_total
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ON a.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY city.city, country.country
ORDER BY SUM(p.amount) DESC
```
<img src="https://github.com/DCCheryl/DVD-database-project/assets/53252746/d083a3a6-ef83-42c8-8ca8-2dd722ceaa51" width=55% height=55%>

