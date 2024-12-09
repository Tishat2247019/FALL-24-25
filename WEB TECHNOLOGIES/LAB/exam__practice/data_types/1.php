<?php

// echo 0xb;
// echo 077;
// echo 0b1010;

$my_array = array("yet", "bal", "bet");
foreach($my_array as $v){
    // if(strpos($v, "e")){
    //     echo $v;
    // }
    echo strpos($v, "e");
}

$a = 10;
echo $a;
print($a);
var_dump($a);
print_r($a);
echo "<br>";

$opi = "chummi";
$opi2 = "khabo";
var_dump($opi);
print_r($opi2);
echo "<br>";

$my_arrya = array(1, 2, 3, 4, 5);
var_dump($my_arrya);
echo "<br>";
print_r($my_arrya);
echo "<br>";

$my_opi = array("chummi" => "jan", "etto"=>"boro boro");

foreach($my_opi as $key => $value){
    echo $key . " " . $value . " <br>";
}




?>