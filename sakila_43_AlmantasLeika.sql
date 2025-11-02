/*USE sakila;*/

-- Task 1: List all film titles from the film table.

/*SELECT 
  title Title
FROM
  `tc-da-1.sakila_db.film`;*/

-- Task 2: Count the total number of films available in the database.

/*SELECT
  COUNT(film_id) FilmCount
FROM
  `tc-da-1.sakila_db.film`;*/

-- Task 3: Retrieve a distinct list of languages used in films by joining the film and language tables.

/*SELECT
  DISTINCT language.name Language
FROM 
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.language` language
  ON
    film.language_id = language.language_id;*/

-- Task 4: Select films with a rental rate greater than 4.0.

/*SELECT
  title Title,
  rental_rate RentalRate
FROM
  `tc-da-1.sakila_db.film`
WHERE
  rental_rate > 4.0
ORDER BY
  rental_rate DESC;*/

-- Task 5: Display film titles along with their replacement cost and sort the results by replacement cost in descending order.

/*SELECT
  title Title,
  replacement_cost ReplacementCost
FROM
  `tc-da-1.sakila_db.film`
ORDER BY
  replacement_cost DESC;*/

-- Task 6: List all active customers from the customer table (active = 1).

/*SELECT
  first_name FirstName,
  last_name LastName,
  active Status
FROM
  `tc-da-1.sakila_db.customer`
WHERE 
  active = 1
ORDER BY
  last_name;*/

-- Task 7: Show staff names along with their store addresses by joining the staff and address tables.

/*SELECT
  first_name FirstName,
  last_name LastName,
  address.address StoreAddress
FROM
  `tc-da-1.sakila_db.staff` staff
JOIN
  `tc-da-1.sakila_db.store` store
  ON staff.store_id = store.store_id
JOIN
  `tc-da-1.sakila_db.address` address
  ON store.address_id = address.address_id*/

-- Task 8: Retrieve films released between the years 2005 and 2008.

/*SELECT
  title Title,
  release_year ReleaseYear
FROM
  `tc-da-1.sakila_db.film`
WHERE release_year
  BETWEEN 2005
    AND 2008
ORDER BY Title;*/

-- Task 9: Calculate the average rental duration for all films.

/*SELECT
  ROUND(AVG(DATE_DIFF(rental.return_date, rental.rental_date, DAY)), 2) AvgRental
FROM
  `tc-da-1.sakila_db.rental` rental;*/

-- Task 10: Find the minimum and maximum rental rates among all films.

/*SELECT
  MIN(rental_rate) MinRentalRate,
  MAX(rental_rate) MaxRentalRate
FROM
  `tc-da-1.sakila_db.film`;*/

-- Task 11: Count the number of films per rating. Group results by the film rating.

/*SELECT
  rating Rating,
  COUNT(film_id) FilmCount
FROM
  `tc-da-1.sakila_db.film`
GROUP BY
  rating
ORDER BY
  FilmCount;*/

-- Task 12: For each film category, list the category name and the total number of films assigned to that category.

/*SELECT
  category.name Category,
  COUNT(film.film_id) FilmCount
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.film_category` filmcategory
  ON
    film.film_id = filmcategory.film_id
JOIN
  `tc-da-1.sakila_db.category` category
  ON
    filmcategory.category_id = category.category_id
GROUP BY
  Category
ORDER BY
  FilmCount;*/

-- Task 13: Display the total film length (SUM of length) for each film category.

/*SELECT
  category.name Category,
  SUM(film.length) TotalLength
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.film_category` filmcategory
  ON
    film.film_id = filmcategory.film_id
JOIN
  `tc-da-1.sakila_db.category` category
  ON
    filmcategory.category_id = category.category_id
GROUP BY
  Category
ORDER BY
  TotalLength;*/

-- Task 14: List the titles of films that belong to the 'Action' category.

/*SELECT
  film.title Title,
  category.name Category
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.film_category` filmcategory
  ON film.film_id = filmcategory.film_id
JOIN
  `tc-da-1.sakila_db.category` category
  ON filmcategory.category_id = category.category_id
-- GROUP BY 
WHERE
  category.name = 'Action'
ORDER BY
  Title;*/

-- Task 15: Show film titles along with the average payment amount for rentals of that film.

/*SELECT
  film.title FilmTitle,
  ROUND(AVG(payment.amount), 2) AvgPayment
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.inventory` inventory
  ON
    film.film_id = inventory.film_id
JOIN
  `tc-da-1.sakila_db.rental` rental
  ON
    inventory.inventory_id = rental.inventory_id
JOIN
  `tc-da-1.sakila_db.payment` payment
  ON
    rental.customer_id = payment.customer_id
GROUP BY
  Title
ORDER BY
  AvgPayment DESC;*/

