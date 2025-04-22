<?php
session_start();
if($_SESSION['status'] == true){
$idd = $_POST['id'];
$new_pass = $_POST['password'];
        $conn = mysqli_connect('127.0.0.1', 'root', '', 'check');
        // var_dump($conn);
        $sql = "UPDATE first_check set password = '$new_pass' where id = '$idd'";
        $result = mysqli_query($conn, $sql);
        if($result){
            echo "Ok";
        }
        else{
            echo "not ok";  
        }

}

else{
    header("location:login.html");  
}

?>