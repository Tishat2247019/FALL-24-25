<?php
session_start();
if(isset($_POST["submit"])){
    $flag_name = false;
    $flag_email = false;
    $flag_pass = false;
    function name_check(){
      
        $name_var = $_POST['username'];

        $name_validation = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.- ";
        $flag = true;
    
            for($i = 0; $i < strlen($name_var); $i++){
                for($j = 0; $j < strlen($name_validation); $j++){
                    if($name_var[$i] == $name_validation[$j]){
                        $flag = true;
                        break;
                    }
                    else{
                        $flag = false;
                    }
                }
                if($flag == false){
                    break;
                }
            }
    
        if(!isset($_POST['username'])){
            echo "<h1>Username can not be empty </h1>";
        }
        else if(strpos($name_var, " ") == null){
            echo "<h1>Username must conatain at least two words </h1>";
        }
        else if(!ctype_alpha($name_var[0])){
            echo "<h1>Username must start with a letter  </h1>";
        }
        else if(!$flag){
            echo "<h1> Not a valid Username </h1>";
        }
        else{
            // echo "<h1>Your username is " . $name_var ."</h1>";
            // $flag_name = true;
            $GLOBALS["flag_name"] = true;
        }
    }

    function email_check(){
        $email_var = $_POST["email"];
$validate1 = strpos($email_var, ".com");
$validate2 = strpos($email_var, "@");
if($validate1 == null || $validate1 < strlen($email_var) - 4 || (strlen($email_var) - $validate2) < 5){
    echo "<h1>This is not a valid email</h1>";
} 
else{
    // echo "<h1>Your email is " . $email_var . "</h1>";
    $GLOBALS["flag_email"] = true;

}

    }

    function pass_check(){

        $pass_trim = trim( $_POST['password']);
        $conpass_trim = trim( $_POST['confirm_password']);
        $pass = $_POST['password'];
        $conpass = $_POST['confirm_password'];

        if(empty($pass_trim) || empty($conpass_trim))
        {
            echo "Passwords input field can not be empty";
        }
        else if($pass !== $conpass_trim){
            echo "Password and Confirm Password does not match";
        }
        else{
            $GLOBALS["flag_pass"] = true;
        }
    }

    name_check();
    email_check();
    pass_check();

    if($flag_email && $flag_name && $flag_pass){
        $_SESSION["username"] = $GLOBALS["namevar"];
        $_SESSION["password"] = $GLOBALS["password"];
        header("location:login.html");
    }
}

else{
    header("location:reg.html");
}

?>