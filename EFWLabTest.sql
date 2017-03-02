

select distinct
sys_sample_code
,analytic_method as lab_anl_method_name
,convert(varchar,analysis_date, 101) as analysis_date
,convert(varchar, analysis_date, 108) as analysis_time
,fraction as total_or_dissolved
,column_number
,test_type
,lab_matrix_code
,analysis_location
,basis
,null as container_id
,dilution_factor
,prep_method as lab_prep_method_name
,convert(varchar,prep_date,101) as prep_date
,convert(varchar,prep_date, 108) as prep_time
,leachate_method
,convert(varchar,leachate_date, 101) as leachate_date
,convert(varchar,leachate_date, 108) as leachate_time
,lab_name_code
,null as qc_level
,lab_sample_id
,percent_moisture
,null as subsample_amount
,null as subsample_amount_unit
,null as analyst_name
,null as instrument_id
,null as comment
,preservative
,null as final_volume
,null as final_volume_unit
,lab_sdg


from ##Data