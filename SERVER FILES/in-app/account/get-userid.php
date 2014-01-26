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
	$password  = isset($_GET['password']) ? $_GET['password'] : "";

	$password = sha1($password);
 	$email  = isset($_GET['email']) ? $_GET['email'] : "";

	// Protect against sql injections
	$password  = mysql_real_escape_string($password);
	$email = mysql_real_escape_string($email);	
	

$sql="SELECT id FROM $table WHERE email='$email' AND password='$password'";
$result=mysql_query($sql);
$row = mysql_fetch_assoc($result);

// Mysql_num_row is counting table row
$count=mysql_num_rows($result);
// If result matched $myusername and $mypassword, table row must be 1 row
if($count==1){
	$value= $row["id"];
	echo $value;
} else {
echo "authentication failed";
}
mysql_close($conn);

?>