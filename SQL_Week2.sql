/*
School of Professional Studies - CUNY
Duubar Villalobos Jimenez
mydvtech@gmail.com
January 2017.

BRIDGE SQL
*/

/*
  Week 2 Assignment: SQL One to Many Relationships
  SQL_Week2.sql
  */
  
  
  /*
  In this assignment, we’ll practice working with one -to-many relationships in SQL.  Suppose you are tasked with keeping 
track of a database that contain the best “how-to” videos on MySQL.  
  */
  
# You may want to first create a new database (schema) for this assignment.

# My SCHEMA is called videos.

/*
1. Videos table.  Create one table to keep track of the videos.  This table should include a unique ID, the title of the 
video, the length in minutes, and the URL.  Populate the table with at least three related videos from YouTube or 
other publicly available resources.
*/

DROP TABLE IF EXISTS tblVideos;
 
 # Create table Videos
CREATE TABLE tblVideos
(
  video_id int PRIMARY KEY,
  title varchar(80) NOT NULL,
  lenght int NOT NULL,
  url varchar(100) NOT NULL
);

INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 1, 'KEYLOR NAVAS | Amazing Saves Show - 2015/2016 (Part1) | HD', 6 , 'https://www.youtube.com/watch?v=mbdaPBx_ltY');
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 2, 'Keylor Navas - Best Saves 2014/2015 | HD'                  , 4 , 'https://www.youtube.com/watch?v=eZNCJFpFWNs');
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 3, 'Keylor Navas 2016 Epic Saves Show '                        , 11, 'https://www.youtube.com/watch?v=KqSHkQZCH_4');
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 4, 'Top 10 Goalkeepers in the World - Season 2015/16 HD '      , 12, 'https://www.youtube.com/watch?v=3YbA0xokous');


SELECT * FROM tblVideos;

/*2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for 
each of at least two of the videos.  These should be imaginary reviews that include columns for the user’s name 
(“Asher ”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review 
(“Loved it!”).  There should be a column that links back to the ID column in the table of videos.
*/

DROP TABLE IF EXISTS tblReviews;
 
 # Create table Videos
CREATE TABLE tblReviews
(
  review_id int PRIMARY KEY,
  video_id int NOT NULL REFERENCES tblVideos,
  user varchar(30) NOT NULL,
  rating int,
  review varchar(30) NOT NULL
);

INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 1, 1, 'Elias'    , 5    , 'Navas is the Best﻿!' );
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 2, 1, 'Sergio'   , 5    , 'Hala Madrid!﻿' );
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 3, 4, 'Claudio'  , 3    , 'Courtois is horrible!﻿﻿' );
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 4, 4, 'Dora'     , 4    , 'Buffon is a historical!﻿' );
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 5, 3, 'Allan'    , NULL , 'Under rated﻿!' );
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 6, 3, 'Eric'     , 4    , 'Really impressed!' );


SELECT * FROM tblReviews;

/*
3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.
*/

SELECT 
V.title As 'Title',
V.lenght AS 'Lenght',
V.url AS 'URL',
R.user As 'User',
R.rating As 'Rating',
R.review AS 'Review'
FROM tblVideos AS V
JOIN tblReviews AS R
ON V.video_id = R.video_id;