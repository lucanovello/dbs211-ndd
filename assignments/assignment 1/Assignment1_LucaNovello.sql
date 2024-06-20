-- Name:        Luca Novello
-- User ID:     dbs211_242ndd08
-- Student ID:  038515003
-- Date:        06-19-2024
-- Purpose:     Assignment 01 DBS211

-- Q1 SOLUTION --
SELECT
   e.employeenumber AS "employee number",
   e.firstname || ' ' || e.lastname AS "employee name",
   o.phone AS "phone",
   e.extension AS "extension",
   o.city AS "city",
   e.reportsto AS "manager id",
   NULL AS "manager name" 
FROM
   employees e 
   JOIN
      offices o 
      ON e.officecode = o.officecode 
WHERE
   e.reportsto IS NULL 
ORDER BY
   o.city,
   e.employeenumber;
   
-- Q2 SOLUTION --
SELECT
   e.employeenumber,
   e.firstname || ' ' || e.lastname AS "employee name",
   o.phone AS "phone",
   e.extension AS "extension",
   o.city AS "city" 
FROM
   employees e 
   JOIN
      offices o 
      ON e.officecode = o.officecode 
WHERE
   o.city IN 
   (
      'NYC',
      'Tokyo',
      'Paris'
   )
ORDER BY
   o.city,
   e.employeenumber;
   
-- Q3 SOLUTION --
SELECT
   e.employeenumber AS "employee number",
   e.firstname || ' ' || e.lastname AS "employee name",
   o.phone AS "phone",
   e.extension AS "extension",
   o.city AS "city",
   e.reportsto AS "manager id",
   NULL AS "manager name" 
FROM
   employees e 
   JOIN
      offices o 
      ON e.officecode = o.officecode 
   LEFT JOIN
      employees m 
      ON e.reportsto = m.employeenumber 
WHERE
   o.city IN 
   (
      'NYC',
      'Tokyo',
      'Paris'
   )
ORDER BY
   o.city,
   e.employeenumber;
   
-- Q4 SOLUTION --
SELECT
   e.employeenumber AS "manager id",
   e.firstname || ' ' || e.lastname AS "manager name",
   o.country,
   CASE
      WHEN
         e.reportsto IS NOT NULL 
      THEN
         'Reports to' || m.firstname || ' ' || m.lastname || '(' || m.jobtitle || ')' 
      ELSE
         'Does not report to anyone' 
   END
   AS "reports TO" 
FROM
   employees e 
   LEFT JOIN
      employees m 
      ON e.reportsto = m.employeenumber 
   JOIN
      offices o 
      ON e.officecode = o.officecode 
WHERE
   e.employeenumber IN 
   (
      SELECT DISTINCT
         reportsto 
      FROM
         employees
   )
ORDER BY
   e.employeenumber;
   
-- Q5 SOLUTION --
SELECT
   c.customernumber,
   c.customername,
   od.productcode,
   p.msrp AS "OLD price",
   p.msrp * 0.9 AS "NEW price" 
FROM
   customers c 
   JOIN
      orders o 
      ON c.customernumber = o.customernumber 
   JOIN
      orderdetails od 
      ON o.ordernumber = od.ordernumber 
   JOIN
      products p 
      ON od.productcode = p.productcode 
WHERE
   p.productvendor = 'Exoto Designs' 
   AND od.quantityordered > 55 
ORDER BY
   c.customernumber;
   
-- Q6a SOLUTION --
SELECT DISTINCT
   c.customernumber,
   c.customername 
FROM
   customers c 
   JOIN
      orders o1 
      ON c.customernumber = o1.customernumber 
   JOIN
      orders o2 
      ON c.customernumber = o2.customernumber 
WHERE
   o1.ordernumber <> o2.ordernumber 
ORDER BY
   c.customernumber;
   
-- Q6b SOLUTION --
SELECT
   c.customernumber,
   c.customername 
FROM
   customers c 
   JOIN
      orders o1 
      ON c.customernumber = o1.customernumber 
   LEFT JOIN
      orders o2 
      ON c.customernumber = o2.customernumber 
      AND o1.ordernumber <> o2.ordernumber 
WHERE
   o2.ordernumber IS NULL 
ORDER BY
   c.customernumber,
   c.customername;