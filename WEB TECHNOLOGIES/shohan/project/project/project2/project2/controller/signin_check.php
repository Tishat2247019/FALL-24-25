<?php
session_start();
require_once('../model/usermodel.php');
if(isset($_POST['login'])){
    $username = trim($_POST["username"]);
    $password = trim($_POST["password"]);
    if(empty($username) || empty($password)){
        echo "<h3>Username or Password is emtpy</h3>";
    }
    else{
        $login_status = login($username, $password);
        if($login_status == false){
            echo "<h3>Invalid Username and Password</h3>";  
        }
        else{
            $_SESSION['status'] = true;
            if($login_status['type'] == 'User'){
                
            header("location:../view/menu/user_menu.php?id={$login_status['user_id']}");
            }
            else if($login_status['type'] == 'Advertiser'){
               
            header("location:../view/menu/advertiser_menu.php?id={$login_status['user_id']}");
            }
            else{
            header("location:../view/menu/admin_menu.php?id={$login_status['user_id']}");
            }
        }
    }

}
else{
    header("location:../signin/signin.html");
}

?>