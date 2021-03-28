CREATE TABLE books ( book_id INT NOT NULL AUTO_INCREMENT, title VARCHAR(100), author_fname VARCHAR(100), author_lname VARCHAR(100), released_year INT, stock_quantity INT, pages INT, PRIMARY KEY(book_id) );

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages) VALUES ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291), ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304), ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465), ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198), ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352), ('The Circle', 'Dave', 'Eggers', 2013, 26, 504), ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634), ('Just Kids', 'Patti', 'Smith', 2010, 55, 304), ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437), ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208), ('What We Talk About WHEN We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176), ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526), ('White Noise', 'Don', 'DeLillo', 1985, 49, 320), ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181), ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329), ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343); /* Concat */ /* make fullname of the authors */

SELECT  CONCAT(author_fname,' ' ,author_lname) AS full_name
FROM books;

SELECT  CONCAT(b.title," " ,b.book_id) AS 'title-with-id'
FROM books b;

SELECT  author_fname                              AS first
       ,author_lname                              AS last
       ,CONCAT(author_fname,' ... ',author_lname) AS full_name
FROM books;

SELECT  CONCAT_WS(' - ',title,author_fname,author_lname)
FROM books; /* Substring */ /* Work With Parts Of Strings */

SELECT  SUBSTRING("hello World",1,4); /**hell*/

SELECT  SUBSTRING(author_fname,0,2)
FROM books;

SELECT  CONCAT( SUBSTRING(author_fname,1,1),SUBSTRING(author_lname,1,1) ) AS Initials
FROM books;

SELECT  CONCAT ( SUBSTRING(title,1,10),'...' )
FROM books; /* Replace */

SELECT  REPLACE("hello world","hello","boo"); /*boo world */

SELECT  REPLACE(title,'The','')
FROM books;

SELECT  SUBSTRING(REPLACE(title,'e','3'),1,10)
FROM books;

SELECT  SUBSTRING(REPLACE(title,'e','3'),1,10) AS 'weird string'
FROM books; /* Rverser */

SELECT  REVERSE("boo");

SELECT  CONCAT("not reversed ",b.title," reversed ",REVERSE(b.title))FROM books b;

SELECT  CONCAT(author_fname,REVERSE(author_fname))
FROM books; /* Char length */

SELECT  CHAR_LENGTH('Hello World');

SELECT  b.title
FROM books b
WHERE CHAR_LENGTH(b.title) > 20;

SELECT  CONCAT(author_lname,' is ',CHAR_LENGTH(author_lname),' characters long')
FROM books; /* Upper AND lower */

SELECT  UPPER('Hello World');

SELECT  LOWER('Hello World');

SELECT  UPPER(title)
FROM books;

SELECT  CONCAT('MY FAVORITE BOOK IS ',UPPER(title))
FROM books;

SELECT  CONCAT('MY FAVORITE BOOK IS ',LOWER(title))
FROM books; /* ***************Challange**************** */ /* Reverse AND Uppercase the following sentence */ /* "Why does my cat look at me with such hatred?" */

SELECT  REVERSE(UPPER("Why does my cat look at me with such hatred?")); /* Replace spaces IN titles with '->' */

SELECT  REPLACE(b.title," "," -> ") AS title
FROM books b; /* Ppint forward AND backwords of authors first name */

SELECT  b.author_fname          AS forwards
       ,REVERSE(b.author_lname) AS backwords
FROM books b; /* full name IN caps */

SELECT  CONCAT(UPPER(author_fname)," " ,UPPER(author_lname)) AS 'full name IN caps'
FROM books;

SELECT  CONCAT(b.title," was released IN ",b.released_year) AS blurb
FROM books b;

SELECT  b.title              AS title
       ,CHAR_LENGTH(b.title) AS 'char count'
FROM books b;

SELECT  CONCAT(SUBSTRING(b.title,1,10),"...")     AS short_title
       ,CONCAT(b.author_fname," ",b.author_lname) AS author
       ,CONCAT(b.stock_quantity," IN stock")      AS quantity
FROM books b;