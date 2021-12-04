CREATE MATERIALIZED VIEW SalesByVendorDateKeyMV2012 AS
SELECT custvendorkey, inventory_fact.datekey, SUM(extcost)AS sumExtCost2,
	SUM(quantity) AS sumQuantity2, COUNT(*) AS numInvTransactions2
FROM inventory_fact
JOIN date_dim ON date_dim.datekey = inventory_fact.datekey
WHERE transtypekey = 5
	AND calyear = 2012
GROUP BY custvendorkey, inventory_fact.datekey
