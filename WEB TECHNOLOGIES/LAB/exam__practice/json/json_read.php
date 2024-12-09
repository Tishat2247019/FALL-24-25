<?php

// $json_format = file_get_contents("./file.json");
$json_format = file_get_contents("./json_write.json");
$php_format = json_decode($json_format, true);
echo $json_format;
echo "<br>";
var_dump( $php_format);

file_put_contents("new.txt", "asdf");

foreach( $php_format as $i ) {
    foreach( $i as $k => $v ) {
        echo "". $k ."  ". $v ."<br>";
    }
}
?>