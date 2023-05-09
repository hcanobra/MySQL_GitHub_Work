/*
Information from: http://datapro.eng.vzwcorp.com/download/sites_files/

Using pyhon script: /Users/canobhu/Documents/GitHub/ndl_musql_queries/NDL_Python/python_SiteFiles_URL.py

*/
################################################################################
################################################################################
CREATE VIEW vzw_sites.hq_portal_sites_SLC_locations AS
SELECT 
distinct (`Site Name`),
SUBSTRING(`eNodeB Sector ID`, 1, (locate ('_',`eNodeB Sector ID`)-1)) AS gNodeB,
`LTE Cell Type`,
`PS Loc Code`,
Vendor,
`Latitude(DecDeg)`,
`Longitude(DecDeg)`
FROM vzw_sites.`saltlake_cellver_ALL.csv.gz`
WHERE 
    `LTE Mkt ID` IN ('012','312','013','313')
    and `eNodeB Cell Name` is not null
ORDER BY `Site Name`

################################################################################
################################################################################
