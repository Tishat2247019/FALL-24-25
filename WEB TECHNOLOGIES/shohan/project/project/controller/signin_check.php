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
        $login_type = login($username, $password);
        if($login_type == false){
            echo "<h3>Invalid Username and Password</h3>";  
        }
        else{
            $_SESSION['status'] = true;
            if($login_type['type'] == 'User'){
                // echo "hello user";
            header("location:../view/dashboard/user_menu.php?id={$login_type['user_id']}");
            }
            else if($login_type['type'] == 'Advertiser'){
                // echo "hello advertiser";
            header("location:../view/dashboard/advertiser_menu.php?id={$login_type['user_id']}");
            }
            else{
            header("location:../view/dashboard/admin_menu.php?id={$login_type['user_id']}");
            }
        }
    }

}
else{
    header("location:../signin/signin.html");
}

?>