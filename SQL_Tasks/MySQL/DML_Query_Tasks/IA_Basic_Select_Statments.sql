--USING MySQL:

--Question 1
SELECT DISTINCT city, state, zip
FROM customer;

--Question 2
SELECT empName, department, phone, email
FROM employee
WHERE phone LIKE '3-%';


--Question 3
SELECT *
FROM resourcetbl
WHERE rate BETWEEN 10 AND 20
ORDER BY rate;


--Question 4
SELECT *
FROM eventrequest
WHERE (status IN ('Approved', 'Denied'))
	AND (dateAuth BETWEEN '2018-07-01' AND '2018-07-31');

--Question 4 (Another Answer)
SELECT *
FROM eventrequest
WHERE status IN ('Approved', 'Denied')
	AND DATE_FORMAT(dateAuth, '%Y-%m-%d') LIKE '2018-07-%';


--Quesion 5
SELECT locNo, locName
FROM location
JOIN facility ON facility.facNo = location.facNo
WHERE facName = 'Basketball arena';

--Question 6
SELECT planNo, COUNT(planNo) AS NumberOfPlans, SUM(numberFld) AS TotalResources
FROM eventplanline
GROUP BY planNo;
