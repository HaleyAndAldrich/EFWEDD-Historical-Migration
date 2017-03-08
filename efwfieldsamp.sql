BEGIN TRAN


select distinct
	
	 sys_sample_code
	,sample_name
	,matrix_code
	,sample_type_code	
	,sample_source
	,parent_sample_code
	,null as sample_delivery_group
	,convert(varchar,sample_date, 101) as sample_date
	,convert(varchar, sample_date, 108) as sample_time
	,sys_loc_code
	,coalesce(start_depth, end_depth, '999999') as start_depth
	,coalesce(end_depth, start_depth,'999999') as start_depth
	,depth_unit
	,chain_of_custody
	,null as sent_to_lab_date
	,null as sample_receipt_date
	,null  as sampler
	,sampling_company_code
	,null as sampling_reason
	,null as sampling_technique
	,null as task_code
	,null as collection_quarter
	,composite_yn
	,null as composite_desc
	,null as sample_class
	,custom_field_1
	,null as custom_field_2
	,null as custom_field_3
	,null as comment
	,null as sample_receipt_time


from ##Data

ROLLBACK