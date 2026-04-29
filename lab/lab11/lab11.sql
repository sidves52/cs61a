-- Data format for reference:
-- CREATE TABLE titles (tconst TEXT PRIMARY KEY, title TEXT, year INTEGER, runtime INTEGER, genres TEXT);

-- CREATE TABLE ratings (tconst TEXT PRIMARY KEY, averageRating REAL, numVotes INTEGER);

-- CREATE TABLE crew (tconst TEXT PRIMARY KEY, directors TEXT, writers TEXT);

-- CREATE TABLE principals (tconst TEXT, ordering INTEGER, nconst TEXT, category TEXT, character TEXT);

-- CREATE TABLE names (nconst TEXT PRIMARY KEY, name TEXT, birth INTEGER, death INTEGER, profession TEXT, knownForTitles TEXT);


CREATE table newest AS
  SELECT title, year FROM titles ORDER BY year DESC LIMIT 10;


CREATE table dog_movies AS 
  SELECT title, character FROM titles JOIN principals ON titles.tconst = principals.tconst WHERE character LIKE "%dog%";


CREATE table leads AS 
  SELECT name, COUNT(*) FROM names JOIN principals ON names.nconst = principals.nconst WHERE principals.ordering = 1
  GROUP BY names.nconst HAVING COUNT(*) > 10;


CREATE table long_movies AS 
  SELECT (FLOOR(year / 10) * 10) || "s" AS decade, COUNT(*) as count FROM titles WHERE runtime > 180 GROUP BY decade;

