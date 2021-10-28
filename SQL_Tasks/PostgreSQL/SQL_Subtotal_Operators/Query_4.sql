SELECT TRANS_TYPE_DIM.TRANSDESCRIPTION,
	COMPANY_DIM.COMPANYNAME,
	BRANCH_PLANT_DIM.BPNAME,
	SUM(INVENTORY_FACT.EXTCOST) AS SUMEXTCOST,
	COUNT(*) AS NUMINVTRANSACTIONS
FROM INVENTORY_FACT
JOIN TRANS_TYPE_DIM ON TRANS_TYPE_DIM.TRANSTYPEKEY = INVENTORY_FACT.TRANSTYPEKEY
JOIN BRANCH_PLANT_DIM ON BRANCH_PLANT_DIM.BRANCHPLANTKEY = INVENTORY_FACT.BRANCHPLANTKEY
JOIN COMPANY_DIM ON COMPANY_DIM.COMPANYKEY = BRANCH_PLANT_DIM.COMPANYKEY
GROUP BY GROUPING SETS( (trans_type_dim.transdescription, company_dim.companyname, branch_plant_dim.bpname),
					  (trans_type_dim.transdescription, company_dim.companyname),
					  trans_type_dim.transdescription,
					   () )
ORDER BY GROUPING(trans_type_dim.transdescription, company_dim.companyname, branch_plant_dim.bpname),
	trans_type_dim.transdescription, company_dim.companyname, branch_plant_dim.bpname
