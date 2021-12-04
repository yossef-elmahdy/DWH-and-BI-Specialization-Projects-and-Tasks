--Question 1
SELECT eventNo, dateHeld, eventrequest.custNo AS custNo,
	custName, eventrequest.facNo AS facNo, facName, city
FROM eventrequest
JOIN customer ON customer.custNo = eventrequest.custNo
JOIN facility ON facility.facNo = eventrequest.facNo
WHERE (dateHeld BETWEEN '2018-01-01' AND '2018-12-31')
	AND (city = 'Boulder');


--Question 2
SELECT customer.custNo AS custNo, custName, eventNo, dateHeld,
	facility.facNo AS facNo, facName,
    estCost/estAudience AS estAudienceCostPerPerson
 FROM customer
JOIN eventrequest ON eventrequest.custNo = customer.custNo
JOIN facility ON facility.facNo = eventrequest.facNo
WHERE (dateHeld BETWEEN '2018-01-01' AND '2018-12-31')
	AND (estCost/estAudience < 0.2);


--Question 3
SELECT customer.custNo AS custNo, custName,
	SUM(estCost) AS totalEstCost
FROM customer
JOIN eventrequest ON eventrequest.custNo = customer.custNo
WHERE status = 'Approved'
GROUP BY customer.custNo, custName;
