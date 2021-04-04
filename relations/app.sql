CREATE TABLE customers( id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), email VARCHAR(100) );

CREATE TABLE orders( id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE, amount DECIMAL(8,2), customer_id INT, FOREIGN KEY(customer_id) REFERENCES customers(id)
ON DELETE CASCADE );

INSERT INTO customers (first_name, last_name, email) VALUES ('Boy', 'George', 'george@gmail.com'), ('George', 'Michael', 'gm@gmail.com'), ('David', 'Bowie', 'david@gmail.com'), ('Blue', 'Steele', 'blue@gmail.com'), ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id) VALUES ('2016/02/10', 99.99, 1), ('2017/11/11', 35.50, 1), ('2014/12/12', 800.67, 2), ('2015/01/03', 12.50, 2), ('1999/04/11', 450.25, 5);

SELECT  `amount`
FROM orders
LEFT JOIN customers
ON orders.`customer_id` = customers.id;

SELECT  c.`first_name` 
       ,c.`last_name` 
       ,o.`amount` AS 'amount to pay'
FROM customers c
INNER JOIN orders o
ON o.`customer_id` = c.`id`; /* with subQuery */

SELECT  *
FROM orders
WHERE customer_id = ( 
SELECT  id
FROM customers
WHERE last_name='George' ); /* 
LEFT JOIN */
SELECT  c.`first_name` 
       ,c.`last_name` 
       ,o.`order_date` 
       ,o.`amount`
FROM `customers` c
LEFT JOIN orders o
ON c.`id` = o.`customer_id`;

SELECT  *
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;

SELECT  first_name 
       ,last_name 
       ,order_date 
       ,amount
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;

SELECT  first_name 
       ,last_name 
       ,IFNULL(SUM(amount),0) AS total_spent
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY  customers.id
ORDER BY total_spent;

SELECT  `first_name` 
       ,IFNULL(order_date,'no order made') 
       ,IFNULL(amount,0)
FROM customers
LEFT JOIN orders
ON customers.`id` = orders.`customer_id`; /* EXERSICE */ -- EXERCISE 1

SELECT  first_name
       ,title
       ,grade
FROM students
INNER JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC; -- ALT SOLUTION

SELECT  first_name
       ,title
       ,grade
FROM students
RIGHT JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC; -- PROBLEM 2

SELECT  first_name
       ,title
       ,grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id; -- PROBLEM 3

SELECT  first_name
       ,IFNULL(title,'MISSING')
       ,IFNULL(grade,0)
FROM students
LEFT JOIN papers
ON students.id = papers.student_id; -- PROBLEM 4

SELECT  first_name
       ,IFNULL(AVG(grade),0) AS average
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY  students.id
ORDER BY average DESC; -- PROBLEM 5

SELECT  first_name
       ,Ifnull(AVG(grade),0)                                          AS average
       ,CASE WHEN AVG(grade) IS NULL THEN 'FAILING' 
             WHEN AVG(grade) >= 75 THEN 'PASSING'  ELSE 'FAILING' END AS passing_status
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY  students.id
ORDER BY average DESC;