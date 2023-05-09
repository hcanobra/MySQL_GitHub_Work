CREATE VIEW LOCAL_XI_POR_LOCATIONS AS
SELECT 
	CONCAT (Projects_Fuze_project_id,'_POR') AS IX,
    atoll_site_longitude_degrees_nad83,
    atoll_site_latitude_degrees_nad83

FROM VZW_DB.ndl_atoll_por_location
order by Projects_Fuze_project_id