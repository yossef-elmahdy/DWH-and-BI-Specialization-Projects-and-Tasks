SELECT name, COUNT(*) AS InvTransCount,
	RANK() OVER(ORDER BY COUNT(*) DESC) AS rankCount,
	DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS denseRankCount
FROM inventory_fact
JOIN cust_vendor_dim ON cust_vendor_dim.custvendorkey = inventory_fact.custvendorkey
WHERE transtypekey = 5
GROUP BY name
