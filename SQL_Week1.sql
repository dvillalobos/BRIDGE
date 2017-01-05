/*
School of Professional Studies - CUNY
Duubar Villalobos Jimenez
mydvtech@gmail.com
January 2017.

BRIDGE SQL
*/

/*
  Week 1 Assignment: SQL Select and Aggregations
  SQL_Week1.sql
  
  Assignment:  SQL Select and Aggregations

Please use the tables in the flights database.
Your deliverable should include the SQL queries that you write in support of your conclusions.
*/

/* 1. Which destination in the flights database is the furthest distance away, based on information in the flights table. 
*/

-- Answer: The furthest distance away is from JFK to HNL with 4983 miles.
SELECT DISTINCT origin, dest, distance FROM flights
WHERE distance IN (SELECT MAX(distance) FROM flights);

/* 2. What are the different numbers of engines in the planes table?
For each number of engines, which aircraft have the most number of seats?
Show the SQL statement(s) that support your result.
*/

-- Amswer: There are 4 different types of engines in the planes table.
SELECT engines FROM planes
GROUP by engines
ORDER By engines DESC;

-- Amswer: The below script will generate the most number of seats  for each number of engines in the plane.
SELECT DISTINCT engines, max(seats) FROM planes
GROUP by engines
ORDER By max(seats) DESC;

/* 3. Show the total number of flights.
*/

-- Amswer:
SELECT COUNT(*) FROM flights;

/* 4. Show the total number of flights by airline (carrier).
*/

-- Amswer:
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier;

/* 5. Show all of the airlines, ordered by number of flights in descending order.
*/

-- Amswer:
SELECT carrier, COUNT(*) AS FlightCount FROM flights
GROUP BY carrier
ORDER By FlightCount DESC;

/* 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
*/

-- Amswer:
SELECT carrier, COUNT(*) AS FlightCount FROM flights
GROUP BY carrier
ORDER By FlightCount DESC LIMIT 5;

/* 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of 
flights in descending order.
*/

-- Amswer:
SELECT carrier, COUNT(*) AS FlightCount, distance FROM flights
WHERE distance >=1000
GROUP BY carrier
ORDER By FlightCount DESC LIMIT 5;

/* 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and 
write down both the question, and the query that answers the question.
*/

-- Question: Show only the total of departure delays over 30 minutes, by number of flights delayed for each month, ordered by month in descending order.
SELECT year, month, COUNT(*) AS FlightsDelayed FROM flights
WHERE dep_delay >=30
GROUP BY year, month
ORDER By month DESC;