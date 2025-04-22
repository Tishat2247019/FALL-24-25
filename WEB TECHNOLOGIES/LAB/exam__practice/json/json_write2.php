<?php
$myfile = "new2.json";

if(file_exists($myfile))
{
    $json_data = file_get_contents($myfile);
    $json_to_php_array = json_decode($json_data, true);

    print_r($json_to_php_array);

    if(!is_array($json_to_php_array)){
        $json_to_php_array = [];
    }
}
else{
    $json_to_php_array = [];
}

$data_to_be_write = array("name" => "towsif", "age" => "22");
$json_to_php_array[] = $data_to_be_write;
$php_to_array_to_json = json_encode($json_to_php_array, JSON_PRETTY_PRINT);
file_put_contents($myfile, $php_to_array_to_json);


?>