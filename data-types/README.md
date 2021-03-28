# Data types in SQL

[Char](#char)
[Int](#int)
[Dates](#dates)
[Date Math](#date-math)

## Char <a name ="char"></a>

Char has a fixed length comparing to foe example `VARCHAR`.
When is it useful?
Let's say we have table where we need to know if the person is a female ore a male.
Or why not a yes ore no column.
It could look something like this.

```sql
  female = 'f'
  male = 'm'

  yes = 'y'
  no = 'n'
```

Char is also faster for fixed text length.
If it does not make sense for your purposes the just use `VARCHAR`

```sql
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));

INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');

INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');

INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');

SELECT * FROM dogs;

INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');

SELECT * FROM dogs;
```

## Int <a name ="int"></a>

There are different types of integers. One of theme are the `Decimal`.
Similar to decimals is also `floats` and `doubles`.
If you come from a `Java` background you should be pretty familiar how these data types,
works and when to use them.

```sql
CREATE TABLE items(price DECIMAL(5,2));

INSERT INTO items(price) VALUES(7);

INSERT INTO items(price) VALUES(7987654);

INSERT INTO items(price) VALUES(34.88);

INSERT INTO items(price) VALUES(298.9999);

INSERT INTO items(price) VALUES(1.9999);

SELECT  *
FROM items;
```

With `floats` and `doubles`. Just to make is short and simple, the difference by these three integers types is that is how they gets stored in memory.
`floats` and `doubles` will also store larger numbers in less space they are more `approximate` comapring to the `decimal` type which has a more fixed memory size.

```sql
CREATE TABLE thingies (price FLOAT);

INSERT INTO thingies(price) VALUES (88.45);

SELECT * FROM thingies;

INSERT INTO thingies(price) VALUES (8877.45);

SELECT * FROM thingies;

INSERT INTO thingies(price) VALUES (8877665544.45);

SELECT * FROM thingies;
```

## Dates <a name ="dates"></a>

- `DATE`
  Values With a Date But No Time
  `'YYYY-MM-DD'` Format

- `TIME`
  Values With a Time But No Date
  `'HH:MM:SS'` Format

- `DATETIME`
  Values With a Date AND Time
  `'YYYY-MM-DD HH:MM:SS'` Format

Useful functions to genereate your dates in your tables are:

```sql
select CURDATE();  /*DATE*/
select CURTIME(); /*TIME*/
SELECT NOW(); /*DATETIME*/
```

```sql
create table users(
    name  varchar(255) not null unique,
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT users(name,birthdate,birthtime,birthdt) VALUES
("Frank",CURDATE() ,CURTIME() , NOW());
```

##### Formatting dates

```sql
SELECT name, birthdate FROM users;

SELECT name, DAY(birthdate) FROM users;

SELECT name, birthdate, DAY(birthdate) FROM users;

SELECT name, birthdate, DAYNAME(birthdate) FROM users;

SELECT name, birthdate, DAYOFWEEK(birthdate) FROM users;

SELECT name, birthdate, DAYOFYEAR(birthdate) FROM users;

SELECT name, birthtime, DAYOFYEAR(birthtime) FROM users;

SELECT name, birthdt, DAYOFYEAR(birthdt) FROM users;

SELECT name, birthdt, MONTH(birthdt) FROM users;

SELECT name, birthdt, MONTHNAME(birthdt) FROM users;

SELECT name, birthtime, HOUR(birthtime) FROM users;

SELECT name, birthtime, MINUTE(birthtime) FROM users;

SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM users;

SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM users;

SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM users;

SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM users;
```

## Date Math <a Date Math ="date-math"></a>

we can use useful datemethods in sql for example to find the difference between two dates

```sql
SELECT * FROM users;

SELECT DATEDIFF(NOW(), birthdate) FROM users;

SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM users;

SELECT birthdt FROM users;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM users;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM users;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM users;

SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM users;

SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM users;

SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM users;
select birthtime, DATE_ADD(birthtime, INTERVAL 1 HOUR) from users;
```
