<?php

$name_form = $_GET["name"];
$check = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.";
$flag = true;


for ( $i = 0; $i < strlen($name_form); $i++ ){
    for ($j = 0; $j < strlen($check); $j++){
        if($name_form[$i] == $check[$j]){
            $flag = true;
            break;
        }
        else{
            $flag = false;
            //break;
        }
    }
    if ($flag == false){
        break;
    }
}

if (empty($name_form)){
    echo "<h1>The username can't be empty </h1>";
}
else if (strlen($name_form) <2){
    echo "<h2>Username must be at least of 2 words long <br></h2>";
}
else if(is_numeric($name_form[0])){
    echo "<h2> Username must start with a letter</h2>";
}
else if($flag == false){
    echo "Username can not contain forhibited characters";
}
else{
    // echo "<h1> Your usename is : " . $name_form . "</h1>";
    echo "<h1> Your usename is : <i> {$name_form}</i></h1>";
}



?>