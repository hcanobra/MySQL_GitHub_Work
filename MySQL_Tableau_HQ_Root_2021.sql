CREATE VIEW VZW_DB.LOCAL_HQ_ROOT AS
SELECT
    CONCAT (`Root Priority Rank`,"_HQ_ROOT_RK") AS RootHQ_IX,
    `Cluster Record` AS RootHQ_Cluster_Record,
	`Root Market` AS RootHQ_Root_Market, 
	`County` AS RootHQ_County, 
	`State` AS RootHQ_State,
	`Cluster Latitude` AS RootHQ_Lat, 
	`Cluster Longitude` AS RootHQ_Lon, 
	`Root Priority Rank` AS RootHQ_Root_Priority_Rank, 
	`Root Priority Score` AS RootHQ_Root_Priority_Score, 
	`Suggested Macro Solution Count)` AS RootHQ_Suggested_Macro_Solution_Count, 
	`Overlap with SGFI Top 1200` AS RootHQ_Overlap_with_SGFI_Top_1200, 
	`Parent Solution ID` AS RootHQ_Parent_Solution_ID,
	`Avg RSRP` AS RootHQ_Avg_RSRP, 
    `Avg SNR` AS RootHQ_Avg_SNR, 
	`Fund Data Solution` AS RootHQ_Fund_Data_Solution, 
	`Total DC` AS RootHQ_Total_DC, 
    `Total IA` AS RootHQ_Total_IA,
	`Total Task Failures` AS RootHQ_Total_Task_Failures

FROM vzw_RootMetrics.root_metrics_location_list_july2021

WHERE `State` IN ('UT','MT','ID','WY')

/*
`Cluster Record`,
`Root Market`, 
`County`, 
`State`,
`Cluster Latitude`, 
`Cluster Longitude`, 
`Root Priority Rank`, 
`Root Priority Score`, 
`Suggested Macro Solution Count)`, 
`Overlap with SGFI Top 1200`, 
`Parent Solution ID`,
`Avg RSRP`, `Avg SNR`, 
`Fund Data Solution`, 
`Total DC`, `Total IA`,
`Total Task Failures`
*/
