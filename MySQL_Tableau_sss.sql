SELECT 
    CONCAT (CNC_ENBSECGRP,'_','CNC') AS IX,
    CNC_lat AS LAT,
    CNC_lon AS LON

FROM VZW_DB.CNC

UNION

SELECT 
    CONCAT (TOP_ENBSECGRP,'_','TOP_SEC') AS IX,
    TOP_lat AS LAT, 
    TOP_lon AS LON
FROM VZW_DB.TOP_N_SECTORS AS ENBSECGRP

UNION

SELECT
    CONCAT (`Root Priority Rank`,"_HQ_ROOT_RK") AS IX,
    `Cluster Latitude` AS LAT,
    `Cluster Longitude` AS LON
FROM vzw_RootMetrics.root_metrics_location_list_july2021
WHERE 
    `Root Market` IN ('Boise-ID','Ogden-UT','Provo-UT','SaltLakeCity-UT')

UNION

SELECT 
    CONCAT (Location,"_SP_Concerns") as IX,
    Latitude AS LAT,
    Longitude AS Lon
FROM VZW_DB.sys_perf_areas_of_concern

UNION

SELECT
    IX,
    ATOLL_site_latitude_degrees_nad83 AS LAT, 
    ATOLL_site_longitude_degrees_nad83 AS LON
FROM ls6_site_list

UNION

SELECT
    IX,
    ATOLL_site_latitude_degrees_nad83 AS LAT, 
    ATOLL_site_longitude_degrees_nad83 AS LON
FROM POR_site_list