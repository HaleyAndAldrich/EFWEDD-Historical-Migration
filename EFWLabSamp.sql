BEGIN TRAN

select distinct
 sys_sample_code
,sample_type_code
,matrix_code as sample_matrix_code
,sample_source
,parent_sample_code
,null as comment
,convert(varchar,sample_date, 101) as sample_date
,convert(varchar,sample_date, 108) as sample_time
,null as sample_receipt_date
,null as sample_delivery_group
,null as standard_solution_source
,null as sample_receipt_time

from ##Data

ROLLBACK