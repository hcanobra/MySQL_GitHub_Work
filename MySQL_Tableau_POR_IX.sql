CREATE VIEW LOCAL_XI_POR AS
SELECT 
	distinct concat(FUZE_Project_ID,'_',Site_ID) as IX,
    FUZE_Project_ID,
    Site_ID

FROM VZW_DB.fuze_por_table_kyle
where Site_ID != 0
order by Site_ID,FUZE_Project_ID