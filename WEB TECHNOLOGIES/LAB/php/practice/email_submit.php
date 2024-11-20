<?php

$email_form = $_GET['email'];
echo''. $email_form .'';
$validate = ".com";
$email_length = strlen($email_form);

$position1 = strrpos($email_form, $validate);
$position2 = strrpos($email_form, "@");
echo "<br>";
 if ($position1 == null || $position2 == null || $position1 < ($email_length - 4)) {
    echo "this is not a valid email";
 }

?>