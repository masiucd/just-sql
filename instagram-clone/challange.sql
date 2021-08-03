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
SELECT p.id AS photo_id, u.`username`,u.`id` AS user_id, p.`image_url`,COUNT(*) AS most_likes FROM `photos` p
INNER JOIN likes l 
ON l.`photo_id` = p.`id`
INNER JOIN users u
ON p.`user_id` = u.`id`
GROUP BY p.`id`
ORDER BY most_likes DESC 
LIMIT 1
;
------------------------------------------- 