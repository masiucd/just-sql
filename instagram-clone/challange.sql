/* Reward our users who have been around longest, find 5 oldest users */
---
SELECT  *
FROM users
ORDER BY `created_at` ASC
LIMIT 5;
--- /* What day do most users register? */
SELECT  DAYNAME(`created_at`) AS DAY
       ,COUNT(*)              AS amount
FROM users
GROUP BY  DAY
ORDER BY amount DESC;
-------------------------------------------
------------------------------------------- /* Find the users who have never posted a photo */
SELECT  username
FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.id IS NULL;
-------------------------------------------
------------------------------------------- /* We're running a new contest to see who can get the most likes */
---------------------------------
SELECT  p.id     AS photo_id
       ,u.`username`
       ,u.`id`   AS user_id
       ,p.`image_url`
       ,COUNT(*) AS most_likes
FROM `photos` p
INNER JOIN likes l
ON l.`photo_id` = p.`id`
INNER JOIN users u
ON p.`user_id` = u.`id`
GROUP BY  p.`id`
ORDER BY most_likes DESC
LIMIT 1 ;
------------------------------------------- /* Our Investors want to know... How many times does the average user post? */
--------------------------
SELECT  (
SELECT  COUNT(*)
FROM photos) / (
SELECT  COUNT(*)
FROM users) AS average ;



-------------------------------------------- /* Top 5 most common hashtags */
--------------------------------------------
SELECT  t.`tag_name`
       ,COUNT(*) AS amount
FROM tags t
JOIN `photo_tags` ph
ON t.id = ph.`tag_id`
GROUP BY  t.`tag_name`
ORDER BY amount DESC
LIMIT 5 ;
--------------------------------------------
/* Most likes */
-----------------------------------
SELECT  u.`username`
       ,COUNT(*) AS most_likes
FROM users u
INNER JOIN likes l
ON u.id = l.`user_id`
GROUP BY  u.id
HAVING most_likes = (
SELECT  COUNT(*)
FROM `photos`)
ORDER BY most_likes DESC ;