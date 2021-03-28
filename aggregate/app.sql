 /* COUNT */ /* how many items we have IN our TABLE */
SELECT  COUNT(*)
FROM books;

SELECT  COUNT(b.author_fname)
FROM books b;

SELECT  COUNT(DISTINCT author_fname)
FROM books;

SELECT  COUNT(DISTINCT author_lname)
FROM books;

SELECT  COUNT(DISTINCT author_lname,author_fname)
FROM books;

SELECT  b.title
FROM books b
WHERE b.title LIKE '%the%';

SELECT  COUNT(*)
FROM books
WHERE title LIKE '%the%'; /*
GROUP BY  */
SELECT  title
       ,author_lname
FROM books;

SELECT  title
       ,author_lname
FROM books
GROUP BY  author_lname;

SELECT  author_lname
       ,COUNT(*)
FROM books
GROUP BY  author_lname;

SELECT  title
       ,author_fname
       ,author_lname
FROM books;

SELECT  b.title
       ,b.author_fname
       ,b.author_lname
FROM books b
GROUP BY  author_lname;

SELECT  author_fname
       ,author_lname
       ,COUNT(*)
FROM books
GROUP BY  author_lname;

SELECT  author_fname
       ,author_lname
       ,COUNT(*)
FROM books
GROUP BY  author_lname
         ,author_fname;

SELECT  b.released_year
FROM books b;

SELECT  released_year
       ,COUNT(*)
FROM books
GROUP BY  released_year;

SELECT  CONCAT('In ',released_year,' ',COUNT(*),' book(s) released') AS year
FROM books
GROUP BY  released_year; /* MIN AND MAX */

SELECT  MIN(released_year)
FROM books;

SELECT  MIN(released_year)
FROM books;

SELECT  MIN(pages)
FROM books;

SELECT  MAX(pages)
FROM books;

SELECT  MAX(released_year)
FROM books;

SELECT  MAX(pages)
       ,title
FROM books; /* SUBQURIES */

SELECT  b.title
       ,b.author_lname
FROM books b
WHERE b.pages = (
SELECT  MAX(b.pages)
FROM books b); /* A better approach */

SELECT  b.title
       ,b.author_lname
FROM books b
ORDER BY b.pages DESC
LIMIT 1;

SELECT  *
FROM books
ORDER BY pages ASC
LIMIT 1;

SELECT  title
       ,pages
FROM books
ORDER BY pages ASC
LIMIT 1;

SELECT  *
FROM books
ORDER BY pages DESC
LIMIT 1;

SELECT  CONCAT(author_fname," ",author_lname) AS author
       ,MAX(pages)                            AS pages
FROM books
GROUP BY  author_fname
         ,author_lname
ORDER BY MAX(pages) DESC; /* SUM */

SELECT  author_lname
       ,SUM(pages) AS total_pages
FROM books
GROUP BY  author_lname
ORDER BY total_pages DESC;

SELECT  author_fname
       ,author_lname
       ,SUM(released_year)
FROM books
GROUP BY  author_lname
         ,author_fname; /* Avereage*/

SELECT  ROUND(AVG(released_year))
FROM books;

SELECT  AVG(stock_quantity)
FROM books
GROUP BY  released_year;

SELECT  released_year
       ,AVG(stock_quantity)
FROM books
GROUP BY  released_year;

SELECT  author_fname
       ,author_lname
       ,AVG(pages)
FROM books
GROUP BY  author_lname
         ,author_fname; /* Cahalange */ /* Print the number of books IN the database */

SELECT  COUNT(b.title) AS 'total books'
FROM books b; /* Print out how many books were released IN each year */

SELECT  b.released_year        AS year
       ,COUNT(b.released_year) AS amount
FROM books b
GROUP BY  b.released_year
ORDER BY amount DESC; /* Print out the total number of books IN stock */

SELECT  SUM(stock_quantity) AS 'amount IN stock'
FROM books; /* Find the average released_year for each author */

SELECT  b.author_fname
       ,ROUND(AVG(b.released_year))
FROM books b
GROUP BY  b.released_year
         ,b.author_fname; /* Find the full name of the author who wrote the longest book */

SELECT  CONCAT(b.author_fname," ",b.author_lname) AS fullname
       ,MAX(b.pages)                              AS max_pages
FROM books b
GROUP BY  fullname
ORDER BY max_pages DESC
LIMIT 1 ;

SELECT  b.released_year        AS year
       ,COUNT(b.released_year) AS '# books'
       ,AVG(b.pages)as 'avg pages'
FROM books b
GROUP BY  year
ORDER BY 'avg pages'
         ,year; /* same result AS above */

SELECT  released_year AS year
       ,COUNT(*)      AS '# of books'
       ,AVG(pages)    AS 'avg pages'
FROM books
GROUP BY  released_year;