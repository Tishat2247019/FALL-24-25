<?php

$file = fopen("myfile.txt", "a+");

//Output lines until EOF is reached
// while(! feof($file)) {
//   $line = fgets($file);
//   echo $line. "<br>";
// }

echo fread($file,filesize("myfile.txt"));
$newline = "\nI want to kiss opi\n";
$newline1 = "I want to kiss opi\n";
fwrite($file, $newline);
fwrite($file, $newline1);

fclose($file);
?>

