<?php
session_start();
if(isset($_POST["submit"])){// var_dump($_POST);
$username = $_REQUEST["username"];
$password = $_POST["password"];

$trim_username =trim( $_REQUEST["username"]);
if ($username == null ||empty($trim_username)){
    echo "empty username / passowrd";
}
else if($trim_username == $password){
    $_SESSION["status"] = true;
    header('location:home.php'); 

}
else{
    echo "Invalid user";
}


// echo $trim_username;
// echo "<br>";    
// echo $username;
}
else{
    header("location:login.html");
}
?>