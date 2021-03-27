Aggregate function help us to improve our `queries` as well as optimize them.
**get all the distinct firstnames from a table**:

```sql
  SELECT COUNT(DISTINCT u.name) FROM users p;
```

What is going on here is the `group by` will treat each `author_lname` as a separate row

`Count(*)` in this case will refer to only the grouped rows

```sql
SELECT b.author_lname, COUNT(*) FROM books b GROUP by b.author_lname;
```

<img src="./g.svg" />
