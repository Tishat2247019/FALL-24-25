<?php
session_start();
require_once('../model/usermodel.php');
if(isset($_POST['login'])){
    $id = trim($_POST["id"]);
    $password = trim($_POST["password"]);
    if(empty($id) || empty($password)){
        echo "<h3>Username or Password is emtpy</h3>";
    }
    else{
        $login_status = login($id, $password);
        if($login_status == false){
            echo "<h3>Invalid Username and Password</h3>";  
        }
        else{
            $_SESSION['status'] = true;
            if($login_status == 'User'){
                // echo "hello user";
            header("location:../view/dashboard/user_menu.php?id={$id}");
            }
            else if($login_status == 'Advertiser'){
                // echo "hello advertiser";
            header("location:../view/dashboard/advertiser_menu.php?id={$id}");
            }
            else{
            header("location:../view/dashboard/admin_menu.php?id={$id}");
            }
        }
    }

}
else{
    header("location:../signin/signin.html");
}

?>