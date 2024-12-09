<?php
$x = 10;
$y = 10;

function check(){
    $x = 11;
   // global $x;
   echo "the vluue of local variable x is ", $x, "<br>";
    echo "the value of x is " , $GLOBALS['x'];
}
check();
echo "<br>";    
echo "The value of x outside the function is $x";

?>