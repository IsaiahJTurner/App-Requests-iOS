<?php
   // search.php

	include '../con.php';
	$table = "ideas";
 
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}

$q   = isset($_GET['q']) ? $_GET['q'] : "";
$sql = "SELECT id,title,catagory,agerestriction,promoted,date,devpick,likes FROM ideas WHERE (id LIKE '%$q%' OR title LIKE '%$q%' OR description LIKE '%$q%' OR username LIKE '%$q%' OR userid LIKE '%$q%') AND approved='1' LIMIT 10";
$result = mysql_query($sql) or die(mysql_error()); 

   // Create an array to hold our results
   $arr = array();
   
   // Add the rows to the array 
   while($obj = mysql_fetch_object($result)) { $arr[] = $obj; }
   
  // return the json result. The string users is just a name for the container object. Can be set anything.
   echo '{"submissions":'.json_encode($arr).'}';

mysql_close($conn);
?>	