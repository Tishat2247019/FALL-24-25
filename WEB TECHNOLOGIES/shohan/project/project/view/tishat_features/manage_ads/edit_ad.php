<?php
session_start();
require_once('../../../model/admodel.php');
require_once('../../../model/usermodel.php');
if($_SESSION['status'] == true){   
    $idd = $_REQUEST['id'];
    $idt = $_REQUEST['idt'];
    $ad_info = ad_info($idt);
    $ad_id = $ad_info['id'];
    $adv_id = $ad_info['user_id'];
    $adv_info = user_info($adv_id);
    $adv_name = $adv_info['username'];
    $description = $ad_info['ad_description'];
    $title = $ad_info['ad_title'];
    $phone = $ad_info['phone'];
    $email = $ad_info['email'];
    $photo = $ad_info['ad_photo'];
    $price = $ad_info['price'];
    $category = $ad_info['category'];

    $admin_info = user_info($idd);
    $admin_name = $admin_info['username'];
    $admin_photo = $admin_info['profile_pic'];
    
    // $destination = $_REQUEST['destination'];
}

?>

<html>
    <head>
        <title>Edit User Page</title>
    <link rel="stylesheet" href="../../../asset/css/edit_ad.css">

    </head>
    <body>


    <div class="main_container">
        <div class="container">
            <div class="header">
                <div class="page_name">
                    <img src="../../../asset/images/ad.png" alt="">
                    <p>Edit AD Information Page</p>
                </div>
                <div class="admin_name">
                    <div class="image_container">
                    <img src="../../../asset/images/profile_pics/<?php echo $admin_photo; ?>" alt="" height="40px"> 
                    </div>
                    <p>Hello, <?php echo $admin_name  ?></p>
                </div>
            </div>


            <div class="left">
                
                <div class="user_info_container">

                    
                    <div>
                        <h1>Ads current Information</h1>
                    </div>
                    <div>
                        <div id="photo_container">
                            <img src="../../../asset/images/ad_pics/<?php echo $photo;  ?>" alt="" >
                        </div>
                    </div>
                    
                    <div>
                        <div>
                            <p id="id">ID</p>
                        </div>
                        <div>
                            <p><?php echo $ad_id ?></p>
                        </div>
                    </div>
                    
                    
                    <div>
                        <div>
                            <p>Advertiser Name</p>
                        </div>
                        <div>
                            <p><?php echo $adv_name ?></p>
                        </div>
                    </div>
                    
                    
                    <div>
                        <div>
                            <p>Ad title</p>
                        </div>
                        <div>
                            <p><?php echo $title ?></p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <p>AD description</p>
                        </div>
                        <div>
                            <p><?php echo $description ?></p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <il>Email</p>
                        </div>
                        <div>
                            <p><?php echo $email ?></p>
                        </div>
                    </div>
                </div>
                    
                </div>
                
                <div class="right">
    <form action="../../../controller/edit_ad_server.php?id=<?php echo $idd  ?>&idt=<?php echo $idt ?>" method="POST" id="edit_ad_form">

<div class="ad_info_container">

<div class="left_ad_info_container">

    <div>
        <div>
            <p>AD ID</p>
        </div>
        <div>
            <p><?php echo $idt ?></p>
        </div>
    </div>
    
    <div>
        <div>
            <p>Advertiser ID</p>
        </div>
        <div>
            <p><?php echo $adv_id ?></p>
        </div>
    </div>
    
    <div>
        <div>
            <p>AD Description</p>
        </div>
        <div>
            <p><?php echo $description; ?></p>
        </div>
    </div>
    
    <div>
        <div>
            <p>New Description</p>
        </div>
        <div>
            <textarea id="new_ad_description" name="new_ad_description" cols="30" rows="8"></textarea>
        </div>
    </div>
    
    <div>
        <div>
            <p>AD Title</p>
        </div>
        <div>
            <p><?php echo $title ?></p>
        </div>
    </div>
    
    <div>
        <div>
            <p>New Title</p>
        </div>
        <div>
            <input type="text" name="new_title">
        </div>
    </div>
</div>

<div class="right_ad_info_container">
    
    <div>
        <div>
            <p>Phone</p>
        </div>
        <div>
            <p><?php echo $phone ?></p>
        </div>
    </div>
    
    <div>
        <div>
            <p>New Phone</p>
        </div>
        <div>
            <input type="text" name="new_phone">
        </div>
    </div>
    
    <div>
        <div>
            <p>Email</p>
        </div>
        <div>
            <p><?php echo $email ?></p>
        </div>
    </div>
    
    <div>
        <div>
            <p>New Email</p>
        </div>
        <div>
            <input type="email" name="new_email">
        </div>
    </div>
    
    <div>
        <div>
            <p>Price</p>
        </div>
        <div>
            <p><?php echo $price ?></p>
        </div>
    </div>
    
    <div>
        <div>
            <p>New Price</p>
        </div>
        <div>
            <input type="text" name="new_price">
        </div>
    </div>
    <div>
        <div>
            <p>Category</p>
        </div>
        <div>
            <p><?php echo $category ?></p>
        </div>
    </div>
    
    <div>
        <div>
            <p>New Category</p>
        </div>
        <div>
            <select name="new_category" id="ad_category">
                <option value="All">All</option>
                <option value="Electronics">Electronics</option>
                <option value="Education">Education</option>
                <option value="Mobile">Mobiles</option>
                <option value="Agriculture">Agriculture</option>
                <option value="Property">Property</option>
                <option value="Daily living">Daily Living</option>
                <option value="Diverse">Diverse</option>
            </select>
        </div>
    </div>
    
</div>

</div>

<div class="buttons_container">
    <div>
        <div>
            <input type="submit" value="Submit" name="submit"> &nbsp; &nbsp; &nbsp;<input type="reset" value="Reset" name="reset">
        </div>
    </div>
    
    <div>
        <div>
            <a href="manage_ad.php?id=<?php echo $idd ?>"> Go Back</a>
        </div>
    </div>
</div>


</form>

            
            </div>
            <div class="footer">footer</div>

            <div id="confirmPopup" class="popup">
                <div class="popup-content">
                    <p id="popupMessage"></p>
                    <div class="button_container">
                        <button id="confirmYes" onclick="confirmedit1(event)">Yes</button>
                        <button id="confirmNo">No</button>
                        <button id="confirmOk"> OK</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../../../asset/js/edit_users.js"></script>

    </body>
</html>