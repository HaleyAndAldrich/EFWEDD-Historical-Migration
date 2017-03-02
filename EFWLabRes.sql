
select

 sys_sample_code
,analytic_method as lab_anl_method_name
,convert( varchar, analysis_date, 101) as analysis_date
,convert(varchar, analysis_date, 108) as analysis_time
,fraction as total_or_dissolved
,column_number
,test_type
,cas_rn
,chemical_name
,coalesce(result_text, reporting_detection_limit, method_detection_limit, quantitation_limit) as result_value
,null as result_error_delta
,result_type_code
,reportable_result
,detect_flag
,lab_qualifiers
,null as organic_yn
,method_detection_limit
,reporting_detection_limit
,quantitation_limit
,result_unit
,detection_limit_unit
,tic_retention_time
,result_comment
	,validator_qualifiers
	,approval_code
	,interpreted_qualifiers
	,approval_a
	,approval_b
	,validated_yn

from  ##Data
