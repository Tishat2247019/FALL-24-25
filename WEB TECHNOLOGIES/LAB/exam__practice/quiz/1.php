<?php
$x=$y=13;

function fun(){
    $x=$y=2;
    $GLOBALS['x'];
    echo "x=$x y = $y";
}
fun();
fun();

echo "<br>";
if (7.5 === "7.5"){
    print "NI";
}
else{
    print "I";
}

echo "<br>";
print 17;
print 0x11;
print 011;

?>