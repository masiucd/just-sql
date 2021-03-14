create table shirts
    (
        shirt_id INTEGER PRIMARY KEY AUTO_INCREMENT,
        article VARCHAR(255),
        color VARCHAR(50),
        shirt_size CHAR(5),
        last_worn INTEGER
    );


INSERT INTO shirts(article,color,shirt_size,last_worn)
    VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);


SELECT * FROM shirts;

-- add a nerw shirt
INSERT INTO shirts(article,color,shirt_size,last_worn)
    VALUES("polo", "purple",'M',50);

-- selext all shirts
SELECT * FROM shirts;


-- SELECT all medium shirts
SELECT * FROM shirts where shirt_size = 'm';

/* Update all polo shirts
Change their size to L */
UPDATE shirts SET shirt_size = 'L' WHERE article LIKE '%polo%';

/* Update the shirt last worn 15 days ago
Change last_worn to 0 */
UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;


/* Update all white shirts
Change size to 'XS' and color to 'off white' */
UPDATE shirts SET shirt_size = 'XS', color = 'off white' WHERE color = 'white';

/* Delete all old shirts
Last worn 200 days ago */
DELETE FROM shirts WHERE last_worn = 200;

/* Delete all tank tops
Your tastes have changed... */
DELETE FROM shirts WHERE article = 'tank top';