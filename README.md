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


### Query 2: Category Ranking
The query offers insights into the film category that are in high demand, ranking them from the most frequently rented to the least. 

Same as actor ranking, the company can invest in acquiring more films of the popular film categories. 
Moreover, the company can offer promotional discounts on the rental rates of films of those popular film categories to boost rental revenue. 


### Query 3: Rental Rate of Category
The query unveils the average rental rates for films in each category, arranging them from highest to lowest rates. 
It's noteworthy that the most favoured film category, sports, ranks fifth in terms of average rental rate. Moreover, animation, the second most popular category, 
occupies the fourth spot in terms of lower rates. 

This information suggests that factors other than rental rates may be influencing customers' film choices. 
To gain a deeper understanding of customer preferences, the company may consider conducting surveys. 
If rental rates are not the primary consideration for customers, the company could make adjustments to rental rates to boost rental revenue.


### Query 4: Rental Rate of Top 20 Films
The query displays the top 20 most frequently rented films with their respective rental rates. 

Interestingly, some highly popular films have relatively lower rental rates. 
This analysis suggests that the company could consider optimizing its revenue by adjusting the rental rates of these popular films.


### Query 5: Film Language
The query reveals that all films in the company's collection are in English. 

To expand the company's market and potentially increase rental revenue, 
the company might consider diversifying their film collection by adding movies in different languages to cater to a broader range of customers. 
This approach can arouse the interest of a more diverse audience and boost overall rental revenue.


### Query 6: Most Rented Month
The query presents a list of rental records across all months, highlighting the two months with the highest rental activity. 

Recognizing these peak periods, the company can hold a targeted summer campaign tailored to attract students and promote business expansion. 


### Query 7: Customer Rental Record
The query provides a list of customers with count of their rental records. 
It reveals that all customers have rented films over 10 times. 

To enhance loyalty and attract new patrons, the company can introduce loyalty programs, offering rental rate discounts based on rental history. 
Additionally, a referral program can be established, encouraging customers to refer others ad receive rewards, fostering growth and loyalty.


## Financial Health

### Query 8: No Payment Customers
The query reveals that there are 530 customers with outstanding payments, and 377 of them have more than one unpaid rental record. 
The highest unpaid rental record for a single customer reaches 10. 

To enhance revenue sustainability and promote responsible rental practices, 
it is recommended that the company implement a proactive measure to suspend rental services for customers who accumulate multiple unpaid rental records.


### Query 9: Percentage of Total Outstanding Payment to Total Revenue
The query shows that the total outstanding payment to total revenue amounts to 7%.
It may not bring a significant impact to the total revenue of the company, but it does signal a potential financial risk. 

In response to this insight, it is advisable for management to take proactive measures to minimize outstanding payments and ensuring the company's financial stability.


### Query 10: Top Revenue City
The query provides a list of cities along with their respective rental revenues, ordered in descending order of revenue. 

Identifying cities with high revenue allows the company to tailor specific marketing strategies to target and further boost revenue in those key locations.



