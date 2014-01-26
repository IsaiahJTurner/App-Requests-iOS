<?php
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
	$id   = isset($_GET['id']) ? $_GET['id']  : "";

	// Protect against sql injections
	$id  = mysql_real_escape_string($id);


$value = mysql_result(mysql_query("SELECT name FROM users WHERE id='$id'"), 0);

echo $value;  

mysql_close($conn);
?>