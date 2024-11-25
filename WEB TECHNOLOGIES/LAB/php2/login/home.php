<?php
session_start();
if (!isset($_SESSION["status"])) {
    header("location:login.html");
}

?>

<html>
    <head>
        <title>
            Home
        </title>
        
    </head>

    <body>
        <h1>Welcom to home page</h1>
        <a href="./logout.php">Logout</a>
    </body>
</html>