/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT DISTINCT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN (
    SELECT DISTINCT f_us.film_id
    FROM film f_us
    JOIN inventory i_us ON f_us.film_id = i_us.film_id
    JOIN rental r_us ON i_us.inventory_id = r_us.inventory_id
    JOIN customer c_us ON r_us.customer_id = c_us.customer_id
    JOIN address a_us ON c_us.address_id = a_us.address_id
    JOIN city ci_us ON a_us.city_id = ci_us.city_id
    JOIN country co_us ON ci_us.country_id = co_us.country_id
    WHERE co_us.country = 'United States'
) us_rentals ON f.film_id = us_rentals.film_id
WHERE us_rentals.film_id IS NULL
ORDER BY f.title;
