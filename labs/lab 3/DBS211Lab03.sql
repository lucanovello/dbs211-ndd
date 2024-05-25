-- Name:        Luca Novello
-- User ID:     dbs211_242ndd08
-- Student ID:  038515003
-- Date:        05-24-2024
-- Purpose:     DBS211ndd_Lab03

SET AUTOCOMMIT ON;

-- 1. Display the data for all offices.
SELECT 
    * 
FROM 
    offices;


-- 2. Display the employee number for all employees whose office code is 1.
SELECT 
    employeenumber 
FROM 
    employees
WHERE 
    officeCode = 1;


-- 3. Display customer number, customer name, contact first name and contact last name, and phone for all customers in Paris. (hint: be wary of case sensitivity)
SELECT 
    customernumber, 
    customername, 
    contactfirstname, 
    contactlastname, 
    phone
FROM 
    customers
WHERE 
    LOWER(city) = 'paris';


-- 4. Repeat the previous Query with a couple small changes:
    -- a. The contact’s first and last name should be in a single column in the format “lastname, firstname”.
SELECT 
    customerNumber,
    customerName, 
    contactLastName || ', ' || contactFirstName AS contactName, 
    phone
FROM 
    customers
WHERE 
    LOWER(city) = 'paris';

    -- b. Show customers who are in Canada
SELECT 
    customerNumber, 
    customerName, 
    contactLastName || ', ' || contactFirstName AS contactName, 
    phone
FROM 
    customers
WHERE 
    LOWER(country) = 'canada';

-- 5. Display customer number for customers who have payments. Do not included any repeated values. (hints: how do you know a customer has made a payment? You will need to access only one table for this query)
SELECT
    DISTINCT customerNumber
FROM
    payments;

-- 6. List customer numbers, check number, and amount for customers whose payment amount is not in the range of $30,000 to $65,000. Sort the output by top payments amount first.
SELECT
    customerNumber,
    checkNumber,
    amount
FROM
    payments
WHERE
    amount < 30000 OR amount > 65000
ORDER BY
    amount DESC;


-- 7. Display the order information for all orders that are cancelled.
SELECT
    *
FROM
    orders
WHERE
    LOWER(status) = 'cancelled';


-- 8. The company needs to know the percentage markup for each product sold. Produce a query that outputs the ProductCode, ProductName, BuyPrice, MSRP in addition to
-- a. The difference between MSRP and BuyPrice (i.e. MSRP-BuyPrice) called markup
SELECT
    productcode,
    productname,
    buyprice,
    msrp,
    (msrp - buyprice) AS markup
FROM
    products;

-- b. The percentage markup (100 * calculated by difference / BuyPrice) called percmarkup rounded to 1 decimal place.
SELECT
    productcode,
    productname,
    buyprice,
    msrp,
    (msrp - buyprice) AS markup,
    ROUND((100 * ((msrp - buyprice) / buyprice)), 1) AS percmarkup
FROM
    products;


-- 9. Display the information of all products with string ‘co’ in their product name. (c and o can be lower or upper case).
SELECT
    *
FROM
    products
WHERE
    LOWER(productname) LIKE '%co%';

-- 10. Display all customers whose contact first name starts with letter s (both lowercase and uppercase) and includes letter e (both lowercase and uppercase).
SELECT
    *
FROM
    customers
WHERE LOWER(contactfirstname) LIKE 's%' AND LOWER(contactfirstname) LIKE '%e%';


-- 11. Create a statement that will insert yourself as an employee of the company.
    -- a. Use a unique employee number of your choice
    -- b. Use your school email address
    -- c. Your job title will be “Cashier”
    -- d. Office code will be 4
    -- e. You will report to employee 1088
INSERT INTO
    employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES
    (038515003, 'Novello', 'Luca', 'x1234', 'gnovello@myseneca.ca', 4, 1088, 'Cashier');


-- 12. Create a query that displays your, and only your, employee data
SELECT
    *
FROM
    employees
WHERE
    employeenumber = 038515003;

-- 13. Create a statement to update your job title to “Head Cashier”
UPDATE
    employees
SET
    jobtitle = 'Head Cashier'
WHERE
    employeenumber = 038515003;

-- 14. Create a statement to insert another fictional employee into the database. This employee will be a “Cashier” and will report to you. Make up fake data for the other fields.
INSERT INTO
    employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES
    (1703, 'Wonka', 'Willy', 'x5678', 'willy@wonka.com', 4, 038515003, 'Cashier');

-- 15. Create a statement to Delete yourself from the database. Did it work? If not, why?
DELETE FROM
    employees
WHERE
    employeenumber = 038515003;
    
-- This did not work as there was a child record found.  I am listed as REPORTSTO for the fake employee.


-- 16. Create a statement to delete the fake employee from the database and then rerun the statement to delete yourself. Did it work?
DELETE FROM
    employees
WHERE
    employeenumber = 038515003;
    
-- This did work as there were no constraints.


-- 17. Create a single statement that will insert both yourself and the fake employee at the same time. This time the fake employee will report to 1088 as well.
INSERT ALL
    INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
    VALUES (038515003, 'Novello', 'Luca', 'x1234', 'gnovello@myseneca.ca', 4, 1088, 'Cashier')
    INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
    VALUES (1703, 'Wonka', 'Willy', 'x5678', 'willy@wonka.com', 4, 1088, 'Cashier')
SELECT * FROM DUAL;


-- 18. Create a single statement to delete both yourself and the fake employee.
DELETE FROM employees
WHERE employeenumber IN (038515003, 1703);

