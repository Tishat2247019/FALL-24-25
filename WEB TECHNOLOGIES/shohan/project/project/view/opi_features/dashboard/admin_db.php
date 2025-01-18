<?php
session_start();
require_once("../../../model/usermodel.php");
require_once("../../../model/admodel.php");
if($_SESSION['status'] == true){
$idd = $_REQUEST['id'];
$user_info = user_info($idd);
$name = $user_info['username'];
$result = show_ads();
$num_of_ads = mysqli_num_rows($result);

$result1=show_users('Active');
$num_of_active_users = mysqli_num_rows($result1);

$result2=show_users('Inactive');
$num_of_inactive_users = mysqli_num_rows($result2);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../asset/css/opi_css_files/admin_db.css">
    <link rel="icon" type="image/x-icon" href="../../../asset/images/logo/ad.svg">
    <title>Admin Dashboard</title>

</head>
<body>
    <div class="main_container">
        <div class="container">
            <header class="header">
                <div class="logo_container">
                    <img src="../../../asset/SVG/adventure.svg" alt="adventure logo" height="50px">
                    
                </div>
            </header>
            <div class="welcome_menu">
                <h1>Admin's Dashboard</h1>
            </div>
            <div class="welcome_admin">
                <h2>Hello, <span class="adminname"><?php echo $name; ?></span>!</h2>
                <div class="dashboard">
                    <div class="section">
                        <h2>Total Ads</h2>
                        <p><?php echo $num_of_ads; ?></p>
                    </div>
                    <div class="section">
                        <h2>Active Users</h2>
                        <p><?php echo $num_of_active_users; ?></p>
                    </div>
                    <div class="section">
                        <h2>Inactive Users</h2>
                        <p><?php echo $num_of_inactive_users; ?></p>
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
                <section align="center" class="backbutton">
            <a href="../menu/admin_menu.php?id=<?php echo $idd ?>">Go Back</a>
        </section>
            </div>

            <footer>
        <div class="footer-container" align="center">
            <div class="footer-section">
                <h4>More from Us</h4>
                <ul>
                    <li><a href="">Our Portfolio</a></li>
                    <li><a href="">Success Stories</a></li>
                    <li><a href="">Partners & Affiliates</a></li>
                    <li><a href="">Subscribe for Updates</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Help & Support</h4>
                <ul>
                    <li><a href="">FAQs</a></li>
                    <li><a href="">Stay Safe</a></li>
                    <li><a href="">Contact Us</a></li>
                    <li><a href="">Report an Issue</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>About ADVenture</h4>
                <ul>
                    <li><a href="">About Us</a></li>
                    <li><a href="">Meet the Team</a></li>
                    <li><a href="">Careers</a></li>
                    <li><a href="">Terms and Conditions</a></li>
                    <li><a href="">Privacy policy</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Guidelines</h4>
                <ul>
                    <li><a href="">Getting Started</a></li>
                    <li><a href="">Best Practices</a></li>
                    <li><a href="">Do's and Don'ts</a></li>
                </ul>
                <div class="social-icons">
                    <a href="https://www.facebook.com/"><img src="../../../asset/images/opi_images/features_pics/fb-icon.png"
                            alt="Facebook"></a>
                    <a href="https://x.com/?lang=en"><img src="../../../asset/images/opi_images/features_pics/x-icon.png"
                            alt="Twitter"></a>
                    <a href="https://www.tiktok.com/login"><img src="../../../asset/images/opi_images/features_pics/tiktok-icon.png"
                            alt="TikTok"></a>
                    <a href="https://www.youtube.com/"><img src="../../../asset/images/opi_images/features_pics/youtube-icon.png"
                            alt="YouTube"></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025. All rights reserved. ADVenture</p>
        </div>
    </footer>

</body>
</html>

<?php }
else{
    header("locatoin:../auth_feature/signin.html");
    // echo "hello";
} ?>