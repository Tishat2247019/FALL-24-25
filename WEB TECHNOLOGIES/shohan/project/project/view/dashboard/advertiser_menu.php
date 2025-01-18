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
    <link rel="stylesheet" href="signin.css">
    <link rel="icon" type="image/x-icon" href="../SVG/ad.svg">
    <title>Advertiser Menu</title>
</head>
<body>
    <div class="main_container">
        <div class="container">
            <div class="header">
                <div class="logo_container">
                    <img src="../../asset/SVG/adventure.svg" alt="adventure logo" height="20px">
                </div>
            </div>
            <div class="left">
                <h1 align="center">Welcome to Advertiser Menu</h1>
                <h1 align="center">Welcome <?php echo $name. "!" ?></h1>
            </div>
            <div class="right">
                <a href="">Dashboard</a> <br>
                <a href="../shohan_features/creat_ad/ad.php?id=<?php echo $idd ?>">Create AD</a> <br>
                <a href="../shohan_featuers/manage_ads/manage_ad.php?id=<?php echo $idd ?>">Manage Ad</a> <br>
                <a href="../shohan_featuers/ad_analytics/ad.analytics.html?id=<?php echo $idd ?>">Ad Analytics</a> <br>
                <a href="../shohan_featuers/profile_advertiser/view_profile.php?id=<?php echo $idd ?>">View Profile</a> <br>
                <a href="../shohan_featuers/profile_advertiser/edit_profile.php?id=<?php echo $idd ?>">Edit Profile </a> <br>
                <a href="../shohan_featuers/profile_advertiser/cng_pro_pic.php?id=<?php echo $idd ?>">Change Profile Photo</a> <br>
                <a href="../shohan_featuers/profile_advertiser/cng_password.php?id=<?php echo $idd ?>">Change Password</a><br>
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