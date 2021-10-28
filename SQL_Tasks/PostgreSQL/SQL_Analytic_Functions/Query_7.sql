SELECT calyear, seconditemid, SUM(inventory_fact.extcost) AS sumExtCost,
	SUM(inventory_fact.extcost) / SUM(SUM(inventory_fact.extcost))
	OVER(PARTITION BY calyear) AS ratioToReportExtCost
FROM inventory_fact
JOIN item_master_dim ON item_master_dim.itemmasterkey = inventory_fact.itemmasterkey
JOIN date_dim ON date_dim.datekey = inventory_fact.datekey
WHERE transtypekey = 1
GROUP BY calyear, seconditemid
ORDER BY calyear, sumExtCost DESC
