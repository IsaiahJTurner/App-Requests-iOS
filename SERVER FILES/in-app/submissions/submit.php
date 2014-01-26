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
	$userid = $row["id"];
} else {
	//When we enable authentication just uncomment this line
	//die('authentication failed');
}



// submit.php

$table = "ideas";


// Error checking
if(!$conn) {
	die('Could not connect ' . mysql_error());
}

if($_GET['secret'] != "IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis") {
	die('Hacker Detected');
}

// Localize the GET variables
$username   = isset($_GET['username']) ? $_GET['username'] : "";
$title   = isset($_GET['title']) ? $_GET['title'] : "";
$description   = isset($_GET['description']) ? $_GET['description']  : "";
$license  = isset($_GET['license']) ? $_GET['license'] : "";
$email  = isset($_GET['email']) ? $_GET['email'] : "";
$twitter  = isset($_GET['twitter']) ? $_GET['twitter'] : "";
$phone  = isset($_GET['phone']) ? $_GET['phone'] : "";
$imessage  = isset($_GET['imessage']) ? $_GET['imessage'] : "";
$appnet  = isset($_GET['appnet']) ? $_GET['appnet'] : "";
$skype  = isset($_GET['skype']) ? $_GET['skype'] : "";
$othername  = isset($_GET['othername']) ? $_GET['othername'] : "";
$otherhandle  = isset($_GET['otherhandle']) ? $_GET['otherhandle'] : "";
$catagory  = isset($_GET['catagory']) ? $_GET['catagory'] : "";
$agerestriction  = isset($_GET['agerestriction']) ? $_GET['agerestriction'] : "";
$promoted  = isset($_GET['promoted']) ? $_GET['promoted'] : "";

// Protect against sql injections
$username  = mysql_real_escape_string($username);
$title  = mysql_real_escape_string($title);
$description  = mysql_real_escape_string($description);
$license = mysql_real_escape_string($license);
$email = mysql_real_escape_string($email);
$twitter = mysql_real_escape_string($twitter);
$phone = mysql_real_escape_string($phone);
$imessage = mysql_real_escape_string($imessage);
$appnet = mysql_real_escape_string($appnet);
$skype = mysql_real_escape_string($skype);
$othername = mysql_real_escape_string($othername);
$otherhandle = mysql_real_escape_string($otherhandle);
$catagory = mysql_real_escape_string($catagory);
$agerestriction = mysql_real_escape_string($agerestriction);
$promoted = mysql_real_escape_string($promoted);
$ip = $_SERVER['REMOTE_ADDR'];
if ($promoted == "YES") {
	$promotedvalue = 1;
} else {
	$promotedvalue = 0;
}
// Insert the score
$retval = mysql_query("INSERT INTO $table(
			title,
			description,
			license,
			email,
			twitter,
			phone,
			imessage,
			appnet,
			skype,
			othername,
			otherhandle,
			catagory,
			agerestriction,
			userid,
			promoted,
			ip,
			approved
		) VALUES (
			'$title',
			'$description',
			'$license',
			'$email',
			'$twitter',
			'$phone',
			'$imessage',
			'$appnet',
			'$skype',
			'$othername',
			'$otherhandle',
			'$catagory',
			'$agerestriction',
			'$userid',
			'$promotedvalue',
			'$ip',
			'1'
		)",$conn);
			// Above this line change 1 to $promotedvalue to enable the admin panel.
$id = mysql_insert_id();
if($retval) {
	echo "submitted";
} else {
	die ('submission unsuccessful, please contact support if this problem presists');
}
if ($promoted = 1) {
	$approve = "UPDATE `ideas` SET `approved` = `1` WHERE `id` = $id";
	mysql_query($approve);
}
mysql_close($conn);


?>