-- Task 16: List the top 5 most rented films, ordering results by the number of rentals.

/*SELECT
  film.title Title,
  COUNT(rental_id) RentalCount
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.inventory` inventory
  ON
    film.film_id = inventory.film_id
JOIN
  `tc-da-1.sakila_db.rental` rental
  ON
    inventory.inventory_id = rental.inventory_id
GROUP BY
  film.title
ORDER BY
  COUNT(rental_id) DESC
LIMIT 5;*/

-- Task 17: Retrieve all customers whose email addresses do not contain '@sakilacustomer.org'.

/*SELECT
  first_name FirstName,
  last_name LastName,
  email EmailAddress
FROM
  `tc-da-1.sakila_db.customer`
WHERE
  email NOT LIKE '%@sakilacustomer.org';*/

-- Task 18: Identify rental transactions that have not been returned yet (e.g., where return_date IS NULL).

/*SELECT
  rental_id RentalID,
  return_date ReturnDate
FROM
  `tc-da-1.sakila_db.rental`
WHERE
  return_date IS NULL;*/

-- Task 19: List staff members who have processed more than 50 rentals. 

/*SELECT
  staff.first_name FirstName,
  staff.last_name LastName,
  COUNT(rental.rental_id) RentalCount
FROM
  `tc-da-1.sakila_db.staff` staff
JOIN
  `tc-da-1.sakila_db.rental` rental
  ON
    staff.staff_id = rental.staff_id
GROUP BY
  staff.last_name,
  staff.first_name
HAVING 
  COUNT(rental.rental_id) > 50
ORDER BY
  COUNT(rental.rental_id) DESC;*/

-- Task 20: Calculate the average total payment for each customer by joining the payment and customer tables.

/*SELECT
  customer.first_name FirstName,
  customer.last_name LastName,
  ROUND(AVG(payment.amount), 2) AvgPaymentAmount
FROM
  `tc-da-1.sakila_db.customer` customer
JOIN
  `tc-da-1.sakila_db.payment` payment
  ON
    customer.customer_id = payment.customer_id
GROUP BY
  customer.customer_id,
  customer.last_name,
  customer.first_name
ORDER BY
  AvgPaymentAmount DESC;*/

-- Task 21: Find customers whose total payment amounts fall between 100 and 500.

/*SELECT
  customer.first_name FirstName,
  customer.last_name LastName,
  ROUND(SUM(payment.amount), 2) TotalPaymentAmount
FROM
  `tc-da-1.sakila_db.customer` customer
JOIN
  `tc-da-1.sakila_db.payment` payment
  ON
    customer.customer_id = payment.customer_id
GROUP BY
  customer.customer_id,
  customer.first_name,
  customer.last_name
HAVING
  SUM(payment.amount) 
    BETWEEN 100
      AND 500
ORDER BY
  TotalPaymentAmount DESC;*/

-- Task 22: List film titles that have never been rented. Use a subquery to check films not present in the rental table.

/*SELECT
  film.title Title
FROM
  `tc-da-1.sakila_db.film` film
WHERE
  film.film_id NOT IN (
    SELECT
      inventory.film_id
    FROM
      `tc-da-1.sakila_db.inventory` inventory
    JOIN
      `tc-da-1.sakila_db.rental` rental
      ON
        inventory.inventory_id = rental.inventory_id
  )
  ORDER BY
    Title;*/

-- Task 23: Select the film titles of the top 10 cheapest films based on replacement cost.

/*SELECT
  title Title,
  replacement_cost ReplacementCost
FROM
  `tc-da-1.sakila_db.film`
ORDER BY
  ReplacementCost
LIMIT 10;*/

-- Task 24: List film titles with a length longer than the overall average film length (use a subquery to compute the average).

/*SELECT
  title Title,
  length FilmLength
FROM
  `tc-da-1.sakila_db.film`
WHERE 
  length >
    (SELECT
      AVG(length)
    FROM
     `tc-da-1.sakila_db.film`)
ORDER BY
  Title;*/

-- Task 25: Count the number of rentals for each film, grouping the results by film ID.

/*SELECT
  film.film_id FilmID,
  film.title Title,
  COUNT(rental.rental_id) RentalCount
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.inventory` inventory
  ON
    film.film_id = inventory.film_id
JOIN
  `tc-da-1.sakila_db.rental` rental
  ON
    inventory.inventory_id = rental.inventory_id
GROUP BY
  FilmID,
  Title
ORDER BY
  RentalCount DESC;*/

-- Task 26: Display each customer along with the total number of films they have rented, sorted by the rental count in descending order.

