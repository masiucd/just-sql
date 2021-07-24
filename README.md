# Just SQL

## Table of Contents

- [About](#about)
  <!-- - [Create](#create) -->
  <!-- - [Insert](#insert) -->
- [Select](#select)
- [If Null](#ifNull)

## About <a name = "about"></a>

SQL concepts, working with relational databases.
This project uses:

- `My SQL`
<!-- - `Postgres SQL`
- `SQL lite` -->

## Create <a name ="create"></a>

## Insert <a name ="insert"></a>

## Select <a name ="select"></a>

when starting a `sql` query we start with the `select statement`.

**different queriers**

```sql
SELECT b.title FROM books b;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 14;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 0,5;

SELECT b.title FROM books b WHERE CHAR_LENGTH(b.title) > 20;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;
```

<!-- ## Aggregate <a name="aggregate"></a> -->

<!-- ## On delete Cascade -->

## [If Null](#ifNull)

To filter out the null values we can use `IFNULL` function.
`IFNULL` takes in 2 arguments, the value to check against and what we we want to replace the `null` value with.

```sql
SELECT p.first_name,p.last_name,
IFNULL(SUM(o.amount), 0) AS total_spent
FROM `people` p
LEFT	JOIN orders o ON p.id = o.`customer_id`
	GROUP BY p.`id`
	ORDER BY sum
	;
```
