<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES['filename']['name']);
// echo $target_file;

if(move_uploaded_file($_FILES['filename']['tmp_name'], $target_file)){
    echo $_FILES['filename']['name'] . " has uploaded successfully";
}
else{
    echo "not ok";
}


?>