<?php
class UserController extends BaseController {
	
	public static $idNamePare = null;

	function __construct() {
		parent::__construct();
		UserController::setAllIdNamePares();
	}
	
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
				SELECT password, id, submit_date, is_admin, is_active
				FROM   users
				WHERE  name = '$name'
				";
				$result=$this->runQuery($query);
				$regpassword = $result[0]['password'];
				$userId = $result[0]['id'];
				$submitDate = $result[0]['submit_date'];
				$isAdmin = $result[0]['is_admin'];
				//echo $userId;
	
				if (! $result[0]['is_active']){
					$this->f3->set('message', "登入失败，登入已名失效，请联系系统管理员。");
					$this->f3->set('view','home.htm');
					$this->f3->set('showMenu',false);
					echo Template::instance()->render('layout.htm');
					die;
				}
				
				//if (Util::verifyHash($this->f3->POST['password'], $regpassword)) {
				if ($this->f3->POST['password'] === $regpassword) {
					$this->f3->SESSION['username'] = $this->f3->POST['username'];
					$this->f3->SESSION['userid'] = $userId;
					$this->f3->SESSION['submit_date'] = $submitDate;
					$this->f3->SESSION['is_admin'] = $isAdmin;
					$this->f3->set('message','欢迎使用 您已登入为：'.$name);
					$this->f3->reroute('@home');
//             		$this->f3->set('view','home.htm');
//             		$this->f3->set('showMenu',false);
// 		            echo Template::instance()->render('layout.htm');
		            
				} else {
					$this->f3->set('message', "登入失败，请检查登入名和密码");
            		$this->f3->set('view','home.htm');
            		$this->f3->set('showMenu',false);
            		echo Template::instance()->render('layout.htm');
            		die;
				}
			} else {
				$this->f3->set('message', "Please enter name and password. ");
				$this->f3->set('view','home.htm');
            	$this->f3->set('showMenu',false);
				echo Template::instance()->render('layout.htm');
				
			}
		} 
	}
	
	function isAdmin($userId) {

		$query = "SELECT is_active, is_admin
				    FROM users
				   WHERE id = '$userId'";
		$result = $this->runQuery($query);
		
		if ($result[0]['is_active'] == 0 ) {
			return false; #in active user
		}
		
		if ($result[0]['is_admin'] == 0) {
			return false; #not admin
		}
		return true;
	}

	static function setAllIdNamePares() {
		if ( UserController::$idNamePare == null ) {
			$query = "SELECT id, org_name
				    FROM users
				   WHERE is_active > 0
				";
			
			$f3 = Base::instance();
			$db=new DB\SQL($f3->get('db_dns') . $f3->get('db_name'),
					$f3->get('db_user'),
					$f3->get('db_pass')
					);
			$result = $db->exec($query);
			$return_array = array();
			foreach ($result as $row) {
				$return_array[$row['id']] = $row['org_name'];
			}
			UserController::$idNamePare = $return_array;
			return $return_array;
		} else {
			return UserController::$idNamePare;
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

	public function index()	{
		
		if (! $_SESSION['is_admin']) {
			$this->f3->set('message', "无效操作，请联系系统管理员。");
			$this->f3->set('view','home.htm');
			$this->f3->set('showMenu',false);
			echo Template::instance()->render('layout.htm');			
			die;
		}
	
		$user = new User($this->db);
		$this->f3->set('users',$user->all());
		$this->f3->set('showMenu',false);
		$this->f3->set('view',"user/list.html");
		echo Template::instance()->render('layout.htm');
	}	
	
}
