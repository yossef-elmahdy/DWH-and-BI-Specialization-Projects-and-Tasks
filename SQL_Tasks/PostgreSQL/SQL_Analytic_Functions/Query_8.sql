SELECT bpname, companykey, carryingcost,
	RANK() OVER(ORDER BY carryingcost DESC) AS rankCarryCost,
	PERCENT_RANK() OVER(ORDER BY carryingcost DESC) AS percentRankCarryCost,
	CUME_DIST() OVER(ORDER BY carryingcost DESC) AS cumeDistCarryCost
FROM branch_plant_dim
