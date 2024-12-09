<?php
session_start();
$username = $_POST['username'];
$email = $_POST['email'];
$number = $_POST['number'];
$id = $_POST['id'];
$dept = $_POST['department'];
$password = $_POST['password'];
$con_password = $_POST['confirm_password'];

$username = trim($username);
$email = trim($email);
$number = trim($number);
$id = trim($id);
$dept = trim($dept);
$password = trim($password);
$con_password = trim($con_password);

if (empty($username) || empty($email) || empty($number) || empty($id) || empty($dept) || empty($password) ||
 empty($con_password)){
    echo "input fileds can not be empty";
}
else if ($password !== $con_password){
    echo "password and confirm password does not match";
}
else{
   $store_array = array("username" => $username, "email" => $email, "number" => $number, "id" => $id, "dept"=>$dept, "password" => $password);
  
    //  setcookie("username", $username, time() + 38000, "/"); 
    // setcookie("passowrd", $password, time() + 38000, "/"); 
    // setcookie("username", $username, time() + 38000, "/"); 
   
    $_SESSION = $store_array; 
    // foreach ($_SESSION as $key => $value) {
    //     echo $key." ".$value."";
    //     echo "<br>";
    // }
    header("location:login.html");
}

?>

