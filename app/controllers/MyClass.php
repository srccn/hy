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
		
		$this->f3->set('report_filter', $_POST['wuzhong']);
		$this->f3->set('view', 'report/report.html');
		
		$this->f3->set('showMenu',false);
		echo Template::instance()->render('layout.htm');
		//		echo Template::instance()->render('report.html');
		echo $myReportController->generatePageBody();
	}

	function reportimages(){
		$myReportController = new ReportController();
		$myReportController->generateAttachmentPage();
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