SELECT * FROM vzw_sandbox.Fuze_Proj
WHERE Projects_Fuze_project_id ='16270303'

SELECT * FROM vzw_sandbox.Fuze_Dash
WHERE Projects_Fuze_project_id ='16270303'

SELECT 
Dashboar_C_Band_bucket,
count(*)
FROM vzw_sandbox.qgis_slc_fuze_view
GROUP BY Dashboar_C_Band_bucket
WHERE Projects_Fuze_project_id ='16270303'

##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### cband_ready
############################################################
DROP VIEW IF EXISTS vzw_sandbox.cband_ready
CREATE VIEW vzw_sandbox.cband_ready AS
SELECT 
fp.Projects_Fuze_project_id,
fp.Projects_Site_name,
fp.Projects_site_info_id,
STR_TO_DATE(Projects_activation_forecast_date,'%m/%d/%Y') as Project_Activation_Withdraw_Milestone_F,
fp.Projects_trans_contr_bandwidth,
fp.Projects_plan_year,
fp.Projects_Subtype,
fp.Projects_atoll_site_latitude,
fp.Projects_atoll_site_longitude,
ds.Dashboar_C_Band_bucket,
fp.Projects_local_market,
fp.Projects_Status,
ds.Dashboar_Status,
"CBand_Ready" as CBand_Status,
fp.Projects_trans_dt

FROM vzw_sandbox.fuze_proj fp
JOIN vzw_sandbox.fuze_dash ds on fp.Projects_Fuze_project_id = ds.Dashboar_Fuze_project_id

WHERE 
#fp.Projects_local_market = 'Salt Lake City'
#AND
ds.Dashboar_C_Band_bucket = 'Built/Capable'
AND
fp.Projects_Subtype = '5G L-Sub6 - Carrier Add'

##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### cband_forecast Jan 4th 
############################################################
DROP VIEW IF EXISTS vzw_sandbox.cband_forecast
CREATE VIEW vzw_sandbox.cband_forecast AS
SELECT 
fp.Projects_Fuze_project_id,
fp.Projects_Site_name,
fp.Projects_site_info_id,
STR_TO_DATE(Projects_activation_forecast_date,'%m/%d/%Y') as Project_Activation_Withdraw_Milestone_F,
fp.Projects_trans_contr_bandwidth,
fp.Projects_plan_year,
fp.Projects_Subtype,
fp.Projects_atoll_site_latitude,
fp.Projects_atoll_site_longitude,
ds.Dashboar_C_Band_bucket,
fp.Projects_local_market,
fp.Projects_Status,
ds.Dashboar_Status,
"CBand_Forecast" as CBand_Forecast,
fp.Projects_trans_dt

FROM vzw_sandbox.fuze_proj fp
JOIN vzw_sandbox.fuze_dash ds on fp.Projects_Fuze_project_id = ds.Dashboar_Fuze_project_id

WHERE 
#fp.Projects_local_market = 'Salt Lake City'
#AND
ds.Dashboar_C_Band_bucket != 'Built/Capable'
AND
fp.Projects_Subtype = '5G L-Sub6 - Carrier Add'
AND
STR_TO_DATE(Projects_activation_forecast_date,'%m/%d/%Y') <= '2022-01-05'
AND
fp.Projects_plan_year = '2021'



##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### All 2021 CBand Projects
############################################################
DROP VIEW IF EXISTS vzw_sandbox.cband_forecast_2021

CREATE VIEW vzw_sandbox.cband_forecast_2021 AS
SELECT * FROM vzw_sandbox.cband_ready
UNION
SELECT * FROM vzw_sandbox.cband_forecast;

##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### MTP Olp site sector LIST
############################################################
DROP VIEW IF EXISTS vzw_sandbox.olp_cband_site_list
CREATE VIEW vzw_sandbox.olp_cband_site_list AS
SELECT 
	`VZ SITE ID (Fuze)` AS OLP_Site_Info_id,
	`VZ SITE NAME` AS VZ_SITE_NAME, 
	Market,
	`PEA#` AS PEA,
	FIPS,
	`SECTOR ID` AS SECTOR_ID,
	`CELL ID` AS CELL_ID,
	`UL CHANNEL WIDTH (MHz)` AS UL_CHANNEL_WIDTHMHz,
	`DL CHANNEL WIDTH (MHz)` AS DL_CHANNEL_WIDTHMHz,
	`SECTOR AZIMUTH` AS SECTOR_AZIMUTH,
	`SITE TYPE (MACRO / DRAN / CRAN / MICRO / PICO / iDAS)` AS SITE_TYPE,
	LATITUDE,
	LONGITUDE,
	GNB_ID,
	VZ_CARRIER_LABEL,
	VZ_CELL_NAMEE,
	VZ_CELL_ID,
	'OLP' AS OLP_FLAG
FROM vzw_sandbox.CBand_Approved_Sectors_12_01_2021
where Market like ("Salt Lake City (Mountain)")

##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### I using this query on the EXCEL spread sheet to bring the informaiton for the CBand sites, 2021 POR and the results
############################################################

SELECT 
    POR.Projects_Fuze_project_id,
	POR.Projects_site_info_id,
	POR.Projects_atoll_site_latitude,
	POR.Projects_atoll_site_longitude,
	POR.Projects_Site_name,
	POR.Project_Activation_Withdraw_Milestone_F,
	POR.Projects_trans_contr_bandwidth,
	POR.Dashboar_C_Band_bucket,
	POR.Projects_local_market,
	POR.Projects_Status,
	POR.Dashboar_Status,
	POR.CBand_Status,
    OLP.OLP_FLAG,
    TST.SECTOR_ID,
    TST.TEST_STATUS,
    TST.TEST_CREATED

