<?php 

$file = fopen("check.txt", "r");

echo fread($file,filesize("check.txt"));


fclose($file);


?>