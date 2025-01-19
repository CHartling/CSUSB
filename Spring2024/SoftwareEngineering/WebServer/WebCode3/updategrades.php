<p>Update Grades</p>

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
 
    
$CourseID = $_REQUEST['CourseID'];
$studentID = $_REQUEST['studentID']
$Grade = $_REQUEST['Grade'];


$sql = "UPDATE Grades SET Grade='$Grade' WHERE CourseID='$CourseID' AND studentID='$studentID'";

if ($conn->query($sql) === TRUE) {
  echo "Record updated successfully";
} else {
  echo "Error updating record: " . $conn->error;
}

$conn->close();

   

?>