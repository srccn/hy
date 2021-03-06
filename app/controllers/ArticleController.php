<?php
Class ArticleController extends BaseController {
	
	
	public function __construct(){
		
		parent::__construct();
		
		if (! isset($this->f3->SESSION['username'])){ //send not signed in user back to signin page
			$this->f3->set('message', '请输入登入名和密码');
			$this->f3->set('showMenu',false);
			$this->f3->set('view','signin.htm');
			echo Template::instance()->render('layout.htm');			
		    die();
		}
		
		if (isset($this->f3->SESSION['submit_date']) && ! $this->f3->SESSION['is_admin'] ){ //submitted send user back to home page, admin exception
			$this->f3->set('message', '不能修改已提交内容，请联系系统管理人员.');
			$this->f3->set('showMenu',false);
			$this->f3->set('view','home.htm');
			echo Template::instance()->render('layout.htm');
			die();
		}
		
	}
	
	public function index($f3,$param)	{
		
		$table = $param['table'];
		$db_table_name = MyConst::$tables[$table];
		
		$article = new Article($this->db, MyConst::$tables[$table], MyConst::$cols[$table] );
		$this->f3->set('articles',$article->all());
				
//		$q2 = new Article($this->db, MyConst::$tables["Q2"], MyConst::$cols["Q2"]);
//		$this->f3->set('q2',$q2->all());
		$this->f3->set('VIEWTABLE', $table);
		$this->f3->set('view',"$table/list.html");
		echo Template::instance()->render('layout.htm');
	}

	public function index_q2()	{
	
	
		$q2 = new Article($this->db, MyConst::$tables["Q2"], MyConst::$cols["Q2"]);
		$this->f3->set('q2',$q2->all());
	
		$this->f3->set('view','q2/list.html');
		echo Template::instance()->render('layout.htm');
	}
	
	
	public function create($f3,$param)
	{
		
		$table = $param['table'];
		$db_table_name = MyConst::$tables[$table];
		
		if($this->f3->exists('POST.addArticle'))
		{

			if (isset ($_POST['description'])) {
				//$_POST['description'] = str_replace(array('.', ' ', "\n", "\t", "\r"), '', $_POST['description'] );
				$_POST['description'] = str_replace(array("\n", "\t", "\r"), '', $_POST['description'] );
			}
			
			$article = new Article($this->db, $db_table_name, MyConst::$cols[$table]);
			$article->add();
			
			$id = $article->id;
			
			$this->f3->set('POST.id', $id);
			$this->f3->set('VIEWTABLE',$param['table']);		
			$this->updateAttachment($db_table_name);
			$this->f3->reroute('/list/'.$table);
	
		} else
		{
			$this->f3->set('view','articles/list.html');
		    echo Template::instance()->render('layout.htm');
		}
	}
	
	public function delete($f3,$param)
	{
		$table = $param['table'];
		$db_table_name = MyConst::$tables[$table];
		
		if($this->f3->exists('PARAMS.id'))
		{
			$article =  new Article($this->db, MyConst::$tables[$table], MyConst::$cols[$table]);
			$article->delete($this->f3->get('PARAMS.id'));
		}
	
		$this->f3->reroute('/list/'.$param['table']);
//	    echo Template::instance()->render('layout.htm');
	}

	public function duplicate()
	{
		if($this->f3->exists('PARAMS.id'))
		{
			$source_id = $this->f3->get('PARAMS.id');
			
			$query = "
					 INSERT into articles (title,author,publish_year_month,category,publisher,level,attachment_name,attachment_type,attachment_size,attachment,note,ref_url,user_id)
					 SELECT title,author,publish_year_month,category,publisher,level,attachment_name,attachment_type,attachment_size,attachment,note,ref_url,user_id 
					   FROM articles
					  WHERE id = $source_id
					";
			
			$this->db->exec($query);
		}
	
		$this->f3->reroute('/article/list');
	}
	
	
	public function update($f3,$param)
	{
	    
		$table = MyConst::$tables[$param['table']];
		$cols = MyConst::$cols[$param['table']];
		
		$article = new Article($this->db, $table, $cols);
		
		if($this->f3->exists('POST.updateArticle'))
		{

			if (isset ($_POST['description'])) {
				$_POST['description'] = str_replace(array('.', ' ', "\n", "\t", "\r"), '', $_POST['description'] );
			}
			
				
			
			$this->updateAttachment($table);
			
			$article->edit($this->f3->get('POST.id'));
			$this->f3->reroute("/list/".$param['table']);
	
		} else
		{
			$article->getById($this->f3->get('PARAMS.id'));
			$this->f3->set('article',$article);
		    
			$this->f3->set('VIEWTABLE', $param['table']);
			$this->f3->set('view', "/". $param['table']. "/update.html");
    		echo Template::instance()->render('layout.htm');
		}
	}
	
	private function updateAttachment($table_name){
		//remove attachment case
		if ( isset($_POST['updateArticle'])  &&   isset($_POST['removeAttachment']) )  {
			$query = "update " . $table_name . "
			set attachment_name=null ,
			attachment_type=null ,
			attachment_size=0 ,
			attachment=null
			where id = " . $this->f3->get('POST.id') ;
			$this->db->exec($query);
			return;
		}
		
		if($_FILES['userfile']['error'] != UPLOAD_ERR_OK) {
			$this->f3->set('message','upload failed with ');
			die();
		}
		
		
		if(( isset($_POST['addArticle']) || isset($_POST['updateArticle']) ) && $_FILES['attachment']['size'] > 0)
		{
			$fileName = $_FILES['attachment']['name'];
			$tmpName  = $_FILES['attachment']['tmp_name'];
			$fileSize = $_FILES['attachment']['size'];
			$fileType = $_FILES['attachment']['type'];
		
			$fp      = fopen($tmpName, 'r');
			$content = fread($fp, filesize($tmpName));
			$content = addslashes($content);
			fclose($fp);
		
			if(!get_magic_quotes_gpc())
			{
				$fileName = addslashes($fileName);
			}
			
//			$_POST['attachment'] = $content;
			$_POST['attachment_name'] = $fileName;
			
			$query = "update " . $table_name . " 
			             set attachment_name='$fileName' , 
			                 attachment_type='$fileType' , 
			                 attachment_size='$fileSize' , 
			                 attachment='$content' 
			          where id = " . $this->f3->get('POST.id') ;
			
			$this->db->exec($query);
			
		}
	}

	public function downloadAttachment($f3, $param) {
		
		$table = MyConst::$tables[$param['table']];
		$cols = MyConst::$cols[$prarm['table']];
		
		if ( ! $this->f3->get('PARAMS.id')) {
			die ("Failed to download attachment, article id is not defined");
		}
		
		$query = "select attachment_name, attachment_type, attachment_size, attachment 
				   from " . $table ."
				  where id = ". $this->f3->get('PARAMS.id');
		
		$result = $this->db->exec($query);
		
		$size = $result[0]['attachment_size'];
		$type = $result[0]['attachment_type'];
		$name = $result[0]['attachment_name'];
		$content = $result[0]['attachment'];
		
		
		if ($result[0]['attachment_size'] == 0 ) {
			die("Failed downlaod attachment, file size is zero");
		}
		
		header("Content-length: $size");
		header("Content-type: $type");
		header("Content-Disposition: attachment; filename=\"" . stripslashes($name) ."\"" );
		echo ($content);
		
	}
	
	function bulkload($f3, $param) {
		
		$user_id = $this->f3->get('SESSION.userid');
        $content =  $this->f3->get('POST.bulk_content');
        $table = $param['table'];
        $db_table = MyConst::$tables[$table];
        
        $rows = explode("\n", $content);
        $num_rows = count($rows);
        
        for( $i= 1 ; $i<$num_rows; $i++ ) { //start from 1, to skip first row - that is header
        	
        	if (trim($rows[$i]) != '') {
	        	$fields = explode("\t", $rows[$i]); 
	        	//check number of fields
	        	if (count($fields) + 1 != count( explode("," ,MyConst::$bulkInputCols[$table]) ) ) {
	        		echo MyConst::$bulkInputCols[$param['table']] ."<br>";
	        		echo "输入的列数与数据库中列数不匹配，批量录入失败，请检查格式，再重试。";
	        		die;
	        	}
	        	$query = "INSERT INTO " . $db_table ." (" . MyConst::$bulkInputCols[$param['table']] .") 
	        			  VALUES ('" . implode("','", $fields) . "', " . $user_id . "  );" ;
	        	echo "$query <br>";
	        	$result = $this->runQuery($query);
        	}
        }
		
        $this->f3->reroute("/list/".$param['table']);
        
	}
	
}