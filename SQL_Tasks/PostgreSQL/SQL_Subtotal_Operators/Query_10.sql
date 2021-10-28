SELECT DATE_DIM.CALYEAR,
	DATE_DIM.CALQUARTER,
	CUST_VENDOR_DIM.NAME,
	SUM(INVENTORY_FACT.EXTCOST) AS SUMEXTCOST,
	COUNT(*) AS NUMINVTRANSACTIONS
FROM INVENTORY_FACT
JOIN TRANS_TYPE_DIM ON TRANS_TYPE_DIM.TRANSTYPEKEY = INVENTORY_FACT.TRANSTYPEKEY
JOIN DATE_DIM ON DATE_DIM.DATEKEY = INVENTORY_FACT.DATEKEY
JOIN CUST_VENDOR_DIM ON CUST_VENDOR_DIM.CUSTVENDORKEY = INVENTORY_FACT.CUSTVENDORKEY
WHERE INVENTORY_FACT.TRANSTYPEKEY = 5
	AND (DATE_DIM.CALYEAR = 2011 OR DATE_DIM.CALYEAR = 2012)
GROUP BY GROUPING SETS(CUST_VENDOR_DIM.NAME, ROLLUP(DATE_DIM.CALYEAR, DATE_DIM.CALQUARTER))
ORDER BY GROUPING( DATE_DIM.CALYEAR, DATE_DIM.CALQUARTER, CUST_VENDOR_DIM.NAME),
	DATE_DIM.CALYEAR, DATE_DIM.CALQUARTER, CUST_VENDOR_DIM.NAME
