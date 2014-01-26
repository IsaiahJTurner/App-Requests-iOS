<?php
	include '../con.php'; 

	$table = "protests";
 
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME,$conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
 
	// Drop existing table if exists
	mysql_query("DROP TABLE $table", $conn);
 
	$retval = mysql_query("CREATE TABLE $table(
		id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
		username VARCHAR(40),
		userid VARCHAR(11),
		postid VARCHAR(11),
		note TEXT,
		status BOOL not null default 0,
		date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
	)",$conn);
 
	if($retval) {
		echo "Database created...";
	} else {
		echo "Could not create database " . mysql_error();
	}
 
	mysql_close($conn);
?>					