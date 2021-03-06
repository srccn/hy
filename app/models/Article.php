<?php
class Article extends DB\SQL\Mapper {
	
	private $filter ='user_id=0';

	public function __construct(DB\SQL $db , $table_name, $cols) {
		
		if ($_SESSION['userid']) {
			$userId = $_SESSION['userid'];
			$_POST['user_id']= $userId;
			
			if ($_SESSION['is_admin']) {
				$this->filter=null;
			} else {
				$this->filter='user_id = ' . $userId;
			}
		}
		parent::__construct($db, $table_name, $cols );
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

	public function addFilter($filterString){
		
		if (trim($filterString) == '' ){
			return; //nothing to add
		}
		
		if (isset($this->filter) && $this->filter != '') {
			$this->filter = $this->filter." and ".$filterString;
		} else {
			$this->filter = $filterString;
		}
	}

	public function removeFiler(){
		$this->filter=null;
	}
	
}