<html>
<body>


Results of Grades Database<br><br>

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
 
$studentID = '1234567890';
$thecourseID = 'csci4211';

// retrieve all the Prerequisites for csci4211
echo("The Studentid is" . $studentID);
$query = "SELECT PrereqID, CourseID FROM 'Prerequisites' WHERE `courseID`='%$thecourseID'";
$results = $conn->query($sql);



// print out the results
if( $result->num_rows > 0 )
{
	while( $row = $result->fetch_assoc() )
	{

		// print out the info
		$PrereqID = $row['PrereqID'];
		echo($PrereqID);
		echo($studentID);

		// You have now printed the prerequisites
		//Next find out the grades
		$query1= "SELECT Grade FROM Grades WHERE `studentID`='%$studentID' AND ‘CourseID’='%$PrereqID' AND ‘Grade’IN {'A', 'B', 'C'}";
		$results2 = $conn->query($query1);
		
		if ( $results2 )
		{
			echo("You have the prerequisites, you may register");
		}

		else
			echo("You do not have the prerequisites");
	}
}
?>

</body>
</html>