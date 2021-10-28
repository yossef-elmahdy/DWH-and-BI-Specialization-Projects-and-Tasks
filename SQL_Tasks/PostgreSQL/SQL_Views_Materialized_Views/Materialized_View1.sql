CREATE MATERIALIZED VIEW SalesByVendorDateKeyMV2011 AS
SELECT custvendorkey, inventory_fact.datekey, SUM(extcost)AS sumExtCost,
	SUM(quantity) AS sumQuantity, COUNT(*) AS numInvTransactions
FROM inventory_fact
JOIN date_dim ON date_dim.datekey = inventory_fact.datekey
WHERE transtypekey = 5
	AND calyear = 2011
GROUP BY custvendorkey, inventory_fact.datekey
