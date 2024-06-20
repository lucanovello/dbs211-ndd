-- Name:        Luca Novello
-- User ID:     dbs211_242ndd08
-- Student ID:  038515003
-- Date:        06-20-2024
-- Purpose:     DBS211ndd_Lab06

-- 1. List the 4 ways that we know that a transaction can be started

--2. Using SQL, create an empty table, that is the same as the employees table, and name it newEmployees.
-- 3. Execute the following commands.
SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

-- 4. Write an INSERT statement to populate the newEmployees table with the rows of the sample data. Insert the NULL value for the reportsTo column. (Write a single INSERT statement to insert all the rows)


-- 5. Create a query that shows all the inserted rows from the newEmployees table. How many rows are selected?


-- 6. Execute the rollback command. Display all rows and columns from the newEmployees table. How many rows are selected?


-- 7. Repeat Task 4. Make the insertion permanent to the table newEmployees. Display all rows and columns from the newEmployee table. How many rows are selected?


-- 8. Write an update statement to update the value of column jobTitle to ‘unknown’ for all the employees in the newEmployees table.


-- 9. Make your changes permanent.


-- 10. Execute the rollback command.
    -- a. Display all employees from the newEmployees table whose job title is ‘unknown’. How many rows are still updated?

    -- b. Was the rollback command effective?

    -- c. What was the difference between the result of the rollback execution from Task 6 and the result of the rollback execution of this task?


-- 11. Begin a new transaction and then create a statement to delete to employees from the newEmployees table


-- 12. Create a VIEW, called vwNewEmps, that queries all the records in the newEmployees table sorted by last name and then by first name. 


-- 13. Perform a rollback to undo the deletion of the employees
    -- a. How many employees are now in the newEmployees table?
    -- b. Was the rollback effective and why?


-- 14. Begin a new transaction and rerun the data insertion from Task 4 (copy the code down to Task 14 and run it)


-- 15. Set a Savepoint, called insertion, after inserting the data


-- 16. Rerun the update statement from Task 8 and run a query to view the data (copy the code down and run it again)


-- 17. Rollback the transaction to the Savepoint created in task 15 above and run a query to view the data. What does the data look like (i.e. describe what happened?


-- 18. Use the basic for of the rollback statement and again view the data. Describe what the results look like and what happened.


-- PART B - PERMISSIONS
-- 19. Write a statement that denies all access to the newemployees table for all public users


-- 20. Write a statement that allows a classmate (use their database login) read only access to the newemployees table.


-- 21. Write a statement that allows the same classmate to modify (insert, update and delete) the data of the newemployees table.


-- 22. Write a statement that denies all access to the newemployees table for the same classmate.


-- PART C – CLEAN UP
-- 23. Write statements to permanently remove the view and table created for this lab





