--Question 1
SELECT custNo, custName, phone, city
FROM customer


--Question 2
SELECT custNo, custName, phone, city
FROM customer
WHERE state = 'CO'


--Question 3
SELECT *
FROM eventrequest
WHERE estCost > 4000
ORDER BY dateHeld


--Question 4
SELECT eventNo, dateHeld, estAudience, status
FROM eventrequest
WHERE (estAudience > 9000)
    OR (status = 'Pending' AND estAudience > 7000);


--Question 5
SELECT eventNo, dateHeld, customer.custNo, custName
FROM eventrequest
JOIN customer ON customer.custNo = eventrequest.custNo
WHERE DATE_FORMAT(dateHeld, '%Y-%m-%d') LIKE '2018-01-%' /*dateHeld BETWEEN '2018-01-01' AND '2018-01-30'*/
	AND customer.city = 'Boulder';


--Question 6
SELECT planNo, AVG(numberFld) AS "Average Number of Resources"
FROM eventplanline
WHERE locNo = 'L100'
GROUP BY planNo


--Question 7
SELECT planNo, AVG(numberFld) AS "Average Number of Resources",
        COUNT(planNo) AS "Number of Plan Lines"
FROM eventplanline
WHERE locNo = 'L100'
GROUP BY planNo
HAVING COUNT(planNo) >= 2;
