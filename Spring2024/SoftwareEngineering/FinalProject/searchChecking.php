
<?php

$servername = "localhost";
$username = "quickme1_4211";
$password = "csci4211";
$dbname = "dbvpny1qngaxgp";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
} 
 
  
 
$Acct_no = intval($_REQUEST['Acct_no']);

   

$sql = "SELECT * FROM `checking` WHERE `Acct_no` LIKE '%$Acct_no'";
$result = $conn->query($sql);


if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Account Number: " . $row["Acct_no"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. " Address: " . $row["address"]." Email: " . $row["email"]."<br>Phone: " . $row["phone"]." Balance: " . $row["Balance"]." Date: " . $row["Date"]." TRansID: " . $row["TRansID"]."<br><br>";
  }
} else {
  echo "0 results";
}
$conn->close();
?>