/*SELECT
  customer.customer_id CustomerID,
  customer.first_name FirstName,
  customer.last_name LastName,
  COUNT(rental.rental_id) RentalCount
FROM
  `tc-da-1.sakila_db.customer` customer
JOIN
  `tc-da-1.sakila_db.rental` rental
    ON customer.customer_id = rental.customer_id
GROUP BY
  CustomerID,
  FirstName,
  LastName
ORDER BY
  RentalCount DESC;*/

-- Task 27: Identify the customer who has made the highest total payment.

/*SELECT
  customer.customer_id CustomerID,
  customer.first_name FirstName,
  customer.last_name LastName,
  SUM(payment.amount) MaxTotalPayment
FROM
  `tc-da-1.sakila_db.customer` customer
JOIN
  `tc-da-1.sakila_db.payment` payment
  ON customer.customer_id = payment.customer_id
GROUP BY
  CustomerID,
  FirstName,
  LastName
ORDER BY
  MaxTotalPayment DESC
LIMIT 1;*/

-- Task 28: Create a union query that selects active customers in one query and inactive customers in another; include a label for status.

/*SELECT
  first_name FirstName,
  last_name LastName,
  CASE
    WHEN
      active = 1
    THEN
      'Active'
    ELSE
    'Inactive'
    END  CustomerStatus
FROM `tc-da-1.sakila_db.customer`;*/

/*SELECT
  'Active' Status,
  first_name FirstName,
  last_name LastName,
FROM
  `tc-da-1.sakila_db.customer`
WHERE
  active = 1
 UNION ALL
 SELECT
  'Inactive' Status,
  first_name FirstName,
  last_name LastName,
 FROM
  `tc-da-1.sakila_db.customer` customer
WHERE
  active = 0
 
ORDER BY
  LastName;*/

-- Task 29: Insert a new customer record into the customer table with realistic dummy data.

/*INSERT INTO
  `tc-da-1.sakila_db.customer`
VALUES (
  1001,
  2,
  'Jacko',
  'Jackson',
  'jacko.jackson@gmail.com',
  101,
  1,
  2025-11-02
);*/

-- Task 30: Delete a customer record based on a given customer_id if that customer is inactive.

/*DELETE FROM
  `tc-da-1.sakila_db.customer`
WHERE
  customer_id = 1001
  AND
   active = 0;*/

-- Task 31: List films with an inventory count less than 5, by joining the film and inventory tables.

/*SELECT
  film.title Title,
  COUNT(inventory.inventory_id) InventoryCount
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.inventory` inventory
  ON
    film.film_id = inventory.film_id
GROUP BY
  film.title
HAVING
  COUNT(inventory.inventory_id) < 5
ORDER BY
  InventoryCount;*/

-- Task 32: Identify the store that currently has the highest number of films available by analyzing the inventory.

/*SELECT
  store.store_id Store,
  COUNT(inventory.inventory_id) FilmCount
FROM
  `tc-da-1.sakila_db.inventory` inventory
JOIN
  `tc-da-1.sakila_db.store` store
  ON
    inventory.store_id = store.store_id
GROUP BY
  Store
ORDER BY
  FilmCount DESC
LIMIT 1;*/

-- Task 33: Calculate the average film length for each language. Group by the language name.

/*SELECT
  language.name Language,
  ROUND(
    AVG(film.length), 1
   ) AvgFilmLength
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.language` language
  ON
    film.language_id = language.language_id
GROUP BY
  Language;*/

-- Task 34: Count the number of films for each film rating (such as 'G', 'PG', etc.) and use the HAVING clause to filter ratings with at least 10 films.

/*SELECT
  rating Rating,
  COUNT(film_id) FilmCount
FROM
  `tc-da-1.sakila_db.film`
GROUP BY
  Rating
HAVING
  FilmCount >=10
ORDER BY
  FilmCount;*/

-- Task 35: For each country, count the number of customers by joining customer, address, city, and country tables.

/*SELECT
  country.country Country,
  COUNT(customer.customer_id) CustomerCount
FROM
  `tc-da-1.sakila_db.customer` customer
JOIN
  `tc-da-1.sakila_db.address` address
  ON
    customer.address_id = address.address_id
JOIN
  `tc-da-1.sakila_db.city` city
  ON
    address.city_id = city.city_id
JOIN
  `tc-da-1.sakila_db.country` country
  ON
    city.country_id = country.country_id
GROUP BY
  Country
ORDER BY
  CustomerCount DESC;*/

-- Task 36: Find the names of actors who have starred in more than 10 films.

