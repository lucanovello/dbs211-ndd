-- Name:        Luca Novello
-- User ID:     dbs211_242ndd08
-- Student ID:  038515003
-- Date:        06-09-2024
-- Purpose:     DBS211ndd_Lab05

SET AUTOCOMMIT ON;

-- 1. Create a query that shows employee number, first name, last name, city, phone number and postal code for all employees in France. -------------------------------------------
SELECT 
    employeenumber,
    firstname,
    lastname,
    city,
    phone,
    postalcode 
FROM employees e JOIN offices o 
ON e.officecode = o.officecode AND country = 'France';


-- 2. Create a query that displays all payments made by customers from Canada. -------------------------------------------
SELECT
    p.customernumber,
    checknumber,
    paymentdate,
    amount
FROM payments p JOIN customers c
ON p.customernumber = c.customernumber AND country = 'Canada';
    
	-- a. Sort the output by Customer Number. -------------------------------------------
SELECT
    p.customernumber,
    checknumber,
    paymentdate,
    amount
FROM payments p JOIN customers c
ON p.customernumber = c.customernumber AND country = 'Canada'
ORDER BY p.customernumber;
	
	-- b. Only display the Customer Number, Customer Name, Payment Date and Amount. -------------------------------------------
SELECT
    c.customernumber,
    customername,
    paymentdate,
    amount
FROM payments p JOIN customers c
ON p.customernumber = c.customernumber AND country = 'Canada'
ORDER BY p.customernumber;
	
	-- c. Make sure the date is displayed clearly to know what date it is. (i.e. what date is 02-04-19??? – Feb 4, 2019, April 2, 2019, April 19, 2002, ….)(HINT: use TO_CHAR function) -------------------------------------------
SELECT
    c.customernumber,
    customername,
    TO_CHAR(paymentdate, 'Month dd, yyyy') AS paymentdate,
    amount
FROM payments p JOIN customers c
ON p.customernumber = c.customernumber AND country = 'Canada'
ORDER BY p.customernumber;
    
    	
-- 3. Create a query that shows all USA customers who have not made a payment. Display only the customer number and customer name sorted by customer number. -------------------------------------------
SELECT 
    c.customernumber,
    customername
FROM customers c JOIN payments p
ON c.customernumber != p.customernumber AND country = 'USA'
ORDER BY p.customernumber;


-- 4. a) Create a view (vwCustomerOrder) to list all orders with the following data for all customers: Customer Number, Order number, order date, product name, quantity ordered, and price for each product in every order. -------------------------------------------
CREATE OR REPLACE VIEW vwCustomerOrder AS
    SELECT 
        o.customernumber,
        ordernumber,
        orderdate,
        productname,
        quantityordered,
        priceeach
    FROM orders o JOIN orderdetails od USING (ordernumber)
        JOIN products p USING (productcode);
        
        
-- b) Write a statement to view the results of the view just created. -------------------------------------------
SELECT * FROM vwCustomerOrder;


-- 5. Using the vwCustomerOrder view, display the order information for customer number 124. Sort the output based on order number and then order line number. (Yes, I know orderLineNumber is not in the view) -------------------------------------------
SELECT * 
FROM vwCustomerOrder JOIN orderdetails o
ON customernumber = 124
ORDER BY o.ordernumber, o.orderlinenumber;


-- 6. Create a query that displays the customer number, first name, last name, phone, and credit limits for all customers who do not have any orders. -------------------------------------------
SELECT 
    c.customernumber,
    contactfirstname,
    contactlastname,
    phone,
    creditlimit
FROM customers c RIGHT OUTER JOIN orders o
ON c.customernumber != o.customernumber;


-- 7. Create a view (vwEmployeeManager) to display all information of all employees and the name and the last name of their managers if there is any manager that the employee reports to. Include all employees, including those who do not report to anyone. -------------------------------------------
CREATE OR REPLACE VIEW vwEmployeeManager AS
    SELECT 
e.*,
m.firstname AS managerfirstname,
m.lastname AS managerlastname
FROM employees e LEFT JOIN employees m
ON e.reportsto = m.employeenumber; 

SELECT * FROM vwEmployeeManager
ORDER BY employeenumber;


-- 8. Modify the employee_manager view so the view returns only employee information for employees who have a manager. Do not DROP and recreate the view – modify it. (Google is your friend). -------------------------------------------
CREATE OR REPLACE VIEW vwEmployeeManager AS
    SELECT 
e.*,
m.firstname AS managerfirstname,
m.lastname AS managerlastname
FROM employees e JOIN employees m
ON e.reportsto = m.employeenumber; 

SELECT * FROM vwEmployeeManager
ORDER BY employeenumber;


-- 9. Drop both customer_order and employee_manager views. -------------------------------------------
DROP VIEW vwCustomerOrder;
DROP VIEW vwEmployeeManager;
