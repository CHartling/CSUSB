# Query 1
SELECT hobby, count(*) AS number_of_users
FROM user INNER JOIN hobby ON user.email=hobby.email
GROUP BY hobby;

create table userTEMP as select * from user;

# Query 2
SELECT u.name, u.address, celebrity.kind
FROM userTemp as u INNER JOIN celebrity ON u.email=celebrity.email
WHERE celebrity.kind NOT LIKE 'Movie%';

# Query 3
SELECT name, count(advertisement.id) AS number_of_advertisements
FROM vendor INNER JOIN advertisement ON vendor.id=advertisement.vendorid
GROUP BY name
ORDER BY number_of_advertisements DESC;

# Query 4
SELECT user.email, user.password, user.date_of_birth, celebrity.kind
FROM user INNER JOIN celebrity ON user.email=celebrity.email
WHERE 1 < (SELECT count(follower)
FROM user, celebrity, follow
WHERE celebrity.kind LIKE 'Movie%' AND user.email=celebrity.email AND follow.follower=user.email);

# Query 5
SELECT U2.name, U2.email, count(F.followee) AS number_of_followers
FROM user AS U1, user AS U2, follow as F
WHERE U1.email=F.follower AND U2.email=F.followee AND U2.type='C'
GROUP BY F.followee
HAVING count(F.followee) > 55
ORDER BY count(F.followee) DESC;

# Query 6
SELECT A.name AS user_A, B.name AS user_B
FROM user AS A, user AS B, blurt_analysis AS BlurtA, blurt_analysis AS BlurtB, follow AS F
WHERE A.email=F.follower AND B.email=F.followee AND BlurtA.email=A.email AND BlurtB.email=B.email AND BlurtA.topicid!=BlurtB.topicid
GROUP BY A.name, B.name;

# Query 7
SELECT location, count(location) AS number_of_blurts
FROM blurt
GROUP BY location
ORDER BY count(location) DESC;

# Query 8
SELECT V.name, VA.email, count(F.followee) AS number_of_following
FROM vendor AS V, vendor_ambassador AS VA, follow AS F
WHERE V.id=VA.vendorid AND VA.email=F.follower
GROUP BY V.name, VA.email
ORDER BY count(F.followee) DESC;

# Query 9
SELECT V.id, V.name, VA.email, count(UA.adid)
FROM vendor AS V, vendor_ambassador AS VA, advertisement AS A, user_ad AS UA
WHERE V.id=VA.vendorid AND A.vendorid=V.id AND A.id=UA.adid
GROUP BY V.id, V.name, VA.email
ORDER BY count(UA.adid) DESC;