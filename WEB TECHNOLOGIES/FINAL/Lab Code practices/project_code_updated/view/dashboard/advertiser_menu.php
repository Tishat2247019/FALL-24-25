<?php
session_start();
require_once("../../model/usermodel.php");
if($_SESSION['status'] == true){
$idd = $_REQUEST['id'];
$user_info = user_info($idd);
$name = $user_info['name'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="signin.css">
    <link rel="icon" type="image/x-icon" href="../SVG/ad.svg">
    <title>Advertiser Menu</title>
</head>
<body>
    <div class="main_container">
        <div class="container">
            <div class="header">
                <div class="logo_container">
                    <img src="../../SVG/adventure.svg" alt="adventure logo" height="20px">
                </div>
            </div>
            <div class="left">
                <h1 align="center">Welcome to Advertiser Menu</h1>
                <h1 align="center">Welcome <?php echo $name. "!" ?></h1>
            </div>
            <div class="right">
                <a href="">Dashboard</a> <br>
                <a href="">Create AD</a> <br>
                <a href="">Manage Ad</a> <br>
                <a href="">Ad Analytics</a> <br>
                <a href="">View Profile</a> <br>
                <a href="">Edit Profile </a> <br>
                <a href="">Change Profile Photo</a> <br>
                <a href="">Change Password</a><br>
                <a href="../../controller/logout.php">Logout</a>
            </div>
        </div>
        <div class="footer">footer</div>
    </div>
    </div>
</body>
</html>

<?php }
else{
    header("locatoin:../../signin/signin.html");
} ?>