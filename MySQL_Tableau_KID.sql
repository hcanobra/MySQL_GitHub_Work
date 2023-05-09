CREATE VIEW LOCAL_KID AS
SELECT 
	concat(k_ID,'_KID') as KID_IX,
    `LTE_Market` AS KID_LTE_Market,
	`MTN_Plains_Rank` AS KID_MTN_Plains_Rank,
	`k_ID` AS KID_k_ID,
	`Latitude` AS KID_Lat,
	`Longitude` AS KID_Lon,
	`Offloaded_eNB_sec` AS KID_Offloaded_eNB_sec,
	`Offload_pct` AS KID_Offload_pct,
	`County` AS KID_County,
	`State` AS KID_State,
	`Labyrinth_Failures` AS KID_Labyrinth_Failures,
	`Avg_RSRP` AS KID_Avg_RSRP,
	`QCI1_Drops` AS KID_QCI1_Drops,
	`SIP_DC_enb_sec` AS KID_SIP_DC_enb_sec,
	`SIP_Drops` AS KID_SIP_Drops,
	`category` AS KID_category

FROM VZW_DB.mtn_plns_sgfi
WHERE State in ('UT','MT','WY','ID')
;

/*
`LTE_Market`
`MTN_Plains_Rank`
`k_ID`
`Latitude`
`Longitude`
`Offloaded_eNB_sec`
`Offload_pct`
`County`
`State`
`Labyrinth_Failures`
`Avg_RSRP`
`Min(RSRP)`
`QCI1_Drops`
`SIP_DC_enb_sec`
`SIP_Drops`
`category`

*/