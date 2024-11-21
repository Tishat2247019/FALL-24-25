<?php
if (isset($_GET["gender_input"])) {  
    $gender = $_GET["gender_input"];
    echo "You selected " . $gender . "<br>";
} else {
    echo "At least one gender must be selected";
}
?>
