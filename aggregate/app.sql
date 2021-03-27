/* COUNT */
/* how many items we have in our table */
SELECT COUNT(*) FROM books;

SELECT COUNT(b.author_fname) FROM books b;

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

SELECT b.title FROM books b WHERE b.title LIKE '%the%';

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';




/* GROUP BY */

SELECT title, author_lname FROM books;

SELECT title, author_lname FROM books
GROUP BY author_lname;

SELECT author_lname, COUNT(*)
FROM books GROUP BY author_lname;


SELECT title, author_fname, author_lname FROM books;

SELECT b.title, b.author_fname, b.author_lname FROM books b GROUP BY author_lname;

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

SELECT b.released_year FROM books b;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;


/* MIN AND MAX */

SELECT MIN(released_year)
FROM books;

SELECT MIN(released_year) FROM books;

SELECT MIN(pages) FROM books;

SELECT MAX(pages)
FROM books;

SELECT MAX(released_year)
FROM books;

SELECT MAX(pages), title
FROM books;


/* SUBQURIES */
select b.title,b.author_lname from books b where b.pages = (select MAX(b.pages) from books b);
/* A better approach */
select b.title,b.author_lname from books b order by b.pages DESC limit 1;


SELECT * FROM books
ORDER BY pages ASC LIMIT 1;

SELECT title, pages FROM books
ORDER BY pages ASC LIMIT 1;

SELECT * FROM books
ORDER BY pages DESC LIMIT 1;


select CONCAT(author_fname," ", author_lname) as author,
MAX(pages) as pages
from books group by author_fname,author_lname order by MAX(pages) DESC;


/* SUM */
select author_lname ,SUM(pages) as total_pages
from books group by author_lname
order by total_pages DESC;

SELECT author_fname,
       author_lname,
       Sum(released_year)
FROM books
GROUP BY
    author_lname,
    author_fname;

/*  Avereage*/
select ROUND(AVG(released_year)) from books;


SELECT AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT author_fname, author_lname, AVG(pages) FROM books
GROUP BY author_lname, author_fname;


/* Cahalange */


/* Print the number of books in the database */

select count(b.title) as 'total books' from books b;

/* Print out how many books were released in each year */
select b.released_year as year ,count(b.released_year) as amount
from books b group by b.released_year
order by amount DESC;

/* Print out the total number of books in stock */
select sum(stock_quantity) as 'amount in stock' from books;


/* Find the average released_year for each author */
select b.author_fname,
ROUND(AVG(b.released_year)) from books b
group by b.released_year,b.author_fname;


/* Find the full name of the author who wrote the longest book */
SELECT CONCAT(b.author_fname," ",b.author_lname)
as fullname , MAX(b.pages)
as max_pages from books b group by
fullname order by max_pages DESC limit 1 ;



select b.released_year as year, COUNT(b.released_year) as '# books',
AVG(b.pages)as 'avg pages'
from books b
group by year order by 'avg pages',year;

/* same result as above */
SELECT released_year AS year,
    COUNT(*) AS '# of books',
    AVG(pages) AS 'avg pages'
FROM books
    GROUP BY released_year;