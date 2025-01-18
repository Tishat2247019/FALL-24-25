<?php

function getConnection(){
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'check');
    return $conn;
}


function login($username, $password){
    $conn = getConnection();
    $sql = "select * from users where username = '{$username}' and password = '{$password}'";
    $result = mysqli_query($conn,$sql);
    $user = mysqli_fetch_assoc($result);
    if(isset($user['type'])){
        return $user;
    }
    else{
    return false;
    }
    // $result = $user['type'];
    // return $result;
    // $count = mysqli_num_rows($result);
    // if($count == 1){
    //     return true;
    // }
    // else{
    //     return false;
    // }
}
function addUser($name, $password, $email, $type, $status = "Active"){
    $conn = getConnection();
    $sql = "insert into users (username, password, email, type, status) values ('$name', '$password', '$email', '$type', '$status')";
    $result = mysqli_query($conn, $sql);
    if($result){
        return true;
    }
    else{
        return false;
    }
}

function user_info($id){
    $conn = getConnection();
    $sql = "select * from users where user_id = '$id'";
   
    $result = mysqli_query($conn, $sql);
    // var_dump($result);

    $row = mysqli_fetch_assoc($result);
        return $row; 
    
}


function show_users($status_filter='All'){
    $conn = getConnection();
    if ($status_filter === 'Active') {
        $sql = "select * from users where status = 'Active'";
    } elseif ($status_filter === 'Inactive') {
        $sql = "select * from users where status = 'Inactive'";
    } else {
        $sql = "select * from users";
    }
    $result = mysqli_query($conn, $sql);
    return $result;
    // while($row = mysqli_fetch_assoc($result)){
    //     echo "<br>";
    //     print_r($row);
    // }
}


function delete_user($idt){
    $conn = getConnection();
    $sql = "DELETE FROM users WHERE user_id='$idt'";
    $result = mysqli_query($conn, $sql);
    if($result){
        return true;
    }
    else{
        return false;
    }
}

function edit_user($idt, $name, $email, $type, $status){
    $conn = getConnection();
    $sql = "UPDATE users
            SET username = '$name', email = '$email', type = '$type', status = '$status'
            WHERE user_id = $idt";
    $result = mysqli_query($conn, $sql);
    if($result){
        return true;
    }
    else{
        return false;
    }
}

// show_users();   

?>
