/*
* query 1 
*/ 

SELECT count(*) FROM Flights;

/*
* query 2
* 
*/

SELECT origin AS 'Origin', avg(ArrDelay) AS 'Arrival AVG Delay', avg(DepDelay) AS 'Departure AVG Delay'
FROM Flights
GROUP BY origin;

/*
* query 3
*/


SELECT origin, colYear, colMonth, format(ArrDelay, 4) AS 'Arrival Delay'
FROM Flights
ORDER BY origin, colYear, colMonth;

/*
* query 4
*/

SELECT City, colYear, colMonth, format(ArrDelay, 4) AS 'Arrival Delay'
FROM Flights f
INNER JOIN USAirports a
ON f.origin = a.iata
ORDER BY City, colYear, colMonth;

/*
* query 5
*/

SELECT UniqueCarrier, colYear, colMonth, count(Cancelled) AS 'total_cancelled'
FROM Flights
WHERE Cancelled = "1"
GROUP BY UniqueCarrier, colYear, colMonth
ORDER BY total_cancelled DESC, colMonth, colYear;

/*
* query 6
*/

SELECT TailNum, sum(Distance) AS totalDistance
FROM Flights
WHERE TailNum <> ""
GROUP BY TailNum
ORDER BY totalDistance DESC
LIMIT 10;

/*
* query 7
*/

SELECT UniqueCarrier, format(avg(ArrDelay), 4) AS avgDelay
FROM Flights
GROUP BY UniqueCarrier
HAVING avgDelay > 10
ORDER BY avgDelay DESC;
