<?php
class ReportController extends BaseController{
	
	private $report = array(); 
	private $report_filter='';
	
	function setReportFilter(){
		
		if ( $this->f3->get('POST.wuzhong') != null) {

			if ( $this->f3->get('POST.wuzhong') != 'ALL'  )  {
			$query = "
		    		SELECT id
		    		  FROM users
		    		 WHERE project = '" . $this->f3->get('POST.wuzhong') . "';
		    		";
		    
		    $result = $this->runQuery($query);
		    
		    $userList = array();
		    
		    foreach ($result as $row) {
		    	array_push ($userList, $row['id']);
		    }
		        $this->report_filter = "user_id in ( " . implode(',', $userList) . ")" ;
			}
		}
		
	}
	
	function getReport(){
	
		if (! isset ($this->f3->SESSION['userid']) ) {
			$this->f3->set('message', "请登入查看汇总报告");
			$this->f3->set('view','signin.htm');
			$this->f3->set('showMenu',false);
			echo Template::instance()->render('layout.htm');
			die;
		}
		
		//g1_answer1
		$article = new Article($this->db, MyConst::$tables['q1'], $this->trimUserId(MyConst::$reportCols['q1']) );
		$article->addFilter($this->report_filter);
		$article->addFilter("level='国家级'") ;
		$report['g1_answer1'] = $article->all();
		
		//g1_answer2
		$article = new Article($this->db, MyConst::$tables['q1'], $this->trimUserId(MyConst::$reportCols['q1']) );
		$article->addFilter($this->report_filter);
		$article->addFilter("level='省部级'") ;
		$report['g1_answer2'] = $article->all();

		//g2_answer
		$article = new Article($this->db, MyConst::$tables['q2'], $this->trimUserId(MyConst::$reportCols['q2']) );
		$article->addFilter($this->report_filter);
		$report['g2_answer'] = $article->all();
		
		//g3_answer1
		$article = new Article($this->db, MyConst::$tables['q3'], $this->trimUserId(MyConst::$reportCols['q3']) );
		$article->addFilter($this->report_filter);
		$article->addFilter("category='已获得新品种保护'") ;
		$report['g3_answer1'] = $article->all();
		
		//g3_answer2
		$article = new Article($this->db, MyConst::$tables['q3'], $this->trimUserId(MyConst::$reportCols['q3']) );
		$article->addFilter($this->report_filter);
		$article->addFilter("category='申请中新品种保护'") ;
		$report['g3_answer2'] = $article->all();

		//g4_answer
		$article = new Article($this->db, MyConst::$tables['q4'], $this->trimUserId(MyConst::$reportCols['q4']) );
		$article->addFilter($this->report_filter);
		$report['g4_answer'] = $article->all();

		//g5_answer
		$article = new Article($this->db, MyConst::$tables['q5'], $this->trimUserId(MyConst::$reportCols['q5']) );
		$article->addFilter($this->report_filter);
		$report['g5_answer'] = $article->all();

		//g6_answer1
		$article = new Article($this->db, MyConst::$tables['q6'], $this->trimUserId(MyConst::$reportCols['q6']) );
		$article->addFilter($this->report_filter);
		$article->addFilter("level like '%SCI%' ") ;
		$report['g6_answer1'] = $article->all();
		
		//g6_answer2
		$article = new Article($this->db, MyConst::$tables['q6'], $this->trimUserId(MyConst::$reportCols['q6']) );
		$article->addFilter($this->report_filter);
		$article->addFilter("level like '%核心%' ") ;
		$report['g6_answer2'] = $article->all();
		
		//g7_answer
		$article = new Article($this->db, MyConst::$tables['q7'], $this->trimUserId(MyConst::$reportCols['q7']) );
		$article->addFilter($this->report_filter);
		$report['g7_answer'] = $article->all();
		
		//g8_answer1
		$article = new Article($this->db, MyConst::$tables['q8'], $this->trimUserId(MyConst::$reportCols['q8']) );
		$article->addFilter($this->report_filter);
		$article->addFilter("category='发明专利'") ;
		$report['g8_answer1'] = $article->all();
		
		//g8_answer2
		$article = new Article($this->db, MyConst::$tables['q8'], $this->trimUserId(MyConst::$reportCols['q8']) );
		$article->addFilter($this->report_filter);
		$article->addFilter("category='实用新型号专利'") ;
		$report['g8_answer2'] = $article->all();

		//g9_answer
		$article = new Article($this->db, MyConst::$tables['q9'], $this->trimUserId(MyConst::$reportCols['q9']) );
		$article->addFilter($this->report_filter);
		$report['g9_answer'] = $article->all();
		
		return $report;
	}
	
   
	function generateAttachmentDownload() {
		$file_path   = getcwd() . '/output_files_work/';
		array_map('unlink', glob($file_path."*"));
		$zipFileName = getcwd() . '/output_files/hy_image_2016.zip';

		//cleanup
		array_map('unlink', glob($file_path."*"));
		array_map('unlink', glob( getcwd() . '/output_files/*'));
		
		$tables = ["articles","q2","q3","q4","q5","q6","q7","q8","q9"];
		
		$this->setReportFilter();
		
		for ($i=0; $i < count($tables) ; $i++ ) {
			array_map('unlink', glob($file_path."*"));
			//extract attachment out from DB
			$query = "select attachment_type, attachment, attachment_name from " . $tables[$i] ." where attachment is not null";
			
			if (trim ($this->report_filter) != '') {
				$query = $query . " AND " . $this->report_filter ; 
			}
			
			$result = $this->runQuery($query);
			foreach ($result as $row) {
				file_put_contents($file_path . $row['attachment_name'] , $row['attachment'] );
			}
			
			//create zip file
			$zip = new ZipArchive();
			if ($zip->open($zipFileName, ZipArchive::CREATE)!==TRUE) {
				exit("cannot open <$zipFileName>\n");
			}
			$options = array('add_path' => $i+1 .'/' ,'remove_all_path' => TRUE);
			$zip->addGlob($file_path."/*", GLOB_BRACE, $options);
			$zip->close();
		}
		
		if (file_exists($zipFileName)) {
			//send zip file to browser
			
			$download_file_name = "hy_" . $_POST['wuzhong'] . ".zip";
			
			header("Content-Type: application/zip");
			header("Content-Disposition: attachment; filename=$download_file_name");
			header("Content-Length: " . filesize($zipFileName));
			readfile($zipFileName);
		} else {

			$this->f3->set('message', "没有找到附加文件");
			$this->f3->set('report_filter', $_POST['wuzhong']);
			$this->f3->set('view', 'report/report.html');
			
			$this->f3->set('showMenu',false);
			echo Template::instance()->render('layout.htm');
			//		echo Template::instance()->render('report.html');
			echo $this->generatePageBody();
		}
		
	}
	
	
	function generateAttachmentPage() {
		$query = "select attachment_type, attachment, attachment_name from q6 where attachment is not null";
		$result = $this->runQuery($query);
		
		echo '<div class="container">';
		foreach ($result as $row) {
			echo "<p>";
			if ($row['attachment_type'] == 'image/jpeg') {
				echo '<img src="data:image/jpeg;base64,'.base64_encode( $row['attachment'] ).'" width="90%" />';
			}
			if ($row['attachment_type'] == 'application/pdf') {
		        echo '<embed src="data:application/pdf;base64,'.base64_encode( $row['attachment'] ).'" width="700" height="700" type="application/pdf">';
				//echo '<object data="'.base64_encode( $row['attachment'] ).'" width="500" height="700" type="application/pdf">aaaa</object>';
			}
			echo "</p>";
		}
		echo '</div>';
		//echo '<img src="data:image/jpeg;base64,'.base64_encode( $image ).'" width="500"/>';
		//echo '<embed src="data:application/pdf;base64,'.base64_encode( $image ).'" width="700" height="700" type="application/pdf">';
	}
	
