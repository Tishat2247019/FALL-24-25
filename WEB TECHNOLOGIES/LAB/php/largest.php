<?php

$num1 = 10;
$num2 = 21;
$num3 = 20;

$larg1;
if ($num1 > $num2) {
    if ($num1 > $num3){
        echo "number 1 is largest";
    }
    else{
        echo "number 3 is largest";
    }
}
else{
    if($num2 > $num3){
        echo "number 2 is largest";
    }
    else{
        echo "number 3 is largest";
    }
    
}

echo "<br>";

if ($num1 > $num2 && $num1 > $num3){
    echo "number 1 is the greatest";
}
else if( $num2 > $num1 && $num2 > $num3){
    echo "number 2 is the greatest";
}
else{
    echo "number 3 is the gretest";
}

?>