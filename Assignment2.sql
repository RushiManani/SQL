SELECT * from Customer
Select * from Salesman
Select * from orders

-- 1. write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city
SELECT c.cust_name, s.name, s.city
from Customer c join salesman s on c.salesman_id=s.salesman_id
where c.city = s.city

-- 2. write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city
select o.ord_no, o.purch_amt, c.cust_name, c.city
from Customer c join orders o on c.customer_id=o.customer_id
where o.purch_amt BETWEEN 500 and 2000

-- 3. write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission
SELECT c.cust_name as customer, s.name as salesperson, s.city, c.city, s.commission
from Customer c join salesman s on c.salesman_id=s.salesman_id


-- 4. write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission. 
SELECT C.Cust_Name, C.City, S.Name, S.Commission 
from Salesman S INNER JOIN Customer C on S.Salesman_ID=C.Salesman_ID
WHERE S.Commission>12

-- 5. write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company.
-- Return Customer Name, customer city, Salesman, salesman city, commission
SELECT C.Cust_Name, C.City AS Cust_City, S.Name, S.City AS Sales_City, S.Commission
from Salesman S INNER JOIN Customer C on S.Salesman_ID=C.Salesman_ID
where S.City!=C.City AND S.Commission>12

-- 6. write a SQL query to find the details of an order.
-- Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT o.Ord_No, o.Ord_Date, o.Purch_Amt, c.Cust_Name, c.Grade, s.Name, s.Commission
from Orders o INNER JOIN Customer C on o.Customer_ID=c.Customer_ID
INNER JOIN Salesman s on c.Salesman_ID=s.Salesman_ID

-- 7. Write a SQL statement to join the tables salesman, customer and orders so that
-- the same column of each table appears once and only the relational rows are returned.
SELECT S.Salesman_ID,S.Name,S.City AS S_City,S.Commission, C.Customer_ID,C.Cust_Name,C.Grade,C.City AS C_City,O.Ord_No,O.Ord_Date,O.Purch_Amt
from Salesman s INNER JOIN Customer C on c.Salesman_ID=s.Salesman_ID
INNER JOIN Orders o on c.Customer_ID=o.customer_id

-- 8. write a SQL query to display the customer name, customer city, grade, salesman, salesman city.
-- The results should be sorted by ascending customer_id.
SELECT C.Cust_Name,C.City,C.Grade,S.Name,S.City
from Customer C INNER JOIN Salesman S on C.Salesman_ID=S.Salesman_ID
ORDER by C.Customer_ID

-- 9. write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity.
-- The result should be ordered by ascending customer_id.
SELECT C.Cust_Name,C.City,C.Grade,S.Name,S.City
from Customer C INNER JOIN Salesman S on C.Salesman_ID=S.Salesman_ID
WHERE C.Grade<3
ORDER by C.Customer_ID

-- 10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount
-- in ascending order according to the order date to determine
-- whether any of the existing customers have placed an order or not
SELECT C.Cust_Name,C.City,O.Ord_No,O.Ord_Date,O.Purch_Amt
from Customer C Left JOIN Orders O on C.Customer_ID=O.Customer_ID
ORDER by O.Ord_Date

-- 11. Write a SQL statement to generate a report with customer name, city, order number, order date, order amount,
-- salesperson name, and commission to determine if any of the existing customers have not placed orders
-- or if they have placed orders through their salesman or by themselves
SELECT C.Cust_Name,C.City,O.Ord_No,o.Ord_Date,o.Purch_Amt,s.Name as Salesman_Name,s.Commission
from Customer C Left JOIN Orders o on C.Customer_ID=o.Customer_ID
LEFT JOIN Salesman s on o.Salesman_ID=s.Salesman_ID

-- 12. Write a SQL statement to generate a list in ascending order of salespersons
-- who work either for one or more customers or have not yet joined any of the customers
SELECT s.Name as Sales_Name,c.Cust_Name,c.City,c.Grade
from Salesman s left JOIN Customer c on s.Salesman_ID=c.Salesman_ID
ORDER by s.Name

-- 13. write a SQL query to list all salespersons along with
-- customer name, city, grade, order number, date, and amount.
Select s.Name as Sales_Name, c.Cust_Name,c.City, c.Grade,o.Ord_No,o.Ord_Date,o.Purch_Amt
from Salesman s LEFT JOIN Customer c on s.Salesman_ID=c.Salesman_ID
LEFT join Orders o on c.Customer_ID=o.Customer_ID

-- 14. Write a SQL statement to make a list for the salesmen who either work for one or more customers
-- or yet to join any of the customers. The customer may have placed, either one or more orders on
-- or above order amount 2000 and must have a grade,
-- or he may not have placed any order to the associated supplier.
SELECT s.Name as Sales_Name,c.Cust_Name,c.City,c.Grade,O.Purch_Amt
from Customer C RIGHT JOIN Salesman S on s.Salesman_ID=c.Salesman_ID
LEFT JOIN Orders o on c.Customer_ID=o.Customer_ID
where O.Purch_Amt>=200 AND C.Grade IS NOT NULL

-- 15. Write a SQL statement to generate a list of all the salesmen
-- who either work for one or more customers or have yet to join any of them.
-- The customer may have placed one or more orders at or above order amount 2000,
-- and must have a grade, or he may not have placed any orders to the associated supplier.
SELECT *
FROM Customer C RIGHT JOIN Salesman S ON S.Salesman_ID=C.Salesman_ID
LEFT JOIN Orders O ON S.Salesman_ID=O.Salesman_ID
WHERE O.Purch_Amt>=20 AND C.Grade IS NOT NULL


-- 16. Write a SQL statement to generate a report with the customer name, city, order no. order date,
-- purchase amount for only those customers on the list who must have a grade and placed
-- one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
SELECT C.Cust_Name,C.City,O.Ord_No,O.Ord_Date,O.Purch_Amt
FROM Customer C FULL OUTER JOIN ORDERS O ON C.Customer_ID = O.Customer_ID
WHERE C.Grade IS NOT NULL

-- 17. Write a SQL query to combine each row of the salesman table with each row of the customer table
SELECT *
FROM Salesman CROSS JOIN Customer

-- 18. Write a SQL statement to create a Cartesian product between salesperson and customer,
-- i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city
SELECT *
FROM Salesman S CROSS JOIN Customer C
WHERE s.City IS NOT NULL

-- 19. Write a SQL statement to create a Cartesian product between salesperson and customer,
-- i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade
SELECT *
FROM Salesman S CROSS JOIN Customer C
WHERE S.City IS NOT NULL AND C.Grade IS NOT NULL

-- 20. Write a SQL statement to make a Cartesian product between salesman and customer
-- i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city
-- which is not the same as his customer and the customers should have their own grade
SELECT *
FROM Salesman S CROSS JOIN Customer C
WHERE S.City!=C.City AND C.Grade IS NOT NULL