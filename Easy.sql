-- Q1: Who is the senior most employee based on job title?

select * from employee
order by levels desc
limit 1;

-- Q2: Which countries have the most Invoices?

select count(*),billing_country from invoice 
group by billing_country
order by count(*) desc;


-- Q3: What are top 3 values of total invoice?

select total from invoice
order by total desc
limit 3;

-- Q4: Which city has the best customers? 

select sum(total) as best_cust, billing_city from invoice
group by billing_city
order by best_cust desc;

-- Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer.
     --Write a query that returns the person who has spent the most money
	 
select c.customer_id,first_name, last_name, sum(total) as best_cust from customer as c
join invoice as i
on c.customer_id = i.customer_id
group by c.customer_id
order by best_cust desc
limit 1;









 