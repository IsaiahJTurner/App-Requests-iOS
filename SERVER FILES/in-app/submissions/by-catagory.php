<?php
   // by-catagory.php

	include '../con.php';
	$table = "ideas";
 
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
//WHERE (catagory=$catagory1 OR catagory=$catagory2 OR catagory=$catagory3)"
$catagory1   = isset($_GET['catagory1']) ? $_GET['catagory1'] : "";
$catagory2   = isset($_GET['catagory2']) ? $_GET['catagory2'] : "";
$catagory3   = isset($_GET['catagory3']) ? $_GET['catagory3'] : "";
$sql = "SELECT id,title,catagory,agerestriction,promoted,date,devpick,likes FROM ideas WHERE (catagory='$catagory1' OR catagory='$catagory2' OR catagory='$catagory3') AND approved='1'";
$result = mysql_query($sql) or die(mysql_error()); 

   // Create an array to hold our results
   $arr = array();
   
   // Add the rows to the array 
   while($obj = mysql_fetch_object($result)) { $arr[] = $obj; }
   
  // return the json result. The string users is just a name for the container object. Can be set anything.
   echo '{"submissions":'.json_encode($arr).'}';

//Print "<table border cellpadding=3>"; 
//while($info = mysql_fetch_array($result)) 
// { 
// Print "<tr>"; 
// Print "<th>id:</th> <td>".$info['id'] . "</td> "; 
// Print "<th>Title:</th> <td>".$info['title'] . " </td> ";
 //Print "<th>Description:</th> <td>".$info['description'] . " </td></tr>"; 
// } 
 //Print "</table>"; 

mysql_close($conn);
?>	