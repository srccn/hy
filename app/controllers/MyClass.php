<?php
class MyClass extends BaseController {
	
	function signin(){
		$this->f3->set('view','signin.htm');
		echo Template::instance()->render('layout.htm');
	}
	
	function home(){
		$this->f3->set('view','home.htm');
		echo Template::instance()->render('layout.htm');
	}
	
	function signup(){
		$this->f3->set('view','signup.htm');
		echo Template::instance()->render('layout.htm');
	}
	
}