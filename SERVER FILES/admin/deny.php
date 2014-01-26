<?php
$con=mysqli_connect('mysql14.000webhost.com','a5900984_admin','3HLMuVHG8BVG5BsyRQmg2ztKrmBLRWZgxyyMZnAXqwEga2X7Wr','a5900984_ideas');

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
$updateID   = isset($_GET['id']) ? $_GET['id'] : "";

if (updateID){
mysqli_query($con,"UPDATE ideas SET approved=2 WHERE id='$updateID'");
}
mysqli_close($con);
   header( 'Location: http://apprequestsapp.tk/admin/index.php' ) ;
?>