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
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../../asset/css/admin_db.css">
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
                <h1>Admin's Dashboard</h1>
            </div>
            <div class="welcome_admin">
                <h2>Hello, <span class="adminname">Admin</span>!</h2>
                <div class="dashboard">
                    <div class="section">
                        <h2>Total Ads</h2>
                        <p>120</p>
                    </div>
                    <div class="section">
                        <h2>Active Users</h2>
                        <p>85</p>
                    </div>
                    <div class="section">
                        <h2>Pending Ads</h2>
                        <p>15</p>
                    </div>
                    <div class="section">
                        <h2>Reported Ads</h2>
                        <p>5</p>
                    </div>
                </div>
                <div class="section">
                    <h2>Generate Reports</h2>
                    <a href="" class="generate-report">Generate</a>
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