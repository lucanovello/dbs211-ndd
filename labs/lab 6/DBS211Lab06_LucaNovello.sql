-- Name:        Luca Novello
-- User ID:     dbs211_242ndd08
-- Student ID:  038515003
-- Date:        06-20-2024
-- Purpose:     DBS211ndd_Lab06

-- 1. List the 4 ways that we know that a transaction can be started
    -- 1) The user has established a new connection to the server and has a blank sheet ready to go, starts a new transaction
    -- 2) The user uses the BEGIN statement in Oracle SQL, this will start a new transaction
        -- BEGIN transaction;   -- or   START transaction;   or   just   BEGIN;
    -- 3) The user executes a COMMIT statement, the current transaction is commited, and a new transaction starts.
    -- 4) The user executes ANY DDL statement.  This automatically triggers an auto-commit of the current transaction and starts a new transaction.

--2. Using SQL, create an empty table, that is the same as the employees table, and name it newEmployees.
CREATE TABLE newEmployees AS SELECT * FROM employees WHERE 1=0;

-- 3. Execute the following commands.
SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

-- 4. Write an INSERT statement to populate the newEmployees table with the rows of the sample data. Insert the NULL value for the reportsTo column. (Write a single INSERT statement to insert all the rows)
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual;
    
-- 5. Create a query that shows all the inserted rows from the newEmployees table. How many rows are selected?
SELECT * FROM newEmployees;
    -- 5 rows are selected

-- 6. Execute the rollback command. Display all rows and columns from the newEmployees table. How many rows are selected?
ROLLBACK;
SELECT * FROM newEmployees;
    -- 0 rows are selected

-- 7. Repeat Task 4. Make the insertion permanent to the table newEmployees. Display all rows and columns from the newEmployee table. How many rows are selected?
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual;
COMMIT;
SELECT * FROM newEmployees;
    -- 5 rows are selected

-- 8. Write an update statement to update the value of column jobTitle to ‘unknown’ for all the employees in the newEmployees table.
UPDATE newEmployees SET jobtitle = 'unknown';

-- 9. Make your changes permanent.
COMMIT;

-- 10. Execute the rollback command.
ROLLBACK;

    -- a. Display all employees from the newEmployees table whose job title is ‘unknown’. How many rows are still updated?
SELECT * FROM newEmployees WHERE jobtitle = 'unknown';
-- 5 rows are still updated

    -- b. Was the rollback command effective?
-- The rollback command had no effect as we had just committed the changed permanently.

    -- c. What was the difference between the result of the rollback execution from Task 6 and the result of the rollback execution of this task?
-- The rollback command had no effect once we committed so the changes were made permanent.

-- 11. Begin a new transaction and then create a statement to delete to employees from the newEmployees table
DELETE FROM newEmployees;
    
-- 12. Create a VIEW, called vwNewEmps, that queries all the records in the newEmployees table sorted by last name and then by first name. 
CREATE OR REPLACE VIEW vwNewEmps AS
SELECT * FROM newEmployees 
ORDER BY lastname, firstname;
    
SELECT * FROM vwNewEmps;

-- 13. Perform a rollback to undo the deletion of the employees
ROLLBACK;

    -- a. How many employees are now in the newEmployees table?
SELECT * FROM vwNewEmps;

    
    -- b. Was the rollback effective and why?
-- No, the rollback was not effective because by running the CREATE command when creating the view, we ran a DDL statement which automatically triggered an auto-commit of the current transaction and started a new transaction. 

-- 14. Begin a new transaction and rerun the data insertion from Task 4 (copy the code down to Task 14 and run it)
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual;

-- 15. Set a Savepoint, called insertion, after inserting the data
SAVEPOINT insertion;

-- 16. Rerun the update statement from Task 8 and run a query to view the data (copy the code down and run it again)
UPDATE newEmployees SET jobtitle = 'unknown';
SELECT * FROM newEmployees;

-- 17. Rollback the transaction to the Savepoint created in task 15 above and run a query to view the data. What does the data look like (i.e. describe what happened?
ROLLBACK TO insertion;
SELECT * FROM newEmployees;
-- The rollback undid the UPDATE of the jobtitle and now the jobtitle is back to 'Sales Rep'.

-- 18. Use the basic form of the rollback statement and again view the data. Describe what the results look like and what happened.
ROLLBACK;
SELECT * FROM newEmployees;
-- This rollback undid all statements since the last commit which was implicitly called when we created the VIEW.

-- PART B - PERMISSIONS
-- 19. Write a statement that denies all access to the newemployees table for all public users
REVOKE ALL ON newEmployees FROM PUBLIC;

-- 20. Write a statement that allows a classmate (use their database login) read only access to the newemployees table.
GRANT SELECT ON newEmployees TO DBS211_241NDD09;

-- 21. Write a statement that allows the same classmate to modify (insert, update and delete) the data of the newemployees table.
GRANT INSERT, UPDATE, DELETE ON newEmployees TO DBS211_241NDD09;

-- 22. Write a statement that denies all access to the newemployees table for the same classmate.
REVOKE ALL ON newEmployees FROM DBS211_241NDD09;

-- PART C – CLEAN UP
-- 23. Write statements to permanently remove the view and table created for this lab
DROP VIEW vwNewEmps;
DROP TABLE newEmployees;




