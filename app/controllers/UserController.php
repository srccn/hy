<?php
class UserController extends BaseController {
	
	function addUser(){
		$name=$this->f3->POST['username'];
		$email = $this->f3->POST['email'];
		//$passwrod = Util::hashString($this->f3->POST['password']);
		$passwrod = $this->f3->POST['password'];
		$phone = $this->f3->POST['phone'];
		$timeStamp = time();
	
		//check user existence
		$query = "select count(*) as result from users where name = '$name'";
		$result = $this->runQuery($query);
	
		if ($result[0]['result'] > 0 ) {
			$this->f3->set('message', 'User name is already exist, try to choose antoher name.')	;
			$this->f3->set('view','home.htm');
			echo Template::instance()->render('layout.htm');
		} else {
			$query = "
			INSERT into users
			(name, email,password,regdate,phone)
			VALUES ('$name' , '$email', '$passwrod', $timeStamp, '$phone')
			" ;
			$this->runQuery($query);

			//acqure id
			$query = "
				SELECT id
				FROM   users
				WHERE  name = '$name'
			";
			$result=$this->runQuery($query);
			$userId = $result[0]['id'];
			
			$this->f3->SESSION['username'] = $name;
			$this->f3->SESSION['userid'] = $userId;
			$this->f3->reroute('/home');
 		}
	}
	
	function signout() {
		//$this->f3->SESSION['user'] = 'unknwn';
		session_destroy();
		//Util::dump($this->f3->SESSION);
		$this->f3->reroute('/');
	}
	
	function verifysignin () {
		if (! empty ( $this->f3->POST)) {
			if ( isset ($this->f3->POST['username'] ) && isset($this->f3->POST['password']) ) {
	
				$name = $this->f3->POST['username'];
	
				//if check passwrod succeeded
				$query = "
				SELECT password, id, submit_date
				FROM   users
				WHERE  name = '$name'
				";
				$result=$this->runQuery($query);
				$regpassword = $result[0]['password'];
				$userId = $result[0]['id'];
				$submitDate = $result[0]['submit_date'];
				//echo $userId;
	
				//if (Util::verifyHash($this->f3->POST['password'], $regpassword)) {
				if ($this->f3->POST['password'] === $regpassword) {
					$this->f3->SESSION['username'] = $this->f3->POST['username'];
					$this->f3->SESSION['userid'] = $userId;
					$this->f3->SESSION['submit_date'] = $submitDate;
					$this->f3->set('message','欢迎使用 您已登入为：'.$name);
					$this->f3->reroute('@home');
//             		$this->f3->set('view','home.htm');
//             		$this->f3->set('showMenu',false);
// 		            echo Template::instance()->render('layout.htm');
		            
				} else {
					$this->f3->set('message', "登入失败，请检查登入名和密码");
            		$this->f3->set('view','signin.htm');
            		$this->f3->set('showMenu',false);
            		echo Template::instance()->render('layout.htm');
				}
			} else {
				$this->f3->set('message', "Please enter name and password. ");
				$this->f3->set('view','signin.htm');
            	$this->f3->set('showMenu',false);
				echo Template::instance()->render('layout.htm');
				
			}
		} 
	}
	
	function sealUser(){
		date_default_timezone_set("Asia/Shanghai");
		$current_datetime = date("Y-m-d h:i:sa");
		$name =$this->f3->SESSION['username'];
		var_dump($current_datetime);
		$query = "
			update users 
			set submit_date = '$current_datetime' 
			WHERE  name = '$name'
		";
		$result=$this->runQuery($query);
		$this->f3->set('SESSION[submit_date]', $current_datetime);
	}
	
	function unSealUser(){
		$name = $this->f3->SESSION['username'];
	
		$query = "
			update users
			set submit_date = null
			WHERE  name = '$name'
		";
		$result=$this->runQuery($query);
		$this->f3->set('SESSION[submit_date]', null);
	}
	
}
