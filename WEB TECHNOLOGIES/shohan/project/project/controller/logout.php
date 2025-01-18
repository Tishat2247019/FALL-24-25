<?php
session_start();
unset($_SESSION['status']);
$_SESSION['status'] = false;
header("location: ../index.php");

?>