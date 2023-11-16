/*-----------------CLEANING DATA IN SQL QUERIES------------------------*/

SELECT *
FROM movies.dbo.movie

----------------------------------------------------------------------------------------------

-- Looking for any duplicate rows

SELECT COUNT(name) AS total_obs
FROM movies.dbo.movie

SELECT DISTINCT COUNT(name) AS total_distinct_obs
FROM movies.dbo.movie

----------------------------------------------------------------------------------------------

-- Replacing null values in rating column

UPDATE movies.dbo.movie
SET rating = 'Not Rated'
WHERE rating is NULL

----------------------------------------------------------------------------------------------

-- Calculating avg budget and gross for each genre

SELECT 
	genre,
	AVG(budget) AS avg_budget,
	AVG(gross) AS avg_revenue
FROM movies.dbo.movie
GROUP BY genre
ORDER BY avg_revenue DESC

-----------------------------------------------------------------------------------------------

-- Top most rated directors

SELECT TOP 10
	director,
	AVG(score) AS avg_score
FROM movies.dbo.movie
GROUP BY director
ORDER BY avg_score DESC

-----------------------------------------------------------------------------------------------

-- Top 250 best rated movies

SELECT TOP 250
	name, score, director, writer, star, country, company, budget, gross
FROM movies.dbo.movie
ORDER BY score DESC

-----------------------------------------------------------------------------------------------

-- Most profitable movies

SELECT name, score,director, star, country,
	(gross-budget) AS profit
FROM movies.dbo.movie
ORDER BY profit DESC

-----------------------------------------------------------------------------------------------

-- Most watched genre

SELECT
	genre,
	COUNT(genre) AS count_of_genres
FROM movies.dbo.movie
GROUP BY genre
ORDER BY count_of_genres DESC

------------------------------------------------------------------------------------------------

-- In which year the maximum numbers of movies were released

SELECT
	year,
	COUNT(year) as movies_released 
FROM movies.dbo.movie
GROUP BY year
ORDER BY movies_released DESC

-----------------------------------------------------------------------------------------------

-- Top 3 most profitable movies are 'Avatar', 'Avengers Endgame' and 'Titanic'.
-- Top 3 best rated movies are 'The Shawshank Redemption', 'The Dark Knight' and 'Pulp Fiction'.
-- 2 Indians in top 5 best rated directors: Anurag Kashyap (Black Friday)  and Aamir Khan (Like Stars on Earths)
-- Top Genre: Comedy, Action, Drama, Crime
-- Most number of movies were rleased in 2015 (200 movies) and least in 2020 (25 movies)
