<?php

    $conn = mysqli_connect('127.0.0.1', 'root', '', 'check');
    // var_dump($conn);
    $sql = "select * from first_check";
    $result = mysqli_query($conn, $sql);
    // var_dump($result);
    // $row = mysqli_fetch_assoc($result);
    // print_r($row);
    // for($i=0; $i<mysqli_num_rows($result); $i++){
    //     $row = mysqli_fetch_assoc($result);
    //     echo "<br>";
    //     print_r($row);
    // }

    while($row = mysqli_fetch_assoc($result)){
        echo "<br>";
        echo $row['username'];
    }

    $sql = "insert into first_check VALUES('oi', '110918', '34', 'oi@aiub.edu')";
    if(mysqli_query($conn, $sql)){
        echo "Success";
    }else{
        echo "Error";
    }
?>