SELECT * FROM Employee
SELECT * FROM Department
SELECT * FROM Employee JOIN Department ON Employee.Dept_ID=Department.Dept_ID

-- 1. write a SQL query to find Employees who have the biggest salary in their Department
SELECT D.Dept_Name,MAX(E.Salary) AS MAX_SALARY
FROM Department D LEFT JOIN Employee E ON E.Dept_ID=D.Dept_ID
GROUP BY D.Dept_Name

-- 2. write a SQL query to find Departments that have less than 3 people in it
SELECT D.Dept_Name, COUNT(E.Emp_Name)AS EMP
FROM Department D LEFT JOIN Employee E ON D.Dept_ID=E.Dept_ID
GROUP BY D.Dept_Name
HAVING COUNT(E.Emp_Name)<3

-- 3. write a SQL query to find All Department along with the number of people there
SELECT D.Dept_Name,COUNT(*) AS EMP
FROM Department D LEFT JOIN Employee E ON D.Dept_ID=E.Dept_ID
GROUP BY D.Dept_Name

-- 4. write a SQL query to find All Department along with the total salary there
SELECT D.Dept_Name,SUM(E.Salary) AS TOTAL_SALARY
FROM Department D LEFT JOIN Employee E ON D.Dept_ID=E.Dept_ID
GROUP BY D.Dept_Name
