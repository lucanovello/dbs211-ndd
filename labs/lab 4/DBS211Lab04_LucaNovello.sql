-- Name:        Luca Novello
-- User ID:     dbs211_242ndd08
-- Student ID:  038515003
-- Date:        06-05-2024
-- Purpose:     DBS211ndd_Lab04

SET AUTOCOMMIT ON;

-- Part A: DDL Statements

-- 1. Create table the following tables and their given constraints:

-- MOVIES (movieid:int, title:varchar(35), year:int, director:int,score:decimal(3,2))
CREATE TABLE movies (
movieid INT PRIMARY KEY,
title VARCHAR(35) NOT NULL,
year INT NOT NULL,
director INT NOT NULL,
score DECIMAL(3,2) CHECK (score >= 0 AND score <= 5)
);

-- ACTORS (actorid:int, name:varchar(20), lastname:varchar(30))
CREATE TABLE actors (
actorid INT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
lastname VARCHAR(30) NOT NULL
);

-- CASTINGS (movieid:int, actorid:int)
CREATE TABLE castings (
movieid INT NOT NULL,
actorid INT NOT NULL,
PRIMARY KEY (movieid, actorid),
CONSTRAINT movie_fk FOREIGN KEY (movieid) REFERENCES MOVIES(movieid),
CONSTRAINT actor_fk FOREIGN KEY (actorid) REFERENCES ACTORS(actorid)
);

-- DIRECTORS(id:int, name:varchar(20), lastname:varchar(30))
CREATE TABLE directors (
    directorid INT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL
);

-- 2. Modify the movies table to create a foreign key constraint that refers to table directors.
ALTER TABLE movies
	ADD CONSTRAINT fk_director FOREIGN KEY (director) REFERENCES directors(directorid);

-- 3. Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed.
ALTER TABLE movies
	ADD CONSTRAINT movie_title_uq UNIQUE (title);

-- 4. Write insert statements to add the following data to table directors and movies.

-- DIRECTORS
INSERT INTO directors (directorid, firstname, lastname) VALUES (1010, 'Rob', 'Minkoff');
INSERT INTO directors (directorid, firstname, lastname) VALUES (1020, 'Bill', 'Condon');
INSERT INTO directors (directorid, firstname, lastname) VALUES (1050, 'Josh', 'Cooley');
INSERT INTO directors (directorid, firstname, lastname) VALUES (2010, 'Brad', 'Bird');
INSERT INTO directors (directorid, firstname, lastname) VALUES (3020, 'Lake', 'Bell');

-- MOVIES
INSERT INTO movies (movieid, title, year, director, score) VALUES (100, 'The Lion King', 2019, 3020, 3.50);
INSERT INTO movies (movieid, title, year, director, score) VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20);
INSERT INTO movies (movieid, title, year, director, score) VALUES (300, 'Toy Story 4', 2019, 1020, 4.50);
INSERT INTO movies (movieid, title, year, director, score) VALUES (400, 'Mission Impossible', 2018, 2010, 5.00);
INSERT INTO movies (movieid, title, year, director, score) VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90);


-- 5. Write SQL statements to remove all above tables. Is the order of tables important when removing? Why?
DROP TABLE castings;
DROP TABLE movies;
DROP TABLE actors;
DROP TABLE directors;

-- Part B: More DML

-- 6. Create a new empty table employee2 the same as table employees. Use a single statement to create the table and insert the data at the same time.
CREATE TABLE employee2 AS 
SELECT * FROM employees;

-- 7. Modify table employee2 and add a new column username to this table. The value of this column is not required and does not have to be unique.
ALTER TABLE employee2 
    ADD username VARCHAR(50);

-- 8. Delete all the data in the employee2 table.
DELETE FROM employee2;

-- 9. Re-insert all data from the employees table into your new table employee2 using a single statement.
INSERT INTO employee2 (employeenumber,
    lastname,
    firstname,
    extension,
    email,
    officecode,
    reportsto,
    jobtitle) 
SELECT 
    employeenumber,
    lastname,
    firstname,
    extension,
    email,
    officecode,
    reportsto,
    jobtitle 
FROM employees;

-- 10. In table employee2, write a SQL statement to change the first name and the last name of employee with ID 1002 to your name.
UPDATE employee2 SET firstname = 'Luca', lastname = 'Novello'
WHERE employeenumber = 1002;

-- 11. In table employee2, generate the email address for column username for each student by concatenating the first character of employee’s first name and the employee’s last name. For instance, the username of employee Peter Stone will be pstone. NOTE: the username is in all lower case letters.
UPDATE employee2 SET username = LOWER(CONCAT(SUBSTR(firstname, 1, 1), lastname));

-- 12. In table employee2, remove all employees with office code 4.
DELETE FROM employee2 
WHERE officecode = 4;

-- 13. Drop table employee2.
DROP TABLE employee2;
