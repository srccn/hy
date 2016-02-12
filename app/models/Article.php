<?php
class Article extends DB\SQL\Mapper {
	
	private $filter ='user_id=0';

	public function __construct(DB\SQL $db) {
		
		if ($_SESSION['userid']) {
			$userId = $_SESSION['userid'];
			$_POST['user_id']= $userId;
			$this->filter='user_id = ' . $userId;
		}
		parent::__construct($db,'articles', "id,title,author,publish_year_month,category,publisher,level,attachment_name,note,ref_url,user_id" );
	}
	
	public function all() {
		$this->load( $this->filter );
		return $this->query;
	}
	
	public function add() {
		$this->copyFrom('POST');
		$this->save();
	}
	
	public function getById($id) {
		$this->load(array('id=?',$id));
		$this->copyTo('POST');
	}
	
	public function edit($id) {
		$this->load(array('id=?',$id));
		$this->copyFrom('POST');
		$this->update();
	}
	
	public function delete($id) {
		$this->load(array('id=?',$id));
		$this->erase();
	}	


	
	
}