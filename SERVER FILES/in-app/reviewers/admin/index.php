<html><head><title>Review Submissions</title><link rel="stylesheet" href="styles.css" type="text/css" /></head><body>
<?php

/* connect to the db */
	include '../con.php'; 

	$table = "ideas";
 
	// Initialization
	$conn = mysql_connect(DB_HOST,DB_USER,DB_PASSWORD);
	mysql_select_db(DB_NAME,$conn);

 // For the purpose of saving space on my post I'm going to limit the amount of results to 4, see "LIMIT 4" below.
  $sql = "SELECT * FROM ideas WHERE approved='0'";
  $result = mysql_query($sql)or die(mysql_error());
 
  // Now let's start building our table, I'll go line by line just like HTML so it's easier to read.  
  // I don't think we need every one of the details about each model so I'm going to just include what 
  // I think my customer needs to know on a product overview page.  This will just list the name, description, 
  // quantity in stock, scale, and price of each item.  We need to put the table opening tag and first row 
  // outside of the while loop first otherwise every time we process a row we'll get a new table and tr.
 
  echo "<table>";
  echo "<tr><th>id</th><th style=\"width=300px;\">title</th><th>description</th><th>license</th><th>email</th><th>twitter</th><th>phone</th><th>imessage</th><th>appnet</th><th>skype</th><th>othername</th><th>otherhandle</th><th>catagory</th><th>agerestriction</th><th>Approve or Deny</th</tr>";
 
  while($row = mysql_fetch_array($result)){
  // Before we close out of PHP, lets define all of our variables so they are easier to remember and work with,
  // you can skip this though if you just want to directly reference each row.
 
  $id     = $row['id'];
  $title     = $row['title'];
  $description    = $row['description'];
  $license     = $row['license'];
  $email = $row['email'];
  $twitter    = $row['twitter'];
  $phone     = $row['phone'];
  $imessage    = $row['imessage'];
  $appnet     = $row['appnet'];
  $skype = $row['skype'];
  $othername    = $row['othername'];
  $otherhandle = $row['otherhandle'];
  $catagory    = $row['catagory'];
  $agerestriction    = $row['agerestriction'];

// Now for each looped row
 
echo "<tr><td>".$id."</td><td>".$title."</td><td>".$description."</td><td>".$license."</td><td>".$email."</td><td>".$twitter."</td><td>".$phone."</td><td>".$imessage."</td><td>".$appnet."</td><td>".$skype."</td><td>".$othername."</td><td>".$otherhandle."</td><td>".$catagory."</td><td>".$agerestriction."</td><td>Approve:<form action=\"approve.php?id=".$id."\" method=\"post\"><input type=\"submit\" name=\"approve\"></form><br />Deny:<form action=\"deny.php?id=".$id."\" method=\"post\"><input type=\"submit\" name=\"deny\"></form><br />Dev Pick:<form action=\"devpick.php?id=".$id."\" method=\"post\"><input type=\"submit\" name=\"devpick\"></form></td></tr>";
 
} // End our while loop
echo "</table>"

?></body></html>