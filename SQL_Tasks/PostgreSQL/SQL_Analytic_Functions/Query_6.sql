SELECT seconditemid, SUM(inventory_fact.extcost) AS sumExtCost,
	SUM(inventory_fact.extcost) / SUM(SUM(inventory_fact.extcost))
	OVER() AS ratioToReportExtCost
FROM inventory_fact
JOIN item_master_dim ON item_master_dim.itemmasterkey = inventory_fact.itemmasterkey
WHERE transtypekey = 1
GROUP BY seconditemid
ORDER BY sumExtCost DESC