/*SELECT
  actor.first_name FirstName,
  actor.last_name LastName,
  COUNT(film.film_id) FilmCount
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.film_actor` filmactor
  ON
    film.film_id = filmactor.film_id
JOIN
  `tc-da-1.sakila_db.actor` actor
  ON
    filmactor.actor_id = actor.actor_id
GROUP BY
  actor.actor_id,
  FirstName,
  LastName
HAVING
  FilmCount > 10
ORDER BY
  FilmCount DESC;*/

-- Task 37: Display the top 3 customers by total payment amount, including their full name and total paid.

/*SELECT
  customer.first_name FirstName,
  customer.last_name LastName,
  ROUND(SUM(payment.amount), 2) TotalPaid
FROM
  `tc-da-1.sakila_db.customer` customer
JOIN
  `tc-da-1.sakila_db.payment` payment
  ON customer.customer_id = payment.customer_id
GROUP BY
  customer.customer_id,
  customer.first_name,
  customer.last_name
ORDER BY
  SUM(payment.amount) DESC
LIMIT 3;*/

-- Task 38: Find any duplicate film titles (if they exist) by grouping by title and having a count greater than 1.

/*SELECT
  title Title,
  COUNT(*) DuplicateCount
FROM
  `tc-da-1.sakila_db.film`
GROUP BY
  Title
HAVING
  COUNT(*) > 1
ORDER BY
  DuplicateCount DESC*/

-- Task 39: Select film titles where the replacement cost is higher than the average replacement cost for all films (using a subquery).

/*SELECT
  title Title,
  replacement_cost ReplacementCost
FROM
  `tc-da-1.sakila_db.film`
WHERE 
  replacement_cost > (
    SELECT
      AVG(replacement_cost)
    FROM
      `tc-da-1.sakila_db.film`
    )
ORDER BY
  replacement_cost;*/

-- Task 40: Insert a new film record into the film table with example values for title, description, and rental_rate.

/*INSERT INTO
   `tc-da-1.sakila_db.film` (
    title,
    description,
    release_year,
    language_id,
    original_language_id,
    rental_duration,
    rental_rate,
    length,
    replacement_cost,
    rating,
    special_features,
    last_update
    )
VALUES (
  150,
  'DRAGON EYE',
  'Lorem ipsum',
  150,
  150,
  6,
  5.00,
  183,
  4.50,
  'PG',
  ' ',
  ' '
)*/

-- Task 41: Find the full name of the actor who has acted in the maximum number of movies. 

/*SELECT
  actor.first_name FirstName,
  actor.last_name LastName,
  COUNT(film.film_id) FilmCount
FROM
  `tc-da-1.sakila_db.film` film
JOIN
  `tc-da-1.sakila_db.film_actor` filmactor
  ON
    film.film_id = filmactor.film_id
JOIN
  `tc-da-1.sakila_db.actor` actor
  ON
    filmactor.actor_id = actor.actor_id
GROUP BY
  actor.last_name,
  actor.first_name
ORDER BY
  COUNT(film.film_id) DESC
LIMIT 1;*/

-- Task 42: Find out how many times a particular movie category is rented. Arrange these categories in the decreasing order of the number of times they are rented

/*SELECT
  category.name Category,
  COUNT(rental.rental_id) RentalCount
FROM
  `tc-da-1.sakila_db.category` category
JOIN
  `tc-da-1.sakila_db.film_category` filmcategory
  ON
    category.category_id = filmcategory.category_id
JOIN
  `tc-da-1.sakila_db.film` film
  ON
    filmcategory.film_id = film.film_id
JOIN
  `tc-da-1.sakila_db.inventory` inventory
  ON
    film.film_id = inventory.film_id
JOIN
  `tc-da-1.sakila_db.rental` rental
  ON
    inventory.inventory_id = rental.inventory_id
GROUP BY
  Category
ORDER BY
  RentalCount DESC;*/

-- Task 43: Write a query to find the full names of those customers who have rented at least 25 movies and belong to the city London.

/*SELECT
  customer.first_name FirstName,
  customer.last_name LastName,
  COUNT(rental.rental_id) RentalCount,
  city.city Residentof
FROM
  `tc-da-1.sakila_db.customer` customer
JOIN
  `tc-da-1.sakila_db.rental` rental
  ON
    customer.customer_id = rental.customer_id
JOIN
  `tc-da-1.sakila_db.address` address
  ON
    customer.address_id = address.address_id
JOIN
  `tc-da-1.sakila_db.city` city
  ON
    address.city_id = city.city_id
GROUP BY
  customer.last_name,
  customer.first_name,
  city.city
HAVING
  city.city = "London"
    AND
      RentalCount > 25
ORDER BY
  RentalCount;*/
