<?php

$int = 1;
$zero = 0;
echo $int;
echo var_dump($int, $zero);
echo "<br>";

$floatt = 3.5;
echo $floatt;
var_dump($floatt);; // we can use var_dump function to display the value of the variable wtth the data type;

echo var_dump($floatt);

$double = 8998.88888888; // in php float and double is same, 8.88 is float 8888.8888888 is also float
echo $double;
echo var_dump($double);

echo "<br>";
$booli = true;
$no = null;
var_dump($booli, $no); // null variable will display NULL in var_dump

$name = "tishat";
$name2 = 'opi';
var_dump($name, $name2);

$my_array = array(1, 2, 3, 4, 5);
var_dump($my_array);
echo "<br>";

$my_array2 = array("tishat kiss" => "opi", "opi kiss" => "tishat", null);
//$my_array2 = array("tishat kiss" => "opi", "opi kiss" => "tishat",  "ok" => null);
var_dump($my_array2);
echo "<br>";
$my_2d_array = array(
    array(1,2, 3, 4, 5),
    array(6, 7, 8, 9, 10)
);
var_dump($my_2d_array);
echo "<br>";
for ($i = 0; $i < count($my_array); $i++){
    echo $my_array[$i];
}

$i = 0;
while ($i < count($my_array)){
    echo $my_array[$i];
    $i++;
}
$i = 0;
do {
    echo $my_array[$i];
    $i++;
}
while ($i < count($my_array));

foreach($my_array as $i){
    echo $i;
}

// for ($i = 0; $i < count($my_array2); $i++){
//     echo $my_array2[$i] ;
// }
echo "<br>";

foreach($my_array2 as $key => $value){
    echo $key . " ". $value ."<br>";
}

for ($i = 0; $i < count($my_2d_array); $i++){
    for ($j  = 0; $j < count($my_2d_array[$i]); $j++){
        echo $my_2d_array[$i][$j];
    }
    echo "<br>";
}


foreach($my_2d_array as $elem){
    foreach($elem as $elem2){
        echo $elem2;
    }
    echo "<br>";
}

?>  