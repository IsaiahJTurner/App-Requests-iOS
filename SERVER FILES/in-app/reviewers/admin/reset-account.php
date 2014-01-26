<?php
	include '../con.php'; 

	$table = "users";
 
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
		name VARCHAR(45),
		username VARCHAR(45),
		password VARCHAR(50),
		email VARCHAR(255),
		birth VARCHAR(10),
		loginhash VARCHAR(50),
		lastlogin DATETIME,
		flagsgiven INT(5),
		flagsrecieved INT(5),
		confirmed TINYINT(1),
		date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
	)",$conn);
 
	if($retval) {
		echo "Database created...";
	} else {
		echo "Could not create database " . mysql_error();
	}
 
	mysql_close($conn);
?>