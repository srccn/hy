<?php
class MyConst {
	
	public static $tables = array(
			"q1" => "articles",
			"q2" => "q2",
			"q3" => "q3",
			"q4" => "q4",
			"q5" => "q5",
			"q6" => "q6",
			"q7" => "q7",
			"q8" => "q8",
			"q9" => "q9",
	);
	
	public static $cols = array (
			"q1" => "id,title,author,publish_year,publish_month,publisher,level,attachment_name,note,ref_url,award_name,user_id",
			"q2" => "id,zuowu_name,pinzhong_name,certification_code,certified_by,note,ref_url,user_id,attachment_name",
			"q3" => "id,zuowu_name,pinzhong_name,auth_code,category,user_id,note,ref_url,attachment_name",
			"q4" => "id,title,auth_by,auth_code,auth_year,auth_month,user_id,note,ref_url,attachment_name",
			"q5" => "id,title,auth_by,auth_year,auth_month,user_id,note,ref_url,attachment_name",
			"q6" => "id,title,author, publisher, publish_year, publish_month, publish_page, level, effect_factor, user_id,note,ref_url,attachment_name",
			"q7" => "id,title,author, publisher, publish_year, publish_month, user_id,note,ref_url,attachment_name",
			"q8" => "id,title,author, patent_code, org_name, category, user_id,note,ref_url,attachment_name",
			"q9" => "id,title,author, description, user_id,note,ref_url,attachment_name",
	);

	public static $reportCols = array (
			"q1" => "title,author,publish_year,publish_month,publisher,level,award_name,user_id",
			"q2" => "zuowu_name,pinzhong_name,certification_code,certified_by,user_id",
			"q3" => "zuowu_name,pinzhong_name,auth_code,user_id",
			"q4" => "title,auth_by,auth_code,auth_year,auth_month,user_id",
			"q5" => "title,auth_by,auth_year,auth_month,user_id",
			"q6" => "title,author, publisher, publish_year, publish_month, publish_page, effect_factor, user_id ",
			"q7" => "title,author, publisher, publish_year, publish_month, user_id",
			"q8" => "title,author, patent_code, org_name, category, user_id",
			"q9" => "title,author, description, user_id",
				
	);
	

}