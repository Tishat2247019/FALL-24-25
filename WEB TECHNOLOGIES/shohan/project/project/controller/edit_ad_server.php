<?php
session_start();
if($_SESSION['status'] == true){

// $idd = $_REQUEST['id'];
$idt =  $_REQUEST['idt'];
// require_once("../model/usermodel.php");
require_once("../model/admodel.php");

    $row = ad_info($idt);

    // $ad_id = $ad_info['id'];
    // $adv_id = $ad_info['user_id'];
    // $adv_info = user_info($adv_id);
    // $adv_name = $adv_info['username'];
    $description = $ad_info['ad_description'];
    $title = $ad_info['ad_title'];
    $phone = $ad_info['phone'];
    $email = $ad_info['email'];
    $price = $ad_info['price'];
    $category = $ad_info['category'];

$errors = [];


$new_description = (empty(trim($_POST['new_ad_description']))) ? $description : trim($_POST['new_ad_description']);
$new_title = ( empty(trim($_POST['new_ad_title']))) ? $title : trim($_POST['new_ad_title']);
$new_phone = ( empty(trim($_POST['new_phone']))) ? $phone : $_POST['new_phone'];
$new_email = ( empty(trim($_POST['new_email'])))  ? $email : $_POST['new_email'];
$new_price = ( empty(trim($_POST['new_price'])))  ? $price : $_POST['new_price'];
$new_category = ( empty(trim($_POST['new_category'])))  ? $category : $_POST['new_category'];


function check_email($new_email, &$errors){
    if(!empty(trim($new_email))){
    $validate1 = strpos($new_email, ".com");
    $validate2 = strpos($new_email, "@");
        if($validate1 == null || $validate2 == null || $validate1 < strlen($new_email) - 4 || (strlen($new_email) - $validate2) < 6){
        $errors[] =  "Please enter a valid email";
        } 
    }
}



function check_phone($new_phone, &$errors){
    if(!empty(trim($new_phone))){
    if(!is_numeric($new_phone)){
        $errors[] =  "Please enter a valid phone number";
    }
    
}
}

function check_price($new_price, &$errors){
    if(!empty(trim($new_price))){
    if(!is_numeric($new_price)){
        $errors[] =  "Please enter a valid price";
        }
    
    }
}





// check_empty($name, $email, $password, $confirm_password, $errors);
    // check_password($password,$confirm_password, $errors);
    check_email($new_email,$errors);
    check_phone($new_phone, $errors);
    check_price($new_price, $errors);

    if(count($errors) > 0){
        foreach($errors as $error){
            // echo $error;
            echo($error ."<br>" );
        }
    }
    else{

        $result = edit_ad($idt, $new_title, $new_description, $new_phone, $new_email, $new_price, $new_category);

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

