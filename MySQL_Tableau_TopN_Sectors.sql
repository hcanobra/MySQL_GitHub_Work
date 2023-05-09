SELECT 
	DISTINCT TOP.enodebsectgrp as TOP_eNBSecGrp,
	CONCAT (
		substr(TOP.enodebsectgrp,1,(LOCATE ('-',TOP.enodebsectgrp)-1))
		,'_TOP_SEC') AS IX,
	SUBSTRING(ATOLL_eNB_Sec, 1, 6) AS ENB,
    ATOLL_site_name as TOP_Site_Name,
    ATOLL_azimuth_deg as TOP_Azimuth_deg,
	ATOLL_site_latitude_degrees_nad83 AS TOP_lat,
    ATOLL_site_longitude_degrees_nad83 AS TOP_lon
    
FROM VZW_DB.atoll_sitelist_july2021 ATOLL
JOIN VZW_DB.topsectors_mtn_july TOP
			ON 
				(
				ATOLL.ATOLL_eNB_Sec
                )
				= 
                (
				SUBSTRING(TOP.enodebsectgrp, 1, 8)
				)	


GROUP BY 
	SUBSTRING(ATOLL_eNB_Sec, 1, 6),
	TOP.enodebsectgrp,
    ATOLL_site_name,
    ATOLL_azimuth_deg,
	ATOLL_site_latitude_degrees_nad83,
	ATOLL_site_longitude_degrees_nad83
    
Order by SUBSTRING(ATOLL_eNB_Sec, 1, 6)