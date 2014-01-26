<?php
   	include '../con.php'; 
   	$table= "users";
 
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
	$userid = $row["id"];
} else {
//die('authentication failed');
}

	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
 
	if($_GET['secret'] != "IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis") {
		die('Hacker Detected');
	}
	
	// Localize the GET variables
	$postid   = isset($_GET['postid']) ? $_GET['postid'] : "";
	$actiontype   = isset($_GET['actiontype']) ? $_GET['actiontype'] : "";

	// Protect against sql injections
	$postid  = mysql_real_escape_string($postid);
	$actiontype  = mysql_real_escape_string($actiontype);
	$newtable = "ideas";
	$row = mysql_fetch_assoc($result);

//set the users current ip address this is how we can tell if they have already liked it
$ip = $_SERVER['REMOTE_ADDR'];

//If this query has an output then the user has already liked the request
$sql = "SELECT `ip` FROM `like_bans` WHERE `postid` = $postid AND `ip` = \"$ip\"";
$result = mysql_query($sql);


//Lets run the query
if (mysql_num_rows($result) > 0) {
    echo 'already liked';
} else {
	//Now we will increase the likes by one.
	$query_banip = "INSERT INTO `like_bans` (ip, postid) VALUES ('$ip', '$postid')";
	$query_addlike = "UPDATE `ideas` SET `likes` = `likes` + 1 WHERE `id` = $postid";
	mysql_query($query_banip);
	mysql_query($query_addlike);
    echo 'liked';
}
//mysql_close($conn);
?>