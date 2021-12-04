------------------------SELECT Statement Problems-----------------------------------

--Question 1
SELECT eventrequest.eventNo, dateHeld, COUNT(planNo) AS numberOfPlans
FROM eventrequest
JOIN eventplan ON eventplan.eventNo = eventrequest.eventNo
WHERE workDate BETWEEN '2018-12-01' AND '2018-12-31'
GROUP BY eventrequest.eventNo, dateHeld
HAVING COUNT(planNo) > 1;


--Question 2
SELECT eventplan.planNo, eventNo, workDate, activity
FROM eventplan
JOIN eventplanline ON eventplanline.planNo = eventplan.planNo
JOIN location ON location.locNo = eventplanline.locNo
JOIN facility ON facility.facNo = location.facNo
WHERE (workDate BETWEEN '2018-12-01' AND '2018-12-31')
	AND (facName = 'Basketball arena');


--Question 3
SELECT eventrequest.eventNo, dateHeld, status, estCost
FROM eventrequest
JOIN facility ON facility.facNo = eventrequest.facNo
JOIN eventplan ON eventplan.eventNo = eventrequest.eventNo
JOIN employee ON employee.empNo = eventplan.empNo
WHERE (empName = 'Mary Manager')
	AND (facName = 'Basketball arena')
    AND (dateHeld BETWEEN '2018-10-01' AND '2018-12-31')


--Question 4
SELECT eventplanline.planNo, lineNo, resName, numberFld, locName,
	timeStart, timeEnd, facName, activity, workDate
FROM eventplanline
JOIN eventplan ON eventplan.planNo = eventplanline.planNo
JOIN resourcetbl ON resourcetbl.resNo = eventplanline.resNo
JOIN location ON location.locNo = eventplanline.locNo
JOIN facility ON facility.facNo = location.facNo
WHERE (facName = 'Basketball arena')
	AND	(activity = 'Operation')
    AND (workDate BETWEEN '2018-10-01' AND '2018-12-31')


------------------------Modification Problems-----------------------------------

--Question 1
INSERT INTO facility
VALUES
('F999', 'Swimming Pool')

--Question 2
INSERT INTO location
VALUES
('L999', 'F999', 'Door')

--Question 3
INSERT INTO location
VALUES
('L998', 'F999', 'Locker Room')

--Question 4
SET SQL_SAFE_UPDATES = 0;
    UPDATE location
    SET locName = 'Gate'
    WHERE locNo = 'L999'
SET SQL_SAFE_UPDATES = 1;

--Question 5
DELETE FROM location
WHERE locNo = 'L998'


----------------SQL Statements with Errors and Poor Formatting------------------
--Question 1  --> Semantic Error (missing join)
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estAudience > 5000
    AND eventplan.eventNo = eventrequest.eventNo
    AND eventplan.empNo = employee.empNo
    AND eventrequest.faNo = facility.facNo
    AND facName = 'Football stadium'
    AND empName = 'Mary Manager'


--Question 2  --> Redundancy Error (unneeded group clause)
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno


--Question 3  --> Redundancy Error (extra unused tables)
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, facility
WHERE estaudience > 5000
  AND eventrequest.facno = facility.facno
  AND facname = 'Football stadium'


--Question 4  --> Syntax Error (misspelled keyword & unqualified column name)
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEEN 5000 AND 10000
  AND eventplan.empno = employee.empno
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager'


--Question 5  --> Formatting & best practicies
--              Identation - cross joins and conditions separate 
SELECT eventplan.planno, lineno, resname,
	numberfld, timestart, timeend
FROM eventrequest, facility, eventplan,
	eventplanline, resourcetbl
WHERE estaudience = '10000'
    AND eventplan.planno = eventplanline.planno
    AND eventrequest.facno = facility.facno
    AND eventplanline.resno = resourcetbl.resno
    AND eventrequest.eventno = eventplan.eventno
    AND facname = 'Basketball arena'
