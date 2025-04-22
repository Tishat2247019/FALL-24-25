<?php

session_start();
// echo $_SESSION["status"];

    if(!(isset($_SESSION["status"]))){
    header("location: login.html");
    }

?>

<html>
    <head>
        <title>home</title>
    </head>
    <body>
            <?php  echo "hello, {$_SESSION["username"]}" ?>
        <h1>this is home page</h1>
        <a href="logout.php">logout</a>
    </body>
</html>
