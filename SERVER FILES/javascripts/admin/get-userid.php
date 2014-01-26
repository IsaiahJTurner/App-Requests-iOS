<?php
	include '../userscon.php'; 

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
	$password   = isset($_GET['password']) ? $_GET['password']  : "";
 	$username  = isset($_GET['email']) ? $_GET['email'] : "";

	// Protect against sql injections
	$password  = mysql_real_escape_string($password);
	$username = mysql_real_escape_string($email);
/*

$queryres = "SELECT password FROM users WHERE email='$email'";
$result = mysql_query($queryres, $conn) or die("Selection Query Failed !!!");
$realpass = mysql_result(mysql_query("SELECT password FROM users WHERE email='$email'"), 0);
if ($realpass==$password) {
	$value = mysql_result(mysql_query("SELECT id FROM users WHERE email='$email'"), 0);
echo $value;  
} else {
echo "not equal";
}
*/

$queryres = "SELECT `password`,`id` FROM `reviewers` WHERE `username`='$username' LIMIT 1";
$result = mysql_query($queryres);

// Check result
// This shows the actual query sent to MySQL, and the error. Useful for debugging.
if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}

$row = mysql_fetch_assoc($result);
mysql_close($conn);

$realpass = $row["password"];
if ($realpass==$password) {
	$value = $row["id"];	
}else{
	die("not equal");
}

echo $value;


?>