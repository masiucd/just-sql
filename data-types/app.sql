SELECT  CONCAT(u.name," was created
ON " ,MONTHNAME(u.birthdt)," the ",DAY(u.birthdt),"th" )
FROM users u;

SELECT  name
       ,birthdate
FROM people;

SELECT  name
       ,DAY(birthdate)
FROM people;

SELECT  name
       ,birthdate
       ,DAY(birthdate)
FROM people;

SELECT  name
       ,birthdate
       ,DAYNAME(birthdate)
FROM people;

SELECT  name
       ,birthdate
       ,DAYOFWEEK(birthdate)
FROM people;

SELECT  name
       ,birthdate
       ,DAYOFYEAR(birthdate)
FROM people;

SELECT  name
       ,birthtime
       ,DAYOFYEAR(birthtime)
FROM people;

SELECT  name
       ,birthdt
       ,DAYOFYEAR(birthdt)
FROM people;

SELECT  name
       ,birthdt
       ,MONTH(birthdt)
FROM people;

SELECT  name
       ,birthdt
       ,MONTHNAME(birthdt)
FROM people;

SELECT  name
       ,birthtime
       ,HOUR(birthtime)
FROM people;

SELECT  name
       ,birthtime
       ,MINUTE(birthtime)
FROM people;

SELECT  CONCAT(MONTHNAME(birthdate),' ',DAY(birthdate),' ',YEAR(birthdate))
FROM people;

SELECT  DATE_FORMAT(birthdt,'Was born
ON a %W')
FROM people;

SELECT  DATE_FORMAT(birthdt,'%m/%d/%Y')
FROM people;

SELECT  DATE_FORMAT(birthdt,'%m/%d/%Y at %h:%i')
FROM people; /* TIme stamp */

CREATE TABLE comments ( content VARCHAR(100), created_at TIMESTAMP DEFAULT NOW() );

INSERT INTO comments (content) VALUES('lol what a funny article');

INSERT INTO comments (content) VALUES('I found this offensive');

INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');

SELECT  *
FROM comments
ORDER BY created_at DESC;

CREATE TABLE comments2 ( content VARCHAR(100), changed_at TIMESTAMP DEFAULT NOW()
ON UPDATE CURRENT_TIMESTAMP );

INSERT INTO comments2 (content) VALUES('dasdasdasd');

INSERT INTO comments2 (content) VALUES('lololololo');

INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS'); UPDATE comments2

SET content='THIS IS NOT GIBBERISH'
WHERE content='dasdasdasd';

SELECT  *
FROM comments2;

SELECT  *
FROM comments2
ORDER BY changed_at;

CREATE TABLE comments2 ( content VARCHAR(100), changed_at TIMESTAMP DEFAULT NOW()
ON UPDATE NOW() );

SELECT  DAYOFWEEK(CURDATE());

SELECT  DAYOFWEEK(NOW());

SELECT  DATE_FORMAT(NOW(),'%w') + 1;

SELECT  DAYNAME(NOW());

SELECT  DATE_FORMAT(NOW(),'%W');

SELECT  DATE_FORMAT(CURDATE(),'%m/%d/%Y');

SELECT  DATE_FORMAT(NOW(),'%M %D at %h:%i');

CREATE TABLE tweets( content VARCHAR(140), username VARCHAR(20), created_at TIMESTAMP DEFAULT NOW() );

INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');

SELECT  *
FROM tweets;

INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');

SELECT  *
FROM tweets;