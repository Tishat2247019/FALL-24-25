<?php

$my_file = "new.json";
if(file_exists($my_file)){
    $json_data = file_get_contents($my_file);
    $json_array = json_decode($json_data, true); #to associative array

    if(!is_array($json_array)){
        $json_array = [];

}}
else{
    $json_array = [];
}

$data_to_be_write = array("name" => "tishat", "age" => "20");
$json_array[] = $data_to_be_write;
$php_to_json = json_encode($json_array);
file_put_contents($my_file, $php_to_json);
?>