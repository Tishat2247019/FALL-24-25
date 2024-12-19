<?php

$email = $_GET["email_input"];
$comcheck = strpos($email, ".com");
echo $comcheck . "<br>";

if(empty($email)){
    echo "Email can not be emtpy";
}
else if($comcheck == null){
    echo "not a valid email";
}
else{
    echo "Your email is " . $email . "<br>";
}

?>