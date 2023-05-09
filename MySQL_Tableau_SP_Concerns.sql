CREATE VIEW Local_SPConcerns AS
SELECT 
    CONCAT (IX,"_SP_Concerns") as SPConcern_IX,
	Market AS SPConcern_Market,
	`Covering Site` AS SPConcern_Covering_Site,
	Location AS SPConcern_Location,
	Latitude AS SPConcern_Lat,
	Longitude AS SPConcern_Long,
	`Sales Complaint` AS SPConcern_Sales_Complaint,
	`Trouble Ticket` AS SPConcern_Trouble_Ticket,
	Capacity AS SPConcern_Capacity,
	`Comp Disadvantage` AS SPConcern_Comp_Disadvantage,
	`Fuze Project` AS SPConcern_Fuze_Project,
	Comment AS SPConcern_Comment

FROM VZW_DB.sys_perf_areas_of_concern

/*

[enodebsectgrp]" + CHCAR (10) +
[Sector_Score]" + CHCAR (10) +
[CNC_Trg_Curr]" + CHCAR (10) +
[LowBand_Trigger]" + CHCAR (10) +
[LowBandScore]" + CHCAR (10) +
[morphology]" + CHCAR (10) +
[LowBands]" + CHCAR (10) +
[HighBand_Trigger]" + CHCAR (10) +
[HighBandScore]" + CHCAR (10) +
[HighBands]" + CHCAR (10) +
[CellEdgeTrigger]" + CHCAR (10) +
[Territory]" + CHCAR (10) +
[Region]" + CHCAR (10) +
[LB]" + CHCAR (10) +
[Has_B5]" + CHCAR (10) +
[HighBandExists]" + CHCAR (10) +
[Cell_Edge_Trigger_Use]" + CHCAR (10) +
[Rank]" + CHCAR (10) +

*/