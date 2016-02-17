<?php
class MyConst {
	
	public static $tables = array(
			"q1" => "articles",
			"q2" => "q2",
			"q3" => "q3",
	);
	
	public static $cols = array (
			"q1" => "id,title,author,publish_year,publish_month,publisher,level,attachment_name,note,ref_url,award_name,user_id",
			"q2" => "id,zuowu_name,pinzhong_name,certification_code,certified_by,note,ref_url,user_id,attachment_name",
			"q3" => "id,zuowu_name,pinzhong_name,auth_code,category,user_id,note,ref_url,attachment_name",
	);

	public static $reportCols = array (
			"q1" => "title,author,publish_year,publish_month,publisher,level,award_name,user_id",
			"q2" => "zuowu_name,pinzhong_name,certification_code,certified_by,user_id",
			"q3" => "zuowu_name,pinzhong_name,auth_code,user_id",
	);
	

}