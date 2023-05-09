select 
    Projects_Fuze_project_id,
    Projects_Site_name,
    Projects_site_info_id,
    Projects_trans_contr_bandwidth,
    Projects_local_market,
    sector_id,
    dl_throughput,
    ul_throughput,
    latency,
    pci,
    rsrp,
    sinr,
    status,
    updated_by,
    updated_on 
    from vzw_sandbox.cband_forecast_2021 pr
    inner join vzw_sandbox.IOP_CBand_Test iop on pr.Projects_site_info_id = iop.fuze_site_id
where Projects_local_market = 'Salt Lake City'