	function generatePageBody(){
		
//		if ($this->f3->get('POST.applyfilter')) {
			$this->setReportFilter();		
//		}
		
		$report = $this->getReport();
		
$doc_body ='
<div class="container">		
<h3>登入：'.$this->f3->get('SESSION[username]'). ' , '. ( $_POST['wuzhong'] ?  $_POST['wuzhong'] : "ALL" ) . '</h3> 		
<h1>成果汇总</h1>
<h3>1.获奖项目</h3>
  <ol type="A"> 
    <li>国家级奖
      <ol type="1">' .
      $this->getArrayList($report['g1_answer1']) .
      '</ol>
    </li>
    <li>省部级奖
      <ol type="1">' .
      $this->getArrayList($report['g1_answer2']) .
      '</ol>
    </li>
  </ol>
<h3>2.品种审定（鉴定）</h3>
  <ol type="1">' .
      $this->getArrayList($report['g2_answer']) .
  '</ol>
<h3>3.新品种保护</h3>
  <ol type="A"> 
    <li>已获得新品种保护
      <ol type="1">' .
      $this->getArrayList($report['g3_answer1']) .
      '</ol>
    </li>
    <li>申请中新品种保护
      <ol type="1">' .
      $this->getArrayList($report['g3_answer2']) .
      '</ol>
    </li>
  </ol>
<h3>4.颁布的技术标准</h3>
  <ol type="1">' .
      $this->getArrayList($report['g4_answer']) .
  '</ol>
<h3>5.制定技术规程</h3>
  <ol type="1">' .
      $this->getArrayList($report['g5_answer']) .
  '</ol>
<h3>6.发表文章</h3>
<ol type="A"> 
<li>发表SCI文章
  <ol type="1">' .
      $this->getArrayList($report['g6_answer1']) .
  '</ol>
</li>
<li>发表核心期刊文章
  <ol type="1">' .
      $this->getArrayList($report['g6_answer2']) .
  '</ol>
</li>
</ol>
<h3>7.出版著作</h3>
  <ol type="1">' .
      $this->getArrayList($report['g7_answer']) .
  '</ol>
<h3>8.获得专利</h3>
<ol type="A"> 
<li>发明专利
  <ol type="1">' .
      $this->getArrayList($report['g8_answer1']) .
  '</ol>
</li>
<li>实用新型号专利
  <ol type="1">' .
      $this->getArrayList($report['g8_answer2']) .
  '</ol>
</li>
</ol>
<h3>9.典型事例</h3>
  <ol type="1">' .
      $this->getArrayList($report['g9_answer']) .
  '</ol>

</div>      		
';

        return $doc_body  ;
	}

	function generateDownload(){
		
		$doc_body = $this->generatePageBody();
		
		header('Content-Type: text/html; charset=UTF-8');
		if (isset($_POST['submit_doc'])) {
			header("Content-type: application/vnd.ms-word");
			header("Expires: 0");
			header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
			header("Content-Disposition: attachment;Filename=hy2016.doc");
		};
		echo "<html>" ;
		echo $doc_body ;
		echo "</html>" ;
		
	}
	
	
	private function getArrayList($array){
		$returnString="";
		if (! $array) {
			return "" ;
		}
		foreach ($array as $line) {
			$returnString = $returnString . "<li>";
			$fields = $line->fields();
			$lineString="";
			foreach ($fields as $field) {
				$lineString = $lineString . $line->get($field) . ' ';
			}
			$returnString = $returnString . $lineString;
			$returnString = $returnString . "</li>" ;
		}
		return $returnString;
	}
	
	private function trimUserId($colString){
		$words = explode(',' , $colString);
	    foreach (array_keys($words, 'user_id', true) as $key) {
            unset($words[$key]);
        }
        return implode ( ',' , $words );
	}
	

	
}