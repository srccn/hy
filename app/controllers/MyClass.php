<?php
class MyClass extends BaseController {
	
	function signin(){
		$this->f3->set('view','signin.htm');
		$this->f3->set('showMenu',false);
		echo Template::instance()->render('layout.htm');
	}
	
	function home(){
		$this->f3->set('view','home.htm');
		$this->f3->set('showMenu',false);
		echo Template::instance()->render('layout.htm');
	}

	function signup(){
		$this->f3->set('view','signup.htm');
		$this->f3->set('showMenu',false);
		echo Template::instance()->render('layout.htm');
	}

	function report(){
		$myReportController = new ReportController();
		
		$download_button = '
				<form name="create_doc" action="' . $this->f3->get('BASE') . '/downloadreport" method="post">
				  <input type="submit" name="submit_doc" value="下载 MS Word" />
				</form>				
				';

		$submit_button = '
				<form name="submit_me" action="' . $this->f3->get('BASE') . '/submit" method="post">
				  <input type="submit" name="submit_me" value="提交" />
				</form>
				';
		
		
		echo $download_button;
		if (! $this->f3->get('SESSION[submit_date]')) {
			echo $submit_button;
				
		}
		echo $myReportController->generatePageBody();
		// echo Template::instance()->render('layout.htm');
		//		echo Template::instance()->render('report.html');
	}

	function downloadreport(){
		$myReportController = new ReportController();
		$myReportController->generateDownload();
	}
	
	
	function seal(){
		//update user table to set submit_date to $current_datetime
		$myuserController = new UserController();
		$myuserController->sealUser();
		$this->f3->reroute('@home');
	}

	function reopen(){
		//update user table to set submit_date to $current_datetime
		$myuserController = new UserController();
		$myuserController->unSealUser();
		$this->f3->reroute('@home');
	}
	
}