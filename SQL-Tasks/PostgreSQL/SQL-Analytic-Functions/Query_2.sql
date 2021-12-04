SELECT state, name, SUM(inventory_fact.extcost)AS sumExtCost,
	RANK() OVER(PARTITION BY state order BY SUM(extcost) DESC) AS rankSumExtCost
FROM inventory_fact
JOIN cust_vendor_dim ON cust_vendor_dim.custvendorkey = inventory_fact.custvendorkey
WHERE transtypekey = 5
GROUP BY state, name
ORDER BY state
