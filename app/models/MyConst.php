<?php
class MyConst {
	
	public static $tables = array(
			"q1" => "articles",
			"q2" => "q2",
	);
	
	public static $cols = array (
			"q1" => "id,title,author,publish_year,publish_month,publisher,level,attachment_name,note,ref_url,award_name,user_id",
			"q2" => "id,zuowu_name,pinzhong_name,certification_code,certified_by,note,ref_url,user_id,attachment_name",
	);

	public function __construct(){
		
	}
}