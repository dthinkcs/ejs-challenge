SELECT * FROM customers;
SELECT * FROM orders;

SELECT *
FROM products
ORDER BY Price DESC;

SELECT
 customerName,
 COUNT(*) AS 'number of orders'
FROM customers
INNER JOIN orders
 ON orders.customerID = customers.customerID
GROUP BY customers.customerID;




/*C*/
CREATE DATABASE database_name;
CREATE TABLE table_name;
INSERT INTO table_name VALUES ();
/*R*/
SELECT * FROM table_name WHERE 1
/*U*/
UPDATE table_name SET col='value' WHERE id = 1
/*D*/
DROP DATABASE database_name;
DROP TABLE table_name;
DELETE FROM table_name WHERE id=1;





CREATE TABLE 'registrants' ('id' integer PRIMARY KEY, 'name' varchar(255), 'dorm' varchar(255))
INSERT INTO "registrants" ("id", "name", "dorm") VALUES(1, 'David', 'Matthews')
SELECT * FROM "registrants"
UPDATE "registrants" SET "name" = 'David Malan' WHERE id = 1
DELETE FROM "registrants" WHERE id = 1


show databases;
CREATE DATABASE database_name;
CREATE DATABASE soap_store;

DROP DATABASE database_name;
DROP DATABASE hello_world_db;

USE <database name>;
-- example:
USE dog_walking_app;
SELECT database();


--create your tables
CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );
CREATE TABLE cats
  (
    name VARCHAR(100),
    age INT
  );
-- know its corrext
SHOW TABLES;
SHOW COLUMNS FROM tablename;
DESC tablename;
DROP TABLE <tablename>;

--A specific example:

DROP TABLE cats;

--create a table called pastries
CREATE TABLE pastries
  (
    name VARCHAR(50),
    quantity INT
  );

SHOW TABLES;

DESC pastries;

DROP TABLE pastries



--The "formula":

INSERT INTO table_name(column_name) VALUES (data);
--For example:

INSERT INTO cats(name, age) VALUES ('Jetson', 7);
INSERT INTO table_name
            (column_name, column_name)
VALUES      (value, value),
            (value, value),
            (value, value);
--create a table called people
CREATE TABLE people
  (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
  );
-- you gonna insert values
INSERT INTO people(first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);
INSERT INTO people(age, last_name, first_name)
VALUES (42, 'Belcher', 'Bob');
INSERT INTO people(first_name, last_name, age)
VALUES('Linda', 'Belcher', 45)
  ,('Phillip', 'Frond', 38)
  ,('Calvin', 'Fischoeder', 70);
DROP TABLE people;
SELECT * FROM people;
show tables;
SHOW WARNINGS;

--Try inserting a cat with incorrect data types:

INSERT INTO cats(name, age) VALUES('Lima', 'dsfasdfdas'); --Lima, 0
--Then view the warning:
SHOW WARNINGS;

--Try inserting a cat without an age:
INSERT INTO cats(name) VALUES('Alabama');--Alabama, NULL
SELECT * FROM cats;
--Try inserting a nameless and ageless cat:
INSERT INTO cats() VALUES();
--Define a new cats2 table with NOT NULL constraints:
CREATE TABLE cats2
  (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
  );
DESC cats2;
--Now try inserting an ageless cat:
INSERT INTO cats2(name) VALUES('Texas'); --Texas, 0
--View the new warnings:
SHOW WARNINGS;
SELECT * FROM cats2;
--Do the same for a nameless cat:
INSERT INTO cats2(age) VALUES(7); --'', 7
SHOW WARNINGS;

CREATE TABLE cats3
  (
    name VARCHAR(20) DEFAULT 'no name provided',
    age INT DEFAULT 99
  );
  DESC cats3;

--Insert a cat without a name:

INSERT INTO cats3(age) VALUES(13); --'no name provided', 13

--Or a nameless, ageless cat:

INSERT INTO cats3() VALUES(); --'no name provided', 99

--Combine NOT NULL and DEFAULT:

CREATE TABLE cats4
  (
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
  );

--Notice The Difference:

INSERT INTO cats() VALUES(); --NULL, NULL
SELECT * FROM cats;

INSERT INTO cats3() VALUES(); --'no name provided', 99
SELECT * FROM cats3;

INSERT INTO cats3(name, age) VALUES('Montana', NULL); --;Montana, 'NULL'
SELECT * FROM cats3;

INSERT INTO cats4(name, age) VALUES('Cali', NULL); -- ERROR (not a warning)
CREATE TABLE unique_cats
  (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
  );
DESC unique_cats;

--Insert some new cats:

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);

INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'Louise', 3);

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'James', 3);
--Notice what happens:

SELECT * FROM unique_cats;

--Adding in AUTO_INCREMENT:

CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
--INSERT a couple new cats:

INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
--Notice the difference:

SELECT * FROM unique_cats2;

CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);
CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed'
);
INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);






INSERT INTO cats(name, age) VALUES(‘Taco’, 14);
DROP TABLE cats;

CREATE TABLE cats
  (
     cat_id INT NOT NULL AUTO_INCREMENT,
     name   VARCHAR(100),
     breed  VARCHAR(100),
     age    INT,
     PRIMARY KEY (cat_id)
  );
DESC cats;


INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- 4 choose 1 * 1! + 4 choose 2 * 2! + 4 choose 3 * 3! + 4 choose 4 * 4!
       SELECT * FROM cats;

       SELECT name FROM cats;

       SELECT age FROM cats;

       SELECT cat_id FROM cats;

       SELECT name, age FROM cats;

       SELECT cat_id, name, age FROM cats;

       SELECT age, breed, name, cat_id FROM cats;

       SELECT cat_id, name, age, breed FROM cats;

      -- CODE: Introduction to WHERE
      -- Select by age:

       SELECT * FROM cats WHERE age=4;

       --Select by name:

       SELECT * FROM cats WHERE name='Egg';

       --Notice how it deals with case:

       SELECT * FROM cats WHERE name='egG';

       SELECT cat_id FROM cats;

SELECT name, breed FROM cats;

SELECT name, age FROM cats WHERE breed='Tabby';

SELECT cat_id, age FROM cats WHERE cat_id=age;

SELECT * FROM cats WHERE cat_id=age;

--Aliases in sql
SELECT cat_id AS id, name FROM cats;

SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

DESC cats;

-- Update thefacebook to facebook
UPDATE companies SET name='facebook' WHERE name='thefacebook'
--Change tabby cats to shorthair:

UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

--Another update:

UPDATE cats SET age=14 WHERE name='Misty';


SELECT * FROM cats WHERE name='Jackson';

UPDATE cats SET name='Jack' WHERE name='Jackson';

SELECT * FROM cats WHERE name='Jackson';

SELECT * FROM cats WHERE name='Jack';

SELECT * FROM cats WHERE name='Ringo';

UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';

SELECT * FROM cats WHERE name='Ringo';

SELECT * FROM cats;

SELECT * FROM cats WHERE breed='Maine Coon';

UPDATE cats SET age=12 WHERE breed='Maine Coon';

SELECT * FROM cats WHERE breed='Maine Coon';


DELETE FROM cats WHERE name='Egg';

SELECT * FROM cats;

SELECT * FROM cats WHERE name='egg';

DELETE FROM cats WHERE name='egg';

SELECT * FROM cats;

DELETE FROM cats;


SELECT * FROM cats WHERE age=4;

DELETE FROM cats WHERE age=4;

SELECT * FROM cats WHERE age=4;

SELECT * FROM cats;

SELECT *  FROM cats WHERE cat_id=age;

DELETE FROM cats WHERE cat_id=age;

DELETE FROM cats;

SELECT * FROM cats;

















SELECT database();

CREATE DATABASE shirts_db;

use shirts_db;

SELECT database();

CREATE TABLE shirts
  (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(100),
    last_worn INT,
    PRIMARY KEY(shirt_id)
  );

DESC shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

SELECT * FROM shirts;

INSERT INTO shirts(color, article, shirt_size, last_worn)
VALUES('purple', 'polo shirt', 'medium', 50);

SELECT * FROM shirts;
SELECT article, color FROM shirts;

SELECT * FROM shirts WHERE shirt_size='M';

SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';
--U
SELECT * FROM shirts WHERE article='polo shirt';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

SELECT * FROM shirts WHERE article='polo shirt';

SELECT * FROM shirts;

SELECT * FROM shirts WHERE last_worn=15;

UPDATE shirts SET last_worn=0 WHERE last_worn=15;

SELECT * FROM shirts WHERE last_worn=15;

SELECT * FROM shirts WHERE last_worn=0;

SELECT * FROM shirts WHERE color='white';

UPDATE shirts SET color='off white', shirt_size='XS' WHERE color='white';

SELECT * FROM shirts WHERE color='white';

SELECT * FROM shirts WHERE color='off white';

SELECT * FROM shirts;

--D
SELECT * FROM shirts;

SELECT * FROM shirts WHERE last_worn=200;

DELETE FROM shirts WHERE last_worn=200;

SELECT * FROM shirts WHERE article='tank top';

DELETE FROM shirts WHERE article='tank top';

SELECT * FROM shirts WHERE article='tank top';

SELECT * FROM shirts;

DELETE FROM shirts;

SELECT * FROM shirts;

DROP TABLE shirts;

show tables;

DESC shirts;











CREATE TABLE books
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT database();

CREATE DATABASE book_shop;

use book_shop;

show tables;

