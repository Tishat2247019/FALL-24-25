<?php
session_start();
require_once('../../model/usermodel.php');
    $errors = [];

    $password = trim($_POST["password"]);
    $confirm_password = trim($_POST["confirm_password"]);
    $name = trim($_POST["name"]);
    $email = trim($_POST['email']);
    
    
    function check_empty($name, $email, $password, $confirm_password, &$errors){
        if(empty($name) || empty($email) || empty($password) || empty($confirm_password) || !isset($_POST['type'])){
        $errors[]="Input fields can not be emtpy";
    }
        }

    function check_username($name, &$errors){
        if(strlen($name) < 6 ){
            $errors[] = "Username length should be at least 6";
        }
        if(strpos($name, " ")){
            $errors[] = "Username Can not have a middle space";
        }
        if(!ctype_alpha($name)){
            
            $errors[] = "Username Can not contain numbers";
        }
    }


    function check_password($password,$confirm_password, &$errors){
        if(strlen($password) < 6){
            $errors[] = " Password length should be at least 6";
        }
        if($password !== $confirm_password){
            $errors[] = " Password and confirm password does not match";
        }
    }

    function check_email($email, &$errors){
        $validate1 = strpos($email, ".com");
        $validate2 = strpos($email, "@");
            if($validate1 == null || $validate1 < strlen($email) - 4 || (strlen($email) - $validate2) < 5){
            $errors[] =  "Please enter a valid email";
            } 
    }

    check_empty($name, $email, $password, $confirm_password, $errors);
    check_username($name, $errors);
    check_password($password,$confirm_password, $errors);
    check_email($email, $errors);

    if(count($errors) > 0){
        foreach($errors as $error){
        echo $error;
             }
         }
    else{   
    $type = $_POST['type'];

     $addUser = addUser($name, $password, $email, $type);
     if($addUser){
        // header("location:../../view/opi_features/auth_feature/signin.html");
        echo "success";
     }
     else{
        // header("location:../../view/opi_features/auth_feature/signup.html");
        echo "error";
     }

}


?>