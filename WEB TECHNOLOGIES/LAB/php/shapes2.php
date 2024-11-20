<?php

$my_2d_array = array(array(1, 2, 3, "A"),
                     array(1, 2, "B", "C"),
                     array(1, "D", "E", "F"));

foreach($my_2d_array as $array_elem){
    foreach($array_elem as $elem){
        echo "".$elem." ";
    }
    echo "<br>";
}

// echo count($my_2d_array);

echo "<br>";


for($i= 0; $i<count($my_2d_array); $i++){
    $col = count($my_2d_array[$i]);
    for($j = 0; $j < $col - $i - 1; $j++){
        echo "".$my_2d_array[$i][$j]. " ";
    }
    echo "<br>";
}

for($i= 0; $i<count($my_2d_array); $i++){
    $col = count($my_2d_array[$i]);
    for($j = $col - $i - 1; $j < $col; $j++){
        echo "".$my_2d_array[$i][$j]. " ";
    }
    echo "<br>";
}

?>