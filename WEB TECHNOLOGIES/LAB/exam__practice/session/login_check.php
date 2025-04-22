<?php
session_start();
if(isset($_POST['submit'])){

    $username = trim($_POST["username"]);
    $password = trim($_POST["password"]);
    if(empty($username) || empty($password)){

        echo "username or password is emtpy.Please fill all the input field";
    }
    else if($username !== $_SESSION['username'] || $password !== $_SESSION['password']){
        echo "Invalid username or password";
    }
    else{
        
        setcookie("flag", "true", time()+ 3600, "/");
        // $_SESSION['flag'] = true;
        header("location:home.php");
    }
}
else{
    header("location:login.html");
}

?>