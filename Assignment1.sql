SELECT * from Products

--1. Write a query to get a Product list (id, name, unit price) where current products cost less than $20.
    SELECT ProductID,ProductName,UnitPrice FROM Products WHERE UnitPrice < 20

--2. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25
    SELECT ProductID,ProductName,UnitPrice from Products WHERE UnitPrice BETWEEN 15 and 25

--3. Write a query to get Product list (name, unit price) of above average price.
    SELECT ProductName,UnitPrice from Products where UnitPrice > (Select AVG(UnitPrice) from Products)

--4. Write a query to get Product list (name, unit price) of ten most expensive products
    SELECT top 10 ProductName,UnitPrice from Products ORDER BY UnitPrice DESC

--5. Write a query to count current and discontinued products
    Select Discontinued,COUNT(*) As Current_product FROM Products GROUP BY Discontinued

--6. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order
    SELECT ProductName, UnitsOnOrder,UnitsInStock from Products WHERE UnitsInStock < UnitsOnOrder

