# One to many (1 -> \*)

One to many relationship is one of the most common relation in `sql`.
A example of a `1 to *` relation could be:
`a post has only one author, but a author could have many posts.`

A good tip is too say it laud for your self to easier connect the logic on how the relations should work and connect to each other.

Relationship Basics
`This is not marriage counseling`

- One to One Relationship
- One to Many Relationship (`really common`)
- Many to Many Relationship

So when using relations with other tables we will have to `join` the tables with help of using `foreign keys`.

for example we will store a `author_id` on the post table that will match the `id` on the author table.
In that whey we can make references and connect the data.

-- IMPLICIT INNER JOIN

```sql
SELECT * FROM customers, orders
WHERE customers.id = orders.customer_id;
```

-- IMPLICIT INNER JOIN

```sql
SELECT first_name, last_name, order_date, amount
FROM customers, orders
    WHERE customers.id = orders.customer_id;
```

-- EXPLICIT INNER JOINS

```sql
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
```

```sql
SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;

SELECT *
FROM orders
JOIN customers
    ON customers.id = orders.customer_id;
```

-- ARBITRARY JOIN - meaningless, but still possible

```sql
SELECT * FROM customers
JOIN orders ON customers.id = orders.id;
```

## Left joins

```sql
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;


SELECT
    first_name,
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;
```

---

### Many to many

The way how I like to think about `many to many` reflation work, is to find a real case of scenario in real life.
for example:

- Books <---> Authors
- Blog Post <---> Tags
- Students <---> Classes

A book could have multiple authors and authors can have many books.
blog post could have many tags and tags can belong to different posts.
students have multiple classes and classes has multiple students.
