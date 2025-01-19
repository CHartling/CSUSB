<html>

<body>

 

 

<?php

   // saving script

   

     $dbcnx = @mysql_connect("localhost", "quickme1_4211",
   "csci4211");
 

if (!$dbcnx) { 

    echo( "<p>Unable to connect to the " . 

          "database server at this time.</p>" 

   ); 

    exit(); 

   } 

 

   

 

// Select the Registration database 

  if (! @mysql_select_db("quickme1_4211") ) {

    echo( "<p>Unable to locate the registration " . 

          "database at this time.</p>" ); 

    exit(); 

  } 

   

   // get the variables from the URL request string

   $userid = $_REQUEST['userid'];

   $firstname = $_REQUEST['firstname'];

   $lastname = $_REQUEST['lastname'];

   $address = $_REQUEST['address'];

    $email = $_REQUEST['email'];

    $phone = $_REQUEST['phone'];

     $password = $_REQUEST['password'];
     $tquestion = $_REQUEST['tquestion'];
    $tanswer = $_REQUEST['tanswer'];

   echo("$lastname<br>");

   echo("$firstname<br>");

   

      $query = "INSERT INTO `login_tbl` ( `userid`,`password`,`firstname`, `lastname`, `address`, `email`, `phone`, `testquestion`, `testanswer` )

         VALUES ('$userid', '$password','$firstname', '$lastname', '$address', '$email', '$phone', '$tquestion', '$tanswer')";

 

 

   // save the info to the database

   $results = mysql_query( $query );

 

   // print out the results

   if( $results )

   {

      echo( "Successfully saved the entry." );

   }

   else

   {

      echo( "Trouble saving information to the database: ");

   }

   

?>

 

</body>

</html>
