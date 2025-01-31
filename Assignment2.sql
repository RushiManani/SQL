SELECT * from Customer
Select * from Salesman
Select * from orders

-- 1. write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city
SELECT c.cust_name, s.name, s.city from Customer c join salesman s on c.salesman_id=s.salesman_id where c.city = s.city

-- 2. write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city
select o.ord_no,o.purch_amt,c.cust_name,c.city from Customer c join orders o on c.customer_id=o.customer_id where o.purch_amt BETWEEN 100 and 200

-- 3. write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission
SELECT c.cust_name as customer, s.name as salesperson, s.city, c.city, s.commission from Customer c join salesman s on c.salesman_id=s.salesman_id
