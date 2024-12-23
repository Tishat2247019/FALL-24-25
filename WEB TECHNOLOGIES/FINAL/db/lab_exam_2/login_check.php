<?php
session_start();
if(isset($_POST['login'])){
    $id = trim($_POST["id"]);
    $password = trim($_POST["password"]);
    if(empty($id) || empty($password)){
        echo "<h3>Username or Password is emtpy</h3>";
        
    }
    else{
        $conn = mysqli_connect('127.0.0.1', 'root', '', 'check');
        // var_dump($conn);
        $sql = "select * from first_check where id = '$id' and password = '$password'";
        $result = mysqli_query($conn, $sql);
        $count = mysqli_num_rows($result);

        if($count == 1){
            $_SESSION['status'] = true;
            header("location:user_home.php?id={$id}");
        }
        
        else{
            echo "<h3>Invalid Username and Password</h3>";
            // break;  
        }
    }

    
    

}
else{
    header("location:login.html");
}

?>