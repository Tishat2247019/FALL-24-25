<?php
session_start();
require_once("../../../model/usermodel.php");
if ($_SESSION['status'] == true) {
    $idd = $_REQUEST['id'];
    $user_info = user_info($idd);
    $name = $user_info['username'];
    ?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../../asset/css/opi_css_files/admin_menu.css">
        <link rel="icon" type="image/x-icon" href="../../../asset/images/logo/ad.svg">
        <title>Admin Menu</title>
    </head>
    <body>
        <div class="main_container">
            <div class="container">
                <header class="header">
                    <div class="logo_container">
                        <img src="../../../asset/SVG/adventure.svg" alt="adventure logo" height="40px">
                    </div>
                </header>
                <div class="welcome_menu">
                    <h1>Welcome to the Admin Menu</h1>
                </div>
                <div class="welcome_admin">
                    <h2>Welcome, <span class="adminname"><?php echo $name; ?></span>!</h2>
                </div>
                <div class="menu_links">
                    <ul>
                        <li><a href="../dashboard/admin_db.php?id=<?php echo $idd; ?>">Dashboard</a></li>
                        <li><a href="../../tishat_features/manage_ads/manage_ad.php?id=<?php echo $idd; ?>">Manage Ads</a></li>
                        <li><a href="../../tishat_features/manage_users/view_users.php?id=<?php echo $idd; ?>">View Users</a></li>
                        <li><a href="../../tishat_features/manage_users/manage_users.php?id=<?php echo $idd; ?>">Manage Users</a></li>
                        <li><a href="../../tishat_features/manage_advertisers/view_advertisers.php?id=<?php echo $idd; ?>">View Advertisers</a></li>
                        <li><a href="../../tishat_features/manage_advertisers/manage_advertisers.php?id=<?php echo $idd; ?>">Manage Advertisers</a></li>
                        <li><a href="../../tishat_features/ad_analytics/ad_analytics.php?id=<?php echo $idd; ?>">Ad Analytics</a></li>
                        <li><a href="../flagged content/flag_con.php?id=<?php echo $idd; ?>">Flagged Content</a></li>
                        <li><a href="">Generate Reports</a></li>
                        <li><a href="">Change Password</a></li>
                        <li><a href="../../../controller/opi_controller/logout.php">Logout</a></li>
                    </ul>
                </div>
            </div>
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
                        <li><a href="">Privacy Policy</a></li>
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
                        <a href="https://www.facebook.com/"><img src="../../../asset/images/opi_images/features_pics/fb-icon.png" alt="Facebook"></a>
                        <a href="https://x.com/?lang=en"><img src="../../../asset/images/opi_images/features_pics/x-icon.png" alt="Twitter"></a>
                        <a href="https://www.tiktok.com/login"><img src="../../../asset/images/opi_images/features_pics/tiktok-icon.png" alt="TikTok"></a>
                        <a href="https://www.youtube.com/"><img src="../../../asset/images/opi_images/features_pics/youtube-icon.png" alt="YouTube"></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025. All rights reserved. ADVenture</p>
            </div>
        </footer>
    </body>
    </html>

    <?php
} else {
    header("Location:../auth_feature/signin.html");
}
?>
