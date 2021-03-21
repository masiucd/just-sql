-- Wer are still using the book db in sthis section
-- insert just thesee as well
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- Using DISTINCT
-- get unique valuers from the table

SELECT DISTINCT author_lname FROM books;

SELECT author_fname, author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

SELECT COUNT(author_lname) FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;


-- Order by
-- by default ASC

SELECT b.author_lname FROM books b ORDER BY b.author_lname;


SELECT b.author_lname FROM books b ORDER BY b.author_lname ASC;
SELECT b.title FROM books b ORDER BY b.title DESC;

-- order by  b.author_fname
SELECT b.title, b.author_fname, b.author_lname FROM books b ORDER by 2 DESC;
-- order by  b.title
SELECT b.title, b.author_fname, b.author_lname FROM books b ORDER by 1 DESC;

SELECT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname;


-- LIMIT
SELECT b.title FROM books b ORDER BY b.title DESC LIMIT 3 ;

SELECT b.pages AS 'top-five-most-pages' FROM books b ORDER BY b.pages DESC LIMIT 5;

SELECT title FROM books LIMIT 3;

SELECT title FROM books LIMIT 1;

SELECT title FROM books LIMIT 10;

SELECT * FROM books LIMIT 1;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 1;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 14;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 0,5;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 0,3;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 1,3;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 10,1;

SELECT * FROM tbl LIMIT 95,18446744073709551615;

SELECT title FROM books LIMIT 5;

SELECT title FROM books LIMIT 5, 123219476457;

SELECT title FROM books LIMIT 5, 50;


-- LIKE pattern matching
SELECT b.title FROM books b WHERE b.title LIKE "The%";
-- Starts with A
SELECT b.title FROM books b WHERE b.title LIKE "A%";
-- includes A
SELECT b.title FROM books b WHERE b.title LIKE "%A%";
-- ends with Bardo
SELECT b.title FROM books b WHERE b.title LIKE "%Bardo";

SELECT title, stock_quantity FROM books;

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';

(235)234-0987 LIKE '(___)___-____'
SELECT title FROM books;

SELECT title FROM books WHERE title LIKE '%\%%'

SELECT title FROM books WHERE title LIKE '%\_%'


-- operators
SELECT b.released_year as 'last 3 released books' FROM books b
WHERE b.released_year > 2004
order by b.released_year DESC limit 3;



-- **************** Exsersice *******************---

-- Select All Story Collections
-- Titles  That contain 'stories'

SELECT b.title FROM books b WHERE b.title LIKE '%stories%';


-- Find The Longest Book
-- Print Out the Title and Page Count

SELECT b.title, b.pages FROM books b ORDER BY b.pages DESC LIMIT 1;

-- Print a summary containing the title and year, for the 3 most recent books
SELECT CONCAT(b.title, " -- ",b.released_year)
AS summary
FROM books b ORDER BY b.released_year DESC LIMIT 3;

-- Find all books with an author_lname
-- that contains a space(" ")
SELECT b.author_lname FROM books b WHERE b.author_lname LIKE '% %';

-- Find The 3 Books With The Lowest Stock
-- Select title, year, and stock
SELECT b.title,b.released_year,b.stock_quantity
FROM books b
ORDER BY b.stock_quantity,b.title ASC LIMIT 3;

-- Print title and author_lname, sorted first by author_lname and then by title
SELECT b.title,b.author_lname FROM books b
ORDER BY 1,2 DESC;