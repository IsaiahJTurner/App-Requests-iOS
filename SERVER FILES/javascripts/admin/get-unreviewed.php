<?php
   // by-likes.php

	include '../ideascon.php';
	$table = "ideas";
 
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}

$sql = "SELECT id,title,date FROM ideas WHERE approved='0' ORDER BY date LIMIT 10";
$result = mysql_query($sql) or die(mysql_error()); 

   // Create an array to hold our results
   $arr = array();
   
   // Add the rows to the array 
   while($obj = mysql_fetch_object($result)) { $arr[] = $obj; }
   
  // return the json result. The string users is just a name for the container object. Can be set anything.
   echo '{"submissions":'.json_encode($arr).'}';

mysql_close($conn);
?>