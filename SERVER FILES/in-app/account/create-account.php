<?php
        // submit.php
	include '../con.php';
 
	$table = "users";
 
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
 
	if($_GET['secret'] != "IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis") {
		die('Hacker Detected');
	}
 
	// Localize the GET variables
	$name   = isset($_GET['name']) ? $_GET['name'] : "";
	$password   = isset($_GET['password']) ? $_GET['password']  : "";
 	$email  = isset($_GET['email']) ? $_GET['email'] : "";
	$birth  = isset($_GET['birth']) ? $_GET['birth'] : "";

	// Protect against sql injections
	$name  = mysql_real_escape_string($name);
	$password  = mysql_real_escape_string($password);
	$email = mysql_real_escape_string($email);
 	$birth = mysql_real_escape_string($birth);

$queryres = "SELECT email FROM users WHERE email='$email' LIMIT 1";
$result = mysql_query($queryres, $conn) or die("Selection Query Failed !!!");

if (mysql_num_rows($result) > 0) {
		die('email taken');
} else {
// Insert the score


	$retval = mysql_query("INSERT INTO $table(
			name,
			password,
			email,
			birth
		) VALUES (
			'$name',
			sha1('$password'),
			'$email',
			'$birth'
		)",$conn);
       $id = mysql_insert_id();
	if($retval) {
		echo $id;
	// Drop existing table if exists
} else {
		echo "Signup unsuccessful, please contact support if this problem presists. " . mysql_error();
	}
}




mysql_close($conn);
?>			