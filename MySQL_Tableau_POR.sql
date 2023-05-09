/* 
this is the query on the local DB to create the index and cordenates to pull all Fuze projects

*/
CREATE VIEW POR_IX as 
select
    CONCAT (Projects_Fuze_project_id,'_POR') AS IX,
    ATOL.ATOLL_site_latitude_degrees_nad83 AS POR_LAT,
    ATOL.ATOLL_site_longitude_degrees_nad83 AS POR_LON

from VZW_DB.por_locations_aug2021 FUZE
JOIN VZW_DB.atoll_sitelist_july2021 ATOL ON FUZE.Projects_site_info_id = ATOL.site_info_id


/* 
This is the query on NDL to pull all Fuze projects LEFT([IX],FIND([IX],'_')-1)
*/

select
    Projects_Fuze_project_id,	
    Projects_parent_solution_id,	
    Projects_site_info_id,
    Projects_Status,
    Projects_plan_year,	
    Projects_included_initiative,
    Projects_pl_initiative,
    Projects_pl_rationale,
    to_date(SPM.trans_dt, 'yyyy-mm-dd') as Projects_trans_dt
    
from fuze_presto_views.dmp_rfds_sp_fuze_projects_view FUZE
JOIN fuze.spm_project_tracker SPM ON FUZE.projects_fuze_project_id = SPM.fuze_project_id

where 
    to_date(SPM.trans_dt, 'yyyy-mm-dd') =  current_date
    AND
    SPM.sub_market = 'Mountain'

group by
    Projects_Fuze_project_id,	
    Projects_parent_solution_id,	
    Projects_site_info_id,
    Projects_Status,
    Projects_plan_year,	
    Projects_included_initiative,
    Projects_pl_initiative,
    Projects_pl_rationale,
    to_date(SPM.trans_dt, 'yyyy-mm-dd')

order by Projects_site_info_id


/*

CREATE VIEW LOCAL_POR_IX as 
select
    CONCAT (Projects_site_info_id,'_POR') AS IX,
    ATOLL_site_latitude_degrees_nad83 AS POR_LAT,
    ATOLL_site_longitude_degrees_nad83 AS POR_LON

from VZW_DB.ndl_atoll_por_location 


*/