select DISTINCT inventory_fact.extcost,
	CUME_DIST() OVER(ORDER BY inventory_fact.extcost) AS cumeDistExtCost
from inventory_fact
join cust_vendor_dim ON cust_vendor_dim.custvendorkey = inventory_fact.custvendorkey
where state = 'CO'
ORDER BY inventory_fact.extcost
