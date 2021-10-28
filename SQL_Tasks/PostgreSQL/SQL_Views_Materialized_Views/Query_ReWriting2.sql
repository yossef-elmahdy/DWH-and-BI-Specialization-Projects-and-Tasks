SELECT calquarter, zip, name, SUM(sumExtCost) AS extCostSubTotal,
	SUM(sumNumTransactions) AS numTransSubTotal
FROM (
	SELECT calquarter, cust_vendor_dim.zip,
		cust_vendor_dim.name, SUM(sumExtCost) AS sumExtCost,
		SUM(numinvtransactions) AS sumNumTransactions
	FROM salesbyvendordatekeymv2011
	JOIN date_dim ON date_dim.datekey = salesbyvendordatekeymv2011.datekey
	JOIN cust_vendor_dim on cust_vendor_dim.custvendorkey = salesbyvendordatekeymv2011.custvendorkey
	GROUP BY calyear, calquarter, cust_vendor_dim.zip, cust_vendor_dim.name
	UNION
	SELECT calquarter, cust_vendor_dim.zip,
		cust_vendor_dim.name, SUM(sumExtCost2) AS sumExtCost,
		SUM(numinvtransactions2) AS sumNumTransactions
	FROM salesbyvendordatekeymv2012
	JOIN date_dim on date_dim.datekey = salesbyvendordatekeymv2012.datekey
	JOIN cust_vendor_dim ON cust_vendor_dim.custvendorkey = salesbyvendordatekeymv2012.custvendorkey
	GROUP BY calyear, calquarter, cust_vendor_dim.zip, cust_vendor_dim.name
) AS tempTable
GROUP BY CUBE(calquarter, zip, name)
