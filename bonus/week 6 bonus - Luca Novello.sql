DROP TABLE players;
CREATE TABLE players (playernumber int, firstname VARCHAR(20), lastname VARCHAR(20));
COMMIT; 

INSERT INTO players (playernumber, firstname, lastname) 
    VALUES (1, 'Joe', 'DiMaggio');

SAVEPOINT A;

SELECT * FROM players WHERE playernumber = 1 OR playernumber = 2;

INSERT INTO players (playernumber, firstname, lastname) 
    VALUES (2, 'Babe', 'Ruth');

SAVEPOINT B;

SELECT * FROM players WHERE playernumber = 1 OR playernumber = 2;

ROLLBACK TO A;

SELECT * FROM players WHERE playernumber = 1 OR playernumber = 2;
