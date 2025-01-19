<html>
<body>


Results of Course Database<br><br>

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
 
  
  
  $sql = "SELECT *  FROM course";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Course Number: " . $row["course_no"]. " - Course Name: " . $row["course_name"]. " - Course Description: " . $row["course_description"]. " - Credit: " . $row["Credit_hours"]. " - Section Number: " . $row["section_no"]."<br>";
  }
} else {
  echo "0 results";
}
$conn->close();
?>

</body>
</html>
