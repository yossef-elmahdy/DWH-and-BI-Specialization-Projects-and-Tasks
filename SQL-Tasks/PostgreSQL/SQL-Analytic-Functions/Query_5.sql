SELECT cust_vendor_dim.zip, calyear, calmonth, SUM(inventory_fact.extcost) AS sumExtCost,
	SUM(SUM(inventory_fact.extcost))
	OVER(PARTITION BY zip, calyear ORDER BY zip, calyear, calmonth
		ROWS UNBOUNDED PRECEDING) AS cumSumExtCost
FROM inventory_fact
JOIN cust_vendor_dim ON cust_vendor_dim.custvendorkey = inventory_fact.custvendorkey
JOIN date_dim ON date_dim.datekey = inventory_fact.datekey
WHERE transtypekey = 5
GROUP BY cust_vendor_dim.zip, calyear, calmonth
