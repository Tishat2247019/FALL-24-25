<?php
session_start();
require_once('../../../model/usermodel.php');
if($_SESSION['status'] == true){   
    $idd = $_REQUEST['id'];
    $idt = $_REQUEST['idt'];
    $user_info = user_info($idt);
    $name = $user_info['username'];
    $type = $user_info['type'];
    $pass = $user_info['password'];
    $email = $user_info['email'];
    $status = $user_info['status'];
    $profile_pic=$user_info['profile_pic'];
    // $destination = $_REQUEST['destination'];
}

?>

<html>
    <head>
        <title>Edit User Page</title>
    <link rel="stylesheet" href="../../../asset/css/edit_users.css">

    </head>
    <body>


    <div class="main_container">
        <div class="container">
            <div class="header">
                <div class="page_name">
                    <img src="../../../asset/images/ad.png" alt="">
                    <p>Edit User Information Page</p>
                </div>
                <div class="admin_name">
                    <p>Hello Admin</p>
                </div>
            </div>


            <div class="left">
                
                <div class="user_info_container">

                    
                    <div>
                        <h1>User's current Information</h1>
                    </div>
                    <div>
                        <div id="photo_container">
                            <img src="../../../asset/images/profile_pics/<?php echo $profile_pic;  ?>" alt="" >
                        </div>
                    </div>
                    
                    <div>
                        <div>
                            <p id="id">ID</p>
                        </div>
                        <div>
                            <p><?php echo $idt ?></p>
                        </div>
                    </div>
                    
                    
                    <div>
                        <div>
                            <p>Username</p>
                        </div>
                        <div>
                            <p><?php echo $name ?></p>
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
                            <p>Type</p>
                        </div>
                        <div>
                            <p><?php echo $type ?></p>
                        </div>
                    </div>
                    <div>
                        <div>
                            <p>Status</p>
                        </div>
                        <div>
                            <p><?php echo $status ?></p>
                        </div>
                    </div>
                </div>
                    
                </div>
                
                <div class="right">
                    
                    <form action="../../../controller/edit_user_check.php?id=<?php echo $idd ?>&idt=<?php echo $idt ?>" method="POST">
                        
                        <div class="change_user_info_container">
                            <h1>Change Users Information</h1>
                        </div>
                        <div>
                            <div>
                                <p>ID</p>
                            </div>
                        <div class="border_input">
                            <p><?php echo $idt ?></p>
                        </div>
                    </div>

                    <div>
                        <div>
                            <p>Username</p>
                        </div>
                        <div class="border_input">
                            <p><?php echo $name ?></p>
                        </div>
                    </div>

                    <div>
                        <div>
                            <p>New Username</p>
                        </div>
                        <div class="border_input">
                            <input type="text" name="new_username" id="new_username_id" onkeyup="check_username()"/>
                            <p class="red_validate" id="name_error">please enter a valid username</p>
                        </div>
                    </div>

                    <div>
                        <div>
                            <p>Email</p>
                        </div>
                        <div class="border_input">
                            <p><?php echo $email ?></p>
                        </div>
                    </div>

                    <div>
                        <div>
                            <p>New Email</p>
                        </div>
                        <div class="border_input">
                            <input type="email" name="new_email" id="new_email_id" onkeyup="check_email()"/>
                            <p class="red_validate" id="email_error">please enter a valid email</p>
                        </div>
                    </div>

                    <div>
                        <div>
                            <p>Type</p>
                        </div>
                        <div class="border_input">
                            <p><?php echo $type ?></p>
                        </div>
                    </div>

                    <div>
                        <div>
                            <p>New Type</p>
                        </div>
                        <div class="border_input">
                            <!-- <input type="text" name="new_type" /> -->
                            <select name="new_type" id="new_type_id">
                                <option value="User">User</option>
                                <option value="Advertiser">Advertiser</option>
                                <option value="Admin">Admin</option>
                            </select>
                        </div>
                    </div>

                    <div>
                        <div>
                            <p>Status</p>
                        </div>
                        <div>
                            <p class="border_input"><?php echo $status ?></p>
                        </div>
                    </div>

                    <div>
                        <div>
                            <p>New Status</p>
                        </div>
                        <div  class="border_input">
                        <select name="new_status" id="new_status_id">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>

                    <div class="buttons_container">
                        <div class="buttons_container_child">
                            <input type="submit" value="Submit" name="submit" onclick="confirmedit(event, <?php echo $idt; ?>)" />
                            <input type="reset" value="Reset" name="reset" />
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