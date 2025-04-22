<?php
session_start();
require_once("../../model/usermodel.php");
if($_SESSION['status'] == true){
$idd = $_REQUEST['id'];
$user_info = user_info($idd);
$name = $user_info['username'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="../../asset/css/user_db.css">
</head>
<body>
    <div class="main_container">
        <div class="container">
            <header class="header">
                <div class="logo_container">
                    <img src="../../asset/images/SVG/adventure.svg" alt="adventure logo" height="40px">
                </div>
            </header>
            <div class="welcome_menu">
                <h1>User's Dashboard</h1>
            </div>
            <div class="welcome_user">
                <h2>Hello, <span class="username">user</span>!</h2>
                <div class="dashboard"></div>
                <div class="section">
                    <h2>Personalized Ads</h2>
                    <p>Your personalized ads will be displayed here based on your interests and behavior.</p>
                </div>

                <div class="section">
                    <h2>Saved Ads</h2>
                    <ul>
                        <li><a href="">Saved Ad 1</a></li>
                        <li><a href="">Saved Ad 2</a></li>
                        <li><a href="">Saved Ad 3</a></li>
                    </ul>
                </div>

                <div class="section">
                    <h2>Recently Viewed Ads</h2>
                    <ul>
                        <li><a href="">Viewed Ad 1</a></li>
                        <li><a href="">Viewed Ad 2</a></li>
                        <li><a href="">Viewed Ad 3</a></li>
                    </ul>
                </div>

                <div class="section">
                    <h2>Active Preferences</h2>
                    <p>Your active preferences include categories like technology, fashion, and sports.</p>
                </div>

                <div class="section">
                    <h2>Notifications</h2>
                    <p>You have new notifications regarding your recent activity.</p>
                </div>
            </div>
            <footer class="footer">
                <p>footer</p>
            </footer>
        </div>
</body>
</html>

<?php }
else{
    header("locatoin:../auth_feature/signin.html");
    // echo "hello";
} ?>