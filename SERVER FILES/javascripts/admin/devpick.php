<?php

	include '../ideascon.php';
	$table = "ideas";

$con=mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
$updateID   = isset($_GET['id']) ? $_GET['id'] : "";

if (updateID){
mysqli_query($con,"UPDATE ideas SET devpick=1 WHERE id='$updateID'");
mysqli_query($con,"UPDATE ideas SET approved=1 WHERE id='$updateID'");
}
mysqli_close($con);
   header( 'Location: http://apprequestsapp.tk/admin/index.php' ) ;
?>