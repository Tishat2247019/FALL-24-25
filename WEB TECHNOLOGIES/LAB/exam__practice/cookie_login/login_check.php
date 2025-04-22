<?php
session_start();
if(isset($_POST['submit'])){
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    if (empty($username) || empty($password)){
        echo "Username or password is emtpy";
    }
    elseif($username !== $_SESSION['username'] || $password !== $_SESSION['password']){
        echo "Invalid Username or password";
    }
    else{
        

        setcookie('flag', 'true', time() + 3600, "/");
        header("location:home.php");
    }
}
else{
    header('location:login.html');
}


?>