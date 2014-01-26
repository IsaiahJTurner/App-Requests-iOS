<?php
        // create_db.php
	/** MySQL database name */
	define('DB_NAME', 'a5900984_ideas');
	/** MySQL database username */
	define('DB_USER', 'a5900984_admin');
	/** MySQL database password */
	define('DB_PASSWORD', '3HLMuVHG8BVG5BsyRQmg2ztKrmBLRWZgxyyMZnAXqwEga2X7Wr');
	/** MySQL hostname */
	define('DB_HOST', 'mysql14.000webhost.com');
 
	$table = "ideas";
 
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME, $conn);
 
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
		title VARCHAR(120),
		description TEXT,
		license TEXT,
		email VARCHAR(255),
		twitter VARCHAR(16),
		phone VARCHAR(20),
		imessage VARCHAR(255),
		appnet VARCHAR(21),
		skype VARCHAR(33),
		othername VARCHAR(100),
		otherhandle VARCHAR(100),
		catagory VARCHAR(30),
		agerestriction VARCHAR(4) not null default '17+',
		promoted BOOL not null default 0,
		flags INT(10) not null default '0',
		likes INT(10) not null default '0',
		view INT(10) not null default '0',
		dislikes INT(10) not null default '0',
		devpick BOOL not null default 0,
		approved BOOL not null default 0,
		date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
	)",$conn);
 
	if($retval) {
		echo "Database created...";
	} else {
		echo "Could not create database " . mysql_error();
	}
 
	mysql_close($conn);
?>					