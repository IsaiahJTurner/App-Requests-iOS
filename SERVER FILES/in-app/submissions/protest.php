<?php
        // submit.php
	include '../con.php';
 
	$table = "protests";
 
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
	$username   = isset($_GET['username']) ? $_GET['username'] : "";
