##################################################################################################
##################################################################################################
##################################################################################################
#### VER1 VIEW FOR QGIS
CREATE VIEW vzw_sandbox.QGIS_FUZE_VIEW AS
SELECT
*
FROM vzw_sandbox.fuze_proj fp
JOIN vzw_sandbox.fuze_dash ds on fp.Projects_Fuze_project_id = ds.Dashboar_Fuze_project_id
WHERE Projects_Status NOT IN ('Fuze_Reject')

##################################################################################################
##################################################################################################
##################################################################################################

CREATE VIEW vzw_sandbox.QGIS_SLC_FUZE_VIEW AS
SELECT 
	Projects_Site_name,
	Projects_atoll_site_latitude,
	Projects_atoll_site_longitude,
	Projects_Fuze_project_id,
	Projects_name,
	Projects_plan_year,
    Projects_activation_forecast_date,
	Projects_Status
FROM vzw_sandbox.Fuze_Proj FP
JOIN vzw_sandbox.Fuze_Dash DS ON FP.Projects_Fuze_project_id = DS.Dashboar_Fuze_project_id
where Projects_local_market = 'Salt Lake city'
AND Projects_Status NOT IN ('Completed')
