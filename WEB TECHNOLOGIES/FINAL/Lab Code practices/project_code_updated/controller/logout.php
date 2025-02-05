<?php
session_start();
unset($_SESSION['status']);
header("location: ../signin/signin.html");

?>