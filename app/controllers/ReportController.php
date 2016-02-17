<?php
class ReportController extends BaseController{
	
	private $report = array(); 
	
	
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
		$article->addFilter("level='国家级'") ;
		$report['g1_answer1'] = $article->all();
		
		//g1_answer2
		$article = new Article($this->db, MyConst::$tables['q1'], $this->trimUserId(MyConst::$reportCols['q1']) );
		$article->addFilter("level='省部级'") ;
		$report['g1_answer2'] = $article->all();

		//g2_answer
		$article = new Article($this->db, MyConst::$tables['q2'], $this->trimUserId(MyConst::$reportCols['q2']) );
		$report['g2_answer'] = $article->all();
		
		//g3_answer1
		$article = new Article($this->db, MyConst::$tables['q3'], $this->trimUserId(MyConst::$reportCols['q3']) );
		$article->addFilter("category='已获得新品种保护'") ;
		$report['g3_answer1'] = $article->all();
		
		//g3_answer2
		$article = new Article($this->db, MyConst::$tables['q3'], $this->trimUserId(MyConst::$reportCols['q3']) );
		$article->addFilter("category='申请中新品种保护'") ;
		$report['g3_answer2'] = $article->all();
		
		return $report;
	}
	
	private function trimUserId($colString){
		$words = explode(',' , $colString);
	    foreach (array_keys($words, 'user_id', true) as $key) {
            unset($words[$key]);
        }
        return implode ( ',' , $words );
	}
	
	
}