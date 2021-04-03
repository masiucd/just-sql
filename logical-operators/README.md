# Logical operators

Like in other programing langues we can use `logical operators` in SQL to filter out columns based on a specific condition.

For example:

```sql
SELECT title FROM books WHERE released_year = 2017;

SELECT title FROM books WHERE released_year != 2017;

SELECT title, author_lname FROM books;

SELECT title, author_lname FROM books WHERE author_lname = 'Harris';

SELECT title, author_lname FROM books WHERE author_lname != 'Harris';
```

### operators

- `!=` ---> Not equal
- `=` ---> Equal
- `NOT LIKE` ---> Not like, opposite to `LIKE`
- `LIKE` ---> Like, opposite to `NOT LIKE`
- `>` ---> Greater Than
- `<` ---> Less Than
- `>=` ---> Greater then or equal to
- `<=` ---> Less then or equal to
- `AND` ---> And
- `&&` ---> And
- `||` ---> Or
- `OR` ---> Or
- `BETWEEN` ---> Between
- `IN` ---> is in a specific set
- `%` ---> Modulo

#### Not like

```sql
SELECT title FROM books WHERE title LIKE 'W';

SELECT title FROM books WHERE title LIKE 'W%';

SELECT title FROM books WHERE title LIKE '%W%';

SELECT title FROM books WHERE title LIKE 'W%';

SELECT title FROM books WHERE title NOT LIKE 'W%';

```

#### Greater then

```sql
SELECT 'C' > 'B' AS 'yes it\'s true;

SELECT title, released_year FROM books ORDER BY released_year;

SELECT title, released_year FROM books
WHERE released_year > 2000 ORDER BY released_year;

SELECT title, released_year FROM books
WHERE released_year >= 2000 ORDER BY released_year;

SELECT title, stock_quantity FROM books;

SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

SELECT 99 > 1;

SELECT 99 > 567;

100 > 5
-- true

-15 > 15
-- false

9 > -10
-- true

1 > 1
-- false

'a' > 'b'
-- false

'A' > 'a'
-- false

'A' >=  'a'
-- true

SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';

SELECT title, author_lname FROM books WHERE author_lname = 'eggers';

SELECT title, author_lname FROM books WHERE author_lname = 'eGGers';
```

#### Less then

```sql
SELECT title, released_year FROM books;

SELECT title, released_year FROM books
WHERE released_year < 2000;

SELECT title, released_year FROM books
WHERE released_year <= 2000;

SELECT 3 < -10;
-- false

SELECT -10 < -9;
-- true

SELECT 42 <= 42;
-- true

SELECT 'h' < 'p';
-- true

SELECT 'Q' <= 'q';
-- true

```

#### And

```sql
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers';

SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010;

SELECT
    title,
    author_lname,
    released_year FROM books
WHERE author_lname='Eggers'
    AND released_year > 2010;

SELECT 1 < 5 && 7 = 9;
-- false

SELECT -10 > -20 && 0 <= 0;
-- true

SELECT -40 <= 0 AND 10 > 40;
--false

SELECT 54 <= 54 && 'a' = 'A';
-- true

SELECT *
FROM books
WHERE author_lname='Eggers'
    AND released_year > 2010
    AND title LIKE '%novel%';
```

#### Or

```sql
SELECT
    title,
    author_lname,
    released_year
FROM books
WHERE author_lname='Eggers' || released_year > 2010;


SELECT 40 <= 100 || -2 > 0;
-- true

SELECT 10 > 5 || 5 = 5;
-- true

SELECT 'a' = 5 || 3000 > 2000;
-- true

SELECT title,
       author_lname,
       released_year,
       stock_quantity
FROM   books
WHERE  author_lname = 'Eggers'
              || released_year > 2010
OR     stock_quantity > 100;
```

#### Between

```sql
ELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;

SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015;

SELECT CAST('2017-05-02' AS DATETIME);

show databases;

use new_testing_db;

SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';

SELECT
    name,
    birthdt
FROM people
WHERE
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);


```

##### In and not in

```sql
SELECT
    title,
    author_lname
FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';

SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);

SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;

SELECT title, released_year FROM books
WHERE released_year NOT IN
(2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN
(2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0;

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;
```

##### Case

```sql
SELECT title, released_year,
       CASE
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;

SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

SELECT title,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;

SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
```
