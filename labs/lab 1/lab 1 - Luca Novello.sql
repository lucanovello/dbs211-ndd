-- 1) How many tables have been created? List the names of the created tables.
-- 8 tables were created and their names are: 
-- CUSTOMERS
-- EMPLOYEES
-- OFFICES
-- ORDERDETAILS
-- ORDERS
-- PAYMENTS
-- PRODUCTLINES
-- PRODUCTS
SELECT COUNT(*) AS num_tables
FROM user_tables;
SELECT table_name
FROM user_tables;


-- 2) Click on table customers. Click on the Data tab near the top of the worksheet. How many rows are there in the table customers?
-- There are 122 rows.


-- 3) What SQL statement would return the same results. Write the statement in the .sql file and execute it. You will learn how to select rows and columns from a table by writing SQL select statements later in this course.
SELECT COUNT(*) AS total_rows
FROM customers;

-- 4) How many columns does the customers table have? List the column names.
-- there are 13 columns in the customers table and their names are 
-- CUSTOMERNUMBER
-- CUSTOMERNAME
-- CONTACTLASTNAME
-- CONTACTFIRSTNAME
-- PHONE
-- ADDRESSLINE1
-- ADDRESSLINE2
-- CITY
-- STATE
-- POSTALCODE
-- COUNTRY
-- SALESREPEMPLOYEENUMBER
-- CREDITLIMIT

SELECT COUNT(*) AS total_columns
FROM all_tab_columns
WHERE table_name = 'CUSTOMERS';
SELECT COLUMN_NAME
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'CUSTOMERS';


-- 5) What is the value of each column in the first row in table customers? Write the column name and the column data type in addition to the value.
-- The value of each column is:
-- COLUMN_NAME              DATA_TYPE   COLUMN_VALUE
---------------------------------------------------------
-- CUSTOMERNUMBER	        NUMBER	    CUSTOMERNUMBER
-- CUSTOMERNAME	            VARCHAR2	CUSTOMERNAME
-- CONTACTLASTNAME	        VARCHAR2	CONTACTLASTNAME
-- CONTACTFIRSTNAME	        VARCHAR2	CONTACTFIRSTNAME
-- PHONE	                VARCHAR2	PHONE
-- ADDRESSLINE1	            VARCHAR2	ADDRESSLINE1
-- ADDRESSLINE2	            VARCHAR2	ADDRESSLINE2
-- CITY	                    VARCHAR2	CITY
-- STATE	                VARCHAR2	STATE
-- POSTALCODE	            VARCHAR2	POSTALCODE
-- COUNTRY	                VARCHAR2	COUNTRY
-- SALESREPEMPLOYEENUMBER	NUMBER	    SALESREPEMPLOYEENUMBER
-- CREDITLIMIT	            NUMBER	    CREDITLIMIT

SELECT column_name, data_type, 
       (SELECT column_name FROM customers WHERE ROWNUM = 1) AS column_value
FROM user_tab_columns
WHERE table_name = 'CUSTOMERS';

-- 6) Write the number of rows and columns for the rest of the tables in your schema. Format it something like the following.
-- Table Name   Rows    Columns
-- CUSTOMERS	122	    13
-- EMPLOYEES	23	    8
-- OFFICES	    7	    9
-- ORDERDETAILS	2996	5
-- ORDERS	    326	    7
-- PAYMENTS	    273	    4
-- PRODUCTLINES	7	    4
-- PRODUCTS	    110	    9

SELECT table_name, num_rows, num_columns
FROM (
    SELECT table_name, 
           TO_NUMBER(
               EXTRACTVALUE(
                   XMLTYPE(
                       DBMS_XMLGEN.GETXML('SELECT COUNT(*) AS num_rows FROM ' || table_name)
                   ), '/ROWSET/ROW/NUM_ROWS'
               )
           ) AS num_rows,
           COUNT(column_name) AS num_columns
    FROM user_tables
    JOIN user_tab_columns USING (table_name)
    GROUP BY table_name
)
ORDER BY table_name;

-- 7) Right Click on the orderdetails table and choose tables/count rows. How many rows does the order details table include?
-- Table "DBS211_242NDD08"."ORDERDETAILS" contains 2996 Rows.
select count(1) from "DBS211_242NDD08"."ORDERDETAILS"


-- 8) Write the following SQL statement in the new tab.
desc offices;
-- You can also write
describe offices;
--What is the result of the statement execution?
--The results are:
-- Name         Null?    Type         
-- ------------ -------- ------------ 
-- OFFICECODE   NOT NULL VARCHAR2(10) 
-- CITY         NOT NULL VARCHAR2(50) 
-- PHONE        NOT NULL VARCHAR2(50) 
-- ADDRESSLINE1 NOT NULL VARCHAR2(50) 
-- ADDRESSLINE2          VARCHAR2(50) 
-- STATE                 VARCHAR2(50) 
-- COUNTRY      NOT NULL VARCHAR2(50) 
-- POSTALCODE   NOT NULL VARCHAR2(15) 
-- TERRITORY    NOT NULL VARCHAR2(10)

-- 9) Type the following statements in, execute them, then briefly describe what the statement is doing!
SELECT * FROM employees;
-- This is querying all items in the employees table.

SELECT * FROM customers ORDER BY ContactLastName;
-- This is querying all items in the customers table and ordering them by ContactLastName.


-- 10) How many constraints does the products table have?
-- The products table has 11 constraints
SELECT COUNT(*) AS num_constraints
FROM user_constraints
WHERE table_name = 'PRODUCTS';


-- 11) Set the font size in the worksheet editor to a size that is best for you. (Hint: Tools/Preferences)
-- set to consolas :)

