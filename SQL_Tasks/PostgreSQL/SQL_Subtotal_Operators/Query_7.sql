SELECT COMPANY_DIM.COMPANYNAME,
	BRANCH_PLANT_DIM.BPNAME,
	SUM(INVENTORY_FACT.EXTCOST) AS SUMEXTCOST,
	SUM(INVENTORY_FACT.QUANTITY) AS SUMQUANTITY
FROM INVENTORY_FACT
JOIN TRANS_TYPE_DIM ON TRANS_TYPE_DIM.TRANSTYPEKEY = INVENTORY_FACT.TRANSTYPEKEY
JOIN BRANCH_PLANT_DIM ON BRANCH_PLANT_DIM.BRANCHPLANTKEY = INVENTORY_FACT.BRANCHPLANTKEY
JOIN COMPANY_DIM ON COMPANY_DIM.COMPANYKEY = BRANCH_PLANT_DIM.COMPANYKEY
WHERE INVENTORY_FACT.TRANSTYPEKEY = 2
GROUP BY COMPANY_DIM.COMPANYNAME, BRANCH_PLANT_DIM.BPNAME
UNION
SELECT COMPANY_DIM.COMPANYNAME,
	NULL,
	SUM(INVENTORY_FACT.EXTCOST) AS SUMEXTCOST,
	SUM(INVENTORY_FACT.QUANTITY) AS SUMQUANTITY
FROM INVENTORY_FACT
JOIN TRANS_TYPE_DIM ON TRANS_TYPE_DIM.TRANSTYPEKEY = INVENTORY_FACT.TRANSTYPEKEY
JOIN BRANCH_PLANT_DIM ON BRANCH_PLANT_DIM.BRANCHPLANTKEY = INVENTORY_FACT.BRANCHPLANTKEY
JOIN COMPANY_DIM ON COMPANY_DIM.COMPANYKEY = BRANCH_PLANT_DIM.COMPANYKEY
WHERE INVENTORY_FACT.TRANSTYPEKEY = 2
GROUP BY COMPANY_DIM.COMPANYNAME
UNION
SELECT NULL, NULL,
	SUM(INVENTORY_FACT.EXTCOST) AS SUMEXTCOST,
	SUM(INVENTORY_FACT.QUANTITY) AS SUMQUANTITY
FROM INVENTORY_FACT
JOIN TRANS_TYPE_DIM ON TRANS_TYPE_DIM.TRANSTYPEKEY = INVENTORY_FACT.TRANSTYPEKEY
JOIN BRANCH_PLANT_DIM ON BRANCH_PLANT_DIM.BRANCHPLANTKEY = INVENTORY_FACT.BRANCHPLANTKEY
JOIN COMPANY_DIM ON COMPANY_DIM.COMPANYKEY = BRANCH_PLANT_DIM.COMPANYKEY
WHERE INVENTORY_FACT.TRANSTYPEKEY = 2
ORDER BY 1, 2;