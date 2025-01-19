<html>

<body>

 

 

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
 
   

 

   

   // get the variables from the URL request string

    $course_no = $_REQUEST['course_no'];

    $course_name = $_REQUEST['course_name'];

    $course_description = $_REQUEST['course_description'];

    $Credit_hours = $_REQUEST['Credit_hours'];

    $section_no = $_REQUEST['section_no'];

    

   $sql = "INSERT INTO course (course_no, course_name, course_description, Credit_hours, section_no)
VALUES ('$course_no', '$course_name', '$course_description', '$Credit_hours', '$section_no')";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>


 

</body>

</html>
