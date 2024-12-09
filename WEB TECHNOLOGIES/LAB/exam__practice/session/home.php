<?php
session_start();
if(!isset($_COOKIE['flag'])){
    // echo "hasdf";
   header('location:login.html');
}
else{

?>
 <html>
    <head>

    </head>
    <body>
        <h1><?php echo $_SESSION['username']; ?></h1>
        <a href="logout.php">logout</a>
    </body>
 </html>

 <?php
}   

?>