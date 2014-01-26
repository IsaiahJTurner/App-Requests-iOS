<?php
   // get-idea.php
	include '../con.php';
	$table = "ideas";
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME, $conn);
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
$postid   = isset($_GET['postid']) ? $_GET['postid'] : "";

$sql = "SELECT description,id,license,email,twitter,phone,imessage,appnet,skype,othername,otherhandle,view FROM ideas WHERE id='$postid'";
$result = mysql_query($sql) or die(mysql_error()); 

   // Create an array to hold our results
   $arr = array();
   
   // Add the rows to the array 
   while($obj = mysql_fetch_object($result)) { $arr[] = $obj; }
   
  // return the json result. The string idea is just a name for the container object. Can be set anything.
   echo '{"idea":'.json_encode($arr).'}';

mysql_query("UPDATE ideas SET view=field+1 WHERE id='$postid'");
mysql_close($conn);
?>