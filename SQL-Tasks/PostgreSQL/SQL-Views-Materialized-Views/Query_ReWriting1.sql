SELECT calmonth, addrcatcode1, SUM(sumExtCost) AS sumExtCost,
	SUM(sumQuantity) AS sumQuantity
FROM salesbyvendordatekeymv2011
JOIN cust_vendor_dim ON cust_vendor_dim.custvendorkey = salesbyvendordatekeymv2011.custvendorkey
JOIN date_dim ON date_dim.datekey = salesbyvendordatekeymv2011.datekey
GROUP BY CUBE(calmonth, addrcatcode1)
