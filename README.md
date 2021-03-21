# Just SQL

## Table of Contents

- [About](#about)
  <!-- - [Create](#create) -->
  <!-- - [Insert](#insert) -->
- [Select](#select)

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
