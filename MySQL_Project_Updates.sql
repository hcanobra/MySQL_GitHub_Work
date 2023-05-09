insert into VZW_DB.SP_PROJECT_PRIORITY_LIST
	(
    Priority_id,
    Site,
    FUZE_Project_ID,
    FUZE_Project_Status,
    Lat,
    Lon	
    )
    VALUES
    (
    2, 			-- Priority_id
    'Big Sky Macro', 	-- Site
    'DBD',	-- FUZE_Project_ID
    'TBD',	-- FUZE_Project_Status
    0,	-- Lat
    0	-- Lon
    );

insert into VZW_DB.SP_PROJECT_NOTES
	(
	Notes_CODE,
	Priority_id,
	Notes
    )
    VALUES
    (
    'U', 	-- Notes_CODE
    16,		-- Priority_id
    'AWS-3 Diplexer Swap and Carrier Add'	-- Notes
    );



    