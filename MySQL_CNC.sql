CREATE VIEW CNC AS 
SELECT 
	DISTINCT CNC.enodebsectgrp as CNC_eNBSecGrp,
	CONCAT (
            substr(CNC.enodebsectgrp,1,LOCATE ('-',CNC.enodebsectgrp)-1)
            ,'_CNC') AS IX,
	SUBSTRING(ATOLL_eNB_Sec, 1, 6) AS ENB,
    ATOLL_site_name as CNC_Site_Name,
    ATOLL_azimuth_deg as CNC_Azimuth_deg,
	enodebsectgrp AS CNC_enodebsectgrp,
	Sector_Score AS CNC_Sector_Score,
	CNC_Trg_Curr AS CNC_Trg_Curr,
	`Rank` AS CNC_Rank,
	ATOLL_site_latitude_degrees_nad83 AS CNC_lat,
    ATOLL_site_longitude_degrees_nad83 AS CNC_lon
    
FROM VZW_DB.atoll_sitelist_july2021 ATOLL
JOIN VZW_DB.MTNPLNS_CNC_Triggers_032021 CNC 
			ON 
				(
				ATOLL.ATOLL_eNB_Sec
                )
				= 
                (
				SUBSTRING(CNC.enodebsectgrp, 1, 8)
				)	

where
	REGION = 'MTN'
GROUP BY 
	SUBSTRING(ATOLL_eNB_Sec, 1, 6),
	CNC.enodebsectgrp,
    ATOLL_site_name,
    ATOLL_azimuth_deg,
    enodebsectgrp,
    Sector_Score,
    CNC_Trg_Curr,
    `Rank`,
	ATOLL_site_latitude_degrees_nad83,
    ATOLL_site_longitude_degrees_nad83
    
Order by SUBSTRING(ATOLL_eNB_Sec, 1, 6)


/**********************
**********************/

SELECT
	IX as CNC_IX,	
    CNC_eNBSecGrp as CNC_eNBSecGrp,
	ENB AS CNC_ENB,	
    CNC_Site_Name AS CNC_Site_Name,
	CNC_Azimuth_deg	 AS CNC_Azimuth_deg,
	CNC_enodebsectgrp AS CNC_enodebsectgrp,
	CNC_Sector_Score AS CNC_Sector_Score,
	CNC_Trg_Curr AS CNC_Trg_Curr,
	CNC_Rank as CNC_Rank
    
FROM VZW_DB.CNC

/*
CNC_eNBSecGrp	
IX	
ENB	CNC_Site_Name	
CNC_Azimuth_deg	
CNC_enodebsectgrp	
CNC_Sector_Score	
CNC_Trg_Curr	
CNC_Rank	
CNC_lat	CNC_lon
*/




