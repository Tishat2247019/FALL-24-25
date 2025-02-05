<?php
require_once("../../../model/usermodel.php");
$idd = $_REQUEST['id'];
$row = user_info($idd);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
    <link rel="stylesheet" href="../../../asset/css/opi_css_files/view_profile.css">
</head>
<body>
    <div class="container">
        <h1>View Profile</h1>
        <section class="profile-details">
            <div>
            <h2>Basic Profile Details</h2>
            <p><b>Name:</b> <?php echo $row['username']?></p>
            <p><b>Email:</b> <?php echo $row['email']?></p>
            <p><b>Password:</b> <?php echo $row['password']?></p>
            <p><b>Status:</b> <?php echo $row['status']?></p>
            <p><b>Saved Ads:</b> 15</p>
            </div>
            <div>
                <img src="../../../asset/images/profile_pics/<?php echo $row['profile_pic']?>" alt="">
            </div>
            
        </section>
        
        <section class="recent-activities">
            <h2>Recent Activities</h2>
            <ul>
                <li>Viewed ad: <b>"Luxury Apartment in Dhaka"</b></li>
                <li>Added <b>"Used iPhone 12"</b> to wishlist</li>
                <li>Removed <b>"Old Sofa Set"</b> from wishlist</li>
                <li>Viewed ad: <b>"Affordable Laptop for Sale"</b></li>
            </ul>
        </section>
        <section align="center" class="backbutton">
            <a href="../menu/user_menu.php?id=<?php echo $idd; ?>">Go Back</a>
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