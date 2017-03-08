use equis
go

if object_id('tempdb..##Data') is not null drop table ##Data

select
z.*

into ##Data
from
	(select
	facility_code
	,l.subfacility_code
	,s.sys_sample_code
	,sample_name
	,fs.field_sdg
	,fs.sampling_company_code
	,fs.sampler
	,s.medium_code
	,fs.filter_type
	,fs.composite_yn
	,s.sys_loc_code
	,s.duration
	,s.duration_unit
	,fs.chain_of_custody
	,s.custom_Field_1
	,s.custom_field_5
	,c.x_coord
	,c.y_coord
	,c.coord_type_code
	,c.elev as surf_elev
	,c.elev_unit
	,c.elev_datum_code
	,sample_source
	,sample_type_code
	,parent_sample_code
	,sample_date
	,matrix_code
	,task_code
	,start_depth
	,end_depth
	,s.depth_unit
	,s.status_flag
	,analytic_method
	,analysis_date
	,fraction
	,column_number
	,test_type
	,lab_matrix_code
	,analysis_location
	,basis
	,dilution_factor
	,lab_name_code
	,lab_sdg
	,prep_method
	,prep_date
	,leachate_method
	,leachate_date
	,lab_sample_id
	,preservative
	,percent_moisture
	,subsample_amount
	,subsample_amount_unit
	,chemical_name
	,r.cas_rn
	,result_text
	,result_numeric
	,result_type_code
	,reportable_result
	,detect_flag
	,lab_qualifiers
	,validator_qualifiers
	,approval_code
	,interpreted_qualifiers
	,approval_a
	,approval_b
	,method_detection_limit
	,reporting_detection_limit
	,quantitation_limit
	,result_unit
	,detection_limit_unit
	,tic_retention_time
	,r.remark as result_comment
	,validated_yn



	
	from dt_sample S 
	left join dt_field_sample fs on s.facility_id = fs.sample_id and s.sample_id = fs.sample_id
	inner join dt_location l on s.facility_id = l.facility_id and s.sys_loc_code = l.sys_loc_code
	inner join dt_facility f on s.facility_id = f.facility_id
	left join dt_coordinate c on l.facility_id = c.facility_id and l.sys_loc_code = c.sys_loc_code
	inner join dt_test t on s.facility_id = t.facility_id and s.sample_id = t.sample_id
	inner join dt_result r on t.facility_id = r.facility_id and t.test_id = r.test_id
	inner join rt_analyte ra on r.cas_rn = ra.cas_rn
	where s.facility_id = 48
	and sample_source = 'field')z

	left join

	(select 
	sys_sample_code
	from dt_sample
	where facility_id = 47
	and sample_source = 'field')y

	on z.sys_sample_code = y.sys_sample_code
	where (y.sys_sample_code is null or y.sys_sample_code = 'FF-ROW-HA07-SO-072514-3.5' or y.sys_sample_code = 'FF-ROW-HA03-SO-072414-0.5')

	select count(*) from ##Data

