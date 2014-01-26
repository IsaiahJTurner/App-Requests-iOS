<?php
	include 'userscon.php';
 
	$table = "users";
 
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
 

	// Localize the GET variables
	$email   = isset($_GET['email']) ? $_GET['email'] : "";
	$password = $_GET["password"] => $password = md5($_GET["password"]);
	//$password   = isset($_GET['password']) ? $_GET['password']  : "";


	// Protect against sql injections
	$email  = mysql_real_escape_string($email);
	$password  = mysql_real_escape_string($password);

	// Insert the score
// Mysql_num_row is counting table row
$count=mysql_num_rows($result);

// If result matched $email and $password, table row must be 1 row
if($count==1){

// Register $email, $password and redirect to file "login_success.php"
session_register("email");
session_register("password"); 
header("location:login-success.php");
}
else {
echo "error";
}

	mysql_close($conn);
?>