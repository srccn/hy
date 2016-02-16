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
	
}