 /* still USING Books DB */
SELECT  *
FROM books
WHERE released_year > 2003; 

SELECT  b.title
FROM books b
WHERE b.title != 'fake_book'; 

SELECT  title
FROM books
WHERE title LIKE 'W'; 

SELECT  title
FROM books
WHERE title LIKE 'W%'; 

SELECT  title
FROM books
WHERE title LIKE '%W%'; 

SELECT  title
FROM books
WHERE title LIKE 'W%'; 

SELECT  title
FROM books
WHERE title NOT LIKE 'W%'; 

SELECT  b.title
FROM books b
WHERE b.title NOT LIKE 'W%'; 

SELECT  CONCAT("book ----",title," author ----",author_fname) AS 'most pages '
FROM books
WHERE pages >= 500
ORDER BY pages DESC 
LIMIT 2 ;

SELECT  *
FROM books
WHERE pages >= 450 
AND released_year > 300
ORDER BY pages DESC ; 

SELECT  b.title 
       ,b.`released_year`
FROM books b
WHERE b.released_year BETWEEN 2004 AND 2006; 

SELECT  b.title 
       ,b.`author_lname`
FROM books b
WHERE b.`author_lname` IN ('Car ver' 'Lahiri' 'Smith'）; 

SELECT  b.`title` 
       ,b.`author_fname`
FROM books b
WHERE b.`author_fname` IN ('Ne il'）; 

SELECT  *
FROM books;

SELECT  b.title 
       ,b.`released_year` 
       ,CASE WHEN b.`released_year` >= 2000 THEN 'modern book'  ELSE '20-th c entury' END AS 'genre'
FROM books b;

SELECT  title
       ,`stock_quantity`
       ,CASE WHEN `stock_quantity` BETWEEN 0 AND 50 THEN '*' 
             WHEN `stock_quantity` BETWEEN 51 AND 100 THEN '**' 
             WHEN `stock_quantity` BETWEEN 101 AND 150 THEN '***'  ELSE '****' END AS 'stars'
FROM books
ORDER BY `stock_quantity` DESC ; 



/************************ EXERSICE!!! *************************/


SELECT 10 != 10;
-- false
 
SELECT 15 > 14 && 99 - 5 <= 94;
-- true
 
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
-- true
 
SELECT title, released_year FROM books WHERE released_year < 1980;
 
SELECT title, author_lname FROM books WHERE author_lname='Eggers' OR author_lname='Chabon';
 
SELECT title, author_lname FROM books WHERE author_lname IN ('Eggers','Chabon');
 
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Lahiri' && released_year > 2000;
 
SELECT title, pages FROM books WHERE pages >= 100 && pages <=200;
 
SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;
 
SELECT 
    title, 
    author_lname 
FROM books 
WHERE 
    author_lname LIKE 'C%' OR 
    author_lname LIKE 'S%';
 
SELECT 
    title, 
    author_lname 
FROM books 
WHERE 
    SUBSTR(author_lname,1,1) = 'C' OR 
    SUBSTR(author_lname,1,1) = 'S';
 
SELECT title, author_lname FROM books 
WHERE SUBSTR(author_lname,1,1) IN ('C', 'S');
 
SELECT 
    title, 
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;
 
SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;