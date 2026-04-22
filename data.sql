USE movie_db;

-- USERS
INSERT INTO Users (name, age) VALUES
('Deepika', 21),
('Arjun', 23),
('Rahul', 25),
('Sneha', 22),
('Kiran', 24);

-- MOVIES
INSERT INTO Movies (title, genre) VALUES
('Inception', 'Sci-Fi'),
('Interstellar', 'Sci-Fi'),
('Avengers', 'Action'),
('Joker', 'Drama'),
('Titanic', 'Romance'),
('Bahubali', 'Action'),
('3 Idiots', 'Comedy'),
('KGF', 'Action');

-- RATINGS
INSERT INTO Ratings (user_id, movie_id, rating) VALUES
(1,1,5),(1,2,5),(1,3,4),
(2,1,4),(2,3,5),(2,6,4),
(3,2,5),(3,4,4),(3,5,5),
(4,3,4),(4,7,5),(4,8,4),
(5,6,5),(5,8,4),(5,1,3);

-- WATCH HISTORY
INSERT INTO Watch_History (user_id, movie_id, watch_date) VALUES
(1,1,'2024-04-01'),
(1,2,'2024-04-02'),
(2,3,'2024-04-03'),
(3,4,'2024-04-04'),
(4,7,'2024-04-05'),
(5,6,'2024-04-06'),
(2,6,'2024-04-07'),
(3,5,'2024-04-08'),
(4,8,'2024-04-09');
