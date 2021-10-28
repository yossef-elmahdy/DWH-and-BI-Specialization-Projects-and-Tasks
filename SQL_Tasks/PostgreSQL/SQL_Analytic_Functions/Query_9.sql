SELECT bpname, companykey, carryingcost, cumeDistCarryCost
FROM (
	SELECT bpname, companykey, carryingcost,
		CUME_DIST() OVER(ORDER BY carryingcost) AS cumeDistCarryCost
	FROM branch_plant_dim
) AS tempTable
WHERE (1-cumeDistCarryCost) <= 0.15
