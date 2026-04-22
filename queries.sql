#1.Top Rated Movies

SELECT m.title, ROUND(AVG(r.rating),2) AS avg_rating
FROM Ratings r
JOIN Movies m ON r.movie_id = m.movie_id
GROUP BY m.movie_id, m.title
ORDER BY avg_rating DESC;

#2.Most Popular Genres

SELECT m.genre, COUNT(*) AS total_movies
FROM Movies m
GROUP BY m.genre
ORDER BY total_movies DESC;

#3.Most Watched Movies (Trending)

SELECT m.title, COUNT(*) AS views
FROM Watch_History w
JOIN Movies m ON w.movie_id = m.movie_id
GROUP BY m.movie_id, m.title
ORDER BY views DESC;

#4.User Activity Analysis

SELECT u.name, COUNT(w.movie_id) AS movies_watched
FROM Users u
JOIN Watch_History w ON u.user_id = w.user_id
GROUP BY u.user_id, u.name;

#5.Find Similar Users 

SELECT r2.user_id AS similar_user, COUNT(*) AS similarity_score
FROM Ratings r1
JOIN Ratings r2 
ON r1.movie_id = r2.movie_id AND r1.user_id != r2.user_id
WHERE r1.user_id = 1
GROUP BY r2.user_id
ORDER BY similarity_score DESC;

#6.Recommend Movies

SELECT DISTINCT m.title
FROM Ratings r
JOIN Movies m ON r.movie_id = m.movie_id
WHERE r.user_id IN (
    SELECT r2.user_id
    FROM Ratings r1
    JOIN Ratings r2 
    ON r1.movie_id = r2.movie_id AND r1.user_id != r2.user_id
    WHERE r1.user_id = 1
)
AND m.movie_id NOT IN (
    SELECT movie_id FROM Ratings WHERE user_id = 1
);

#7.Highest Rated Movie per Genre

SELECT genre, title, avg_rating
FROM (
    SELECT m.genre, m.title,
           ROUND(AVG(r.rating),2) AS avg_rating,
           RANK() OVER (PARTITION BY m.genre ORDER BY AVG(r.rating) DESC) AS rnk
    FROM Ratings r
    JOIN Movies m ON r.movie_id = m.movie_id
    GROUP BY m.genre, m.title
) t
WHERE rnk = 1;