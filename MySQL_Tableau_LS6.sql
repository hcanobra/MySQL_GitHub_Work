select
    CONCAT (
            substr(ATOLL_site_name,1,LOCATE (' ',ATOLL_site_name))
            ,'_LS6') AS IX,
    substr(Atoll_Site.enodeb_eutrancellfdd,1,6) as ATOLL_eNB,
    Atoll_Site.site_name AS ATOLL_site_name,
    Atoll_Site.site_latitude_degrees_nad83 AS ATOLL_site_latitude_degrees_nad83,
    Atoll_Site.site_longitude_degrees_nad83 AS ATOLL_site_longitude_degrees_nad83,
    to_date(SPM.trans_dt, 'yyyy-mm-dd') as trans_dt

from fuze.spm_project_tracker SPM
JOIN vzatoll.f_vzatoll_lte_v4 Atoll_Site ON SPM.site_info_id = Atoll_Site.fuze_site_id
JOIN fuze_presto_views.dmp_rfds_sp_fuze_dash_view DASH on SPM.fuze_project_id = DASH.dashboar_fuze_project_id


where 
    to_date(SPM.trans_dt, 'yyyy-mm-dd') =  current_date
    and
    SPM.local_market = 'Salt Lake City'
    and 
    (
    SPM.pl_rationale like '%6%'
    or
    DASH.dashboar_project_subtype like '%6%'
    )

GROUP BY 
    SPM.fuze_project_id,
    substr(Atoll_Site.enodeb_eutrancellfdd,1,6),
    Atoll_Site.site_name,
    Atoll_Site.site_latitude_degrees_nad83,
    Atoll_Site.site_longitude_degrees_nad83,
    SPM.trans_dt

/*
select
    substr(Atoll_Site.enodeb_eutrancellfdd,1,6) as ATOLL_eNB,
    Atoll_Site.site_name AS ATOLL_site_name,
    
    
    
    to_date(SPM.trans_dt, 'yyyy-mm-dd') as trans_dt

from fuze.spm_project_tracker SPM
JOIN vzatoll.f_vzatoll_lte_v4 Atoll_Site ON SPM.site_info_id = Atoll_Site.fuze_site_id
JOIN fuze_presto_views.dmp_rfds_sp_fuze_dash_view DASH on SPM.fuze_project_id = DASH.dashboar_fuze_project_id


where 
    to_date(SPM.trans_dt, 'yyyy-mm-dd') =  current_date
    and
    SPM.local_market = 'Salt Lake City'
    and 
    (
    SPM.pl_rationale like '%6%'
    or
    DASH.dashboar_project_subtype like '%6%'
    )

GROUP BY 
    SPM.fuze_project_id,
    substr(Atoll_Site.enodeb_eutrancellfdd,1,6),
    Atoll_Site.site_name,
    Atoll_Site.site_latitude_degrees_nad83,
    Atoll_Site.site_longitude_degrees_nad83,
    SPM.trans_dt

*/