source book_data.sql

DESC books;

SELECT * FROM books;







SELECT author_fname, author_lname FROM books;

--CONCAT(x,y,z) // from slides

--CONCAT(column, anotherColumn) // from slides

--CONCAT(author_fname, author_lname)

--CONCAT(column, 'text', anotherColumn, 'more text')

--CONCAT(author_fname, ' ', author_lname)

--CONCAT(author_fname, author_lname); // invalid syntax

SELECT CONCAT('Hello', 'World');

SELECT CONCAT('Hello', '...', 'World');

SELECT
  CONCAT(author_fname, ' ', author_lname)
FROM books;

SELECT
  CONCAT(author_fname, ' ', author_lname)
  AS 'full name'
FROM books;

SELECT SUBSTRING('Hello World', 1, 4);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', 3, 8);

SELECT SUBSTRING('Hello World', 3);

SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTRING('Hello World', -7);

SELECT title FROM books;

SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10);

SELECT SUBSTRING(title, 1, 10) FROM books;

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    )
FROM books;

source book_code.sql

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;

source book_code.sql












SELECT REPLACE('Hello World', 'Hell', '%$#@');

SELECT REPLACE('Hello World', 'l', '7');

SELECT REPLACE('Hello World', 'o', '0');

SELECT REPLACE('HellO World', 'o', '*');

SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');

SELECT REPLACE(title, 'e ', '3') FROM books;

-- SELECT
--    CONCAT
--    (
--        SUBSTRING(title, 1, 10),
--        '...'
--    ) AS 'short title'
-- FROM books;

SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
FROM books;

SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string'
FROM books;






SELECT REVERSE('Hello World');

SELECT REVERSE('meow meow');

SELECT REVERSE(author_fname) FROM books;

SELECT CONCAT('woof', REVERSE('woof'));

SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;




SELECT CHAR_LENGTH('Hello World');

SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;


SELECT UPPER('Hello World');

SELECT LOWER('Hello World');

SELECT UPPER(title) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;







SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));


SELECT UPPER(REVERSE('Why does my cat look at me with such hatred?'));


I-like-cats


SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '-');


SELECT REPLACE(title, ' ', '->') AS title FROM books;



SELECT
   author_lname AS forwards,
   REVERSE(author_lname) AS backwards
FROM books;


SELECT
   UPPER
   (
      CONCAT(author_fname, ' ', author_lname)
   ) AS 'full name in caps'
FROM books;


SELECT
   CONCAT(title, ' was released in ', released_year) AS blurb
FROM books;
SELECT
   title,
   CHAR_LENGTH(title) AS 'character count'
FROM books;


SELECT
   CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
   CONCAT(author_lname, ',', author_fname) AS author,
   CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;
Questions






INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


SELECT title FROM books;


SELECT author_lname FROM books;

SELECT DISTINCT author_lname FROM books;

SELECT author_fname, author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

--exactly the same
SELECT * FROM r1, r2 WHERE r1.id = r2.r1_id AND 1;

--finding the book WITH maximum pages
/*
7
The Amazing Adventures of Kavalier & Clay
634
*/
select book_id, title, pages
from books
where
pages = (
    select MAX(pages) as max_pages
	from books
);

select book_id, title, pages
from books
order by pages desc limit 1;

select book_id, title, pages
from books
where pages = ( select MIN(pages) as max_pages from books );

select book_id, title, pages
from books
order by pages asc limit 1;


SELECT b.author_lname, b.title, b.pages
FROM books b, (
    select author_lname, max(pages) as max_pages
    from books
    group by author_lname
) AS author_max

WHERE   b.author_lname = author_max.author_lname
		AND
		b.pages = author_max.max_pages;


SELECT b.author_lname as name, b.title, b.pages
FROM books b, (
    select author_lname, max(pages) as max_pages
    from books
    group by author_lname
) AS author_max

WHERE   b.author_lname = author_max.author_lname
		AND
		b.pages = author_max.max_pages
ORDER BY b.pages DESC;

-- author_lname, corresponding_title, corresponding_min_pages
select b.author_lname, b.title, b.pages
from books b,
    (select author_lname, min(pages) as min_pages
    from books
    group by author_lname) as amin
where b.author_lname = amin.author_lname
	  and
      b.pages = amin.min_pages
order by b.pages ASC;

-- select authors who have written more than the average ( total number of pages written by all authors )
select author_lname, total_pages, avg_total_pages
from
  (
    select author_lname, sum(pages) as total_pages
    from books
    group by author_lname
  )
  as author_pages_sum,
  (
    select avg(total_pages) as avg_total_pages
    from author_pages_sum

  )
  as author_avg
where
  author_pages_sum.total_pages > author_avg.avg_total_pages
;
      b.pages = amin.min_pages
order by b.pages ASC;