FROM vzw_sandbox.cband_forecast_2021  POR
LEFT JOIN vzw_sandbox.olp_cband_site_list OLP ON POR.Projects_site_info_id = OLP.OLP_Site_Info_id
LEFT JOIN vzw_sandbox.cband_test_results TST ON OLP.OLP_Site_Info_id = TST.IOP_SITE_ID

GROUP BY 
    POR.Projects_Fuze_project_id,
	POR.Projects_Site_name,
	POR.Projects_site_info_id,
	POR.Project_Activation_Withdraw_Milestone_F,
	POR.Projects_trans_contr_bandwidth,
	POR.Projects_atoll_site_latitude,
	POR.Projects_atoll_site_longitude,
	POR.Dashboar_C_Band_bucket,
	POR.Projects_local_market,
	POR.Projects_Status,
	POR.Dashboar_Status,
	POR.CBand_Status,
    OLP.OLP_FLAG,
    TST.SITE_BANDWIDTH,
    TST.SECTOR_ID,
    TST.TEST_STATUS,
    TST.TEST_CREATED



##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### Activation ready and OLP approved
############################################################

### THIS IS NOT A VIEW, THIS IS A QUERY DIRECTLY FOR EXCEL 


SELECT
DISTINCT (`Projects_Site_name`),
`Projects_trans_contr_bandwidth`,
`Projects_local_market`,
`CBand_Status`
FROM vzw_sandbox.cband_ready RD
JOIN vzw_sandbox.olp_cband_site_list OLP ON RD.Projects_Site_name = OLP.VZ_SITE_NAME

##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### CBand Test Results MOUNTAIN PLAINS
############################################################
CREATE VIEW vzw_sandbox.IOP_LAST_RESULTS_TEST AS
SELECT
	CONCAT(gnodeb_id,'-',sector_id) AS gnodeb_sector,
    fuze_site_id,
	MAX(TIMESTAMP(updated_on)) AS "MAX_DATE"
    
FROM vzw_sandbox.IOP_CBand_Test
GROUP BY 
	gnodeb_id,
    fuze_site_id,
	sector_id

DROP VIEW IF EXISTS vzw_sandbox.cband_test_results
CREATE VIEW vzw_sandbox.cband_test_results AS
SELECT
	DISTINCT(IOP.created_on) AS TEST_CREATED,
	RD.`Projects_Fuze_project_id` AS FUZE_PR_ID,
	IOP.fuze_site_id AS IOP_SITE_ID,
	CONCAT(IOP.gnodeb_id,'-',IOP.sector_id) AS IOP_SITE_SECTOR,
	RD.`Projects_Site_name` AS FUZE_SITE_NAME,
	RD.`Project_Activation_Withdraw_Milestone_F` AS FUZE_ACTIVATION_DATE,
	RD.`Projects_trans_contr_bandwidth` AS SITE_BANDWIDTH,
	RD.`Projects_local_market` AS MARKET,
	RD.`Projects_Status` AS PROJECT_STATUS,
	RD.`Dashboar_Status` AS DASH_STATUS,
	RD.`CBand_Status` AS CBAND_STATUS,
	OLP.`SECTOR_ID` AS SECTOR_ID,
    IOP.status AS TEST_STATUS
	

FROM vzw_sandbox.cband_ready RD
JOIN vzw_sandbox.olp_cband_site_list OLP ON RD.Projects_Site_name = OLP.VZ_SITE_NAME
JOIN vzw_sandbox.IOP_CBand_Test IOP on OLP.OLP_Site_Info_id = IOP.fuze_site_id
JOIN vzw_sandbox.IOP_LAST_RESULTS_TEST LRT ON LRT.fuze_site_id = IOP.fuze_site_id AND LRT.MAX_DATE = IOP.updated_on
GROUP BY 
	RD.`Projects_Fuze_project_id`,
	IOP.fuze_site_id,
    IOP.gnodeb_id,
    IOP.sector_id,
	RD.`Projects_Site_name`,
	RD.`Project_Activation_Withdraw_Milestone_F`,
	RD.`Projects_trans_contr_bandwidth`,
	RD.`Projects_local_market`,
	RD.`Projects_Status`,
	RD.`Dashboar_Status`,
	RD.`CBand_Status`,
	OLP.`SECTOR_ID`,
    IOP.status,
	IOP.created_on


##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### CBand Test Results SALT LAKE CITY
############################################################
select * 
from vzw_sandbox.cband_forecast_2021 pr
inner join vzw_sandbox.IOP_CBand_Test iop on pr.Projects_site_info_id = iop.fuze_site_id
where Projects_local_market = 'Salt Lake City'


select 
Projects_Fuze_project_id,
Projects_Site_name,
Projects_site_info_id,
Projects_trans_contr_bandwidth,
Projects_local_market,
sector_id,
dl_throughput,
ul_throughput,
latency,
pci,
rsrp,
sinr,
status,
updated_by,
updated_on 
from vzw_sandbox.cband_forecast_2021 pr
inner join vzw_sandbox.IOP_CBand_Test iop on pr.Projects_site_info_id = iop.fuze_site_id
where Projects_local_market = 'Salt Lake City'



##################################################################################################
##################################################################################################
##################################################################################################
############################################################
##### CBand Test Detail
############################################################

select * 
from vzw_sandbox.cband_test_results
where Projects_Site_name = 'HODGEPARK - Alt1 Elam'

select 
Projects_local_market,
count(distinct (Projects_Site_name))
from vzw_sandbox.cband_test_results
where status = 'passed'
group by Projects_local_market


select 
distinct (Projects_Site_name),
Projects_local_market
from vzw_sandbox.cband_test_results
where status != 'passed'