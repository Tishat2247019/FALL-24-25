<?php


if(isset($_POST["bg_input"])){
    $bg = $_POST["bg_input"];
    echo "you selected " . $bg."";
}
else{
    echo "Blood group must be selected";;
}

?>