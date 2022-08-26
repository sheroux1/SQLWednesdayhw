--1. List all customers who live in Texas (use JOINs)

select customer.customer_id, customer.first_name, customer.last_name, address.address_id, address.district from address 
inner join customer on address.address_id=customer.address_id where address.district like 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name

select customer.first_name, customer.last_name, customer.customer_id, payment.payment_id, payment.amount from payment
inner join customer on customer.customer_id=payment.customer_id where payment.amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)

select customer.first_name, customer.last_name, customer.customer_id, payment.payment_id, payment.amount from payment
inner join customer on customer.customer_id=payment.customer_id where payment.amount > 175;

--4. List all customers that live in Nepal (use the city table)

select customer.first_name, customer.last_name, address.address_id from customer inner join customer.address_id=address.address_id
where city_id like (select city.country_id, country.country from country inner join country.country.id where country.country='Nepal');

--5. Which staff member had the most transactions?
--I couldn't figure out which table this was supposed to reference. Staff? customers? Salesperson?

--6. How many movies of each rating are there?

select rating, count(film_id) from film group by rating order by rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select distinct customer.customer_id, customer.first_name, customer.last_name,  payment.payment_id, payment.amount from payment
inner join customer on customer.customer_id=payment.customer_id where payment.amount > 6.99 order by customer.customer_id;

--8. How many free rentals did our stores give away?

select count(rental_id), payment.payment_id from payment 
inner join rental.rental_id=payment.rental_id 
where payment.amount like 0;