<?php
session_start();
if($_SESSION['status'] == true){

// $idd = $_REQUEST['id'];
$idt =  $_REQUEST['idt'];
require_once("../model/usermodel.php");

$row = user_info($idt);
// $name = $_REQUEST['username'];
// $email = $_REQUEST['email'];
// $type = $_REQUEST['type'];
// $status = $_REQUEST['status'];

$name = $row['username'];
$email = $row['email'];
$type = $row['type'];
$status = $row['status'];

$errors = [];

// $destination = $_REQUEST['destination'];

$new_name = (empty(trim($_POST['new_username']))) ? $name : trim($_POST['new_username']);
$new_email = ( empty(trim($_POST['new_email']))) ? $email : trim($_POST['new_email']);
$new_type = ( empty(trim($_POST['new_type']))) ? $type : $_POST['new_type'];
$new_status = ( empty(trim($_POST['new_status'])))  ? $status : $_POST['new_status'];



function check_empty($name, $email, $password, $confirm_password, &$errors){
    // global $errors;
    if(empty($name) || empty($email) || empty($password) || empty($confirm_password) || !isset($_POST['type'])){
    $errors[]="Input fields can not be emtpy";
        }
}

function check_username($new_name, &$errors){

    if(!empty(trim($new_name))){

        if(strlen($new_name) < 6 ){
            $errors[] = "Username length should be at least 6";
        }
        if(strpos($new_name, " ")){
            $errors[] = "Username Can not have a middle space";
        }
        if(!ctype_alpha($new_name)){
            
            $errors[] = "Username Can not contain numbers";
        }
    }
}



function check_email($new_email, &$errors){
    if(!empty(trim($new_email))){
    $validate1 = strpos($new_email, ".com");
    $validate2 = strpos($new_email, "@");
        if($validate1 == null || $validate2 == null || $validate1 < strlen($new_email) - 4 || (strlen($new_email) - $validate2) < 6){
        $errors[] =  "Please enter a valid email";
        } 
    }
}

function check_type($new_type, &$errors){
    if(!empty(trim($new_type))){

    if($new_type != 'User'&& $new_type && $new_type != 'Advertiser' && $new_type != 'Admin'){
        $errors[] =  "Please enter a valid user type";
        // echo $new_type;
    }
}
}

function check_status($new_status, &$errors){
    if(!empty(trim($new_status))){
    if($new_status != 'Active' && $new_status != 'Inactive'){
        $errors[] =  "Please enter a valid user status";
    }
}
}



// check_empty($name, $email, $password, $confirm_password, $errors);
    check_username($new_name, $errors);
    // check_password($password,$confirm_password, $errors);
    check_email($new_email, $errors);
    check_type($new_type, $errors);
    check_status($new_status, $errors);

    if(count($errors) > 0){
        foreach($errors as $error){
            // echo $error;
            echo($error ."<br>" );
        }
    }
    else{

        $result = edit_user($idt, $new_name, $new_email, $new_type ,$new_status);

        if($result){
            echo "User {$idt}'s Information has been edited";
        }
        else{
            echo "There is some error.Can not Edit";
        } 
    }

}


else{
    header("location:../index.php");
}

?>

