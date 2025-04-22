<?php 

$file = fopen("check.txt", "r+");

echo fread($file,filesize("check.txt"));
fwrite($file, "My name is tishat \n");


fclose($file);


?>