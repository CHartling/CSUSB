
<?php

$servername = "localhost";
$username = "quickme1_4211";
$password = "csci4211";
$dbname = "quickme1_4211";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
} 
 
  
 
$studentID = $_REQUEST['studentID'];
$CourseID = $_REQUEST['CourseID'];

   

$sql = "SELECT * FROM `grades` WHERE `studentID` LIKE '%$studentID' AND `CourseID` LIKE `%$CourseID`";
$result = $conn->query($sql);


if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Student ID: " . $row["studentID"]. " - Course ID: " . $row["CourseID"]. " - Grade: " . $row["Grade"]. "<br>";
  }
} else {
  echo "0 results";
}
$conn->close();
?>

