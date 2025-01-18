<?php
    session_start();
    require_once("../../../model/usermodel.php");
    if(!isset($_SESSION['status'])){
        header('location: ../../../signin/signin.html'); 
    }
    $idd = $_REQUEST['id'];
    $status_filter = isset($_GET['status']) ? $_GET['status'] : 'all';
    $result = show_users($status_filter);
      // while($row = mysqli_fetch_assoc($result)){
    //     echo "<br>";
    //     print_r($row);
    // }
    $user_info = user_info($idd);
    $name = $user_info['username'];
    $profile_pic = $user_info['profile_pic'];
?>
<html>
<html>
<head>
    <title>Manage Advertisers Page</title>
    <link rel="stylesheet" href="../../../asset/css/manage_advertiser.css">
    <link rel="icon" type="image/x-icon" href="../../../asset/images/logo/ad.svg">
</head>
<body>
    <div class="main_container">
        <div class="container">
            <div class="header">
                <div class="page_name">
                    <img src="../../../asset/images/manage_advs.png" alt="">
                    <p>Manage Advertisers Page</p>
                </div>
                <div class="adventure_name">
                    <img src="../../../asset/SVG//white_adventure.svg" alt="">
                </div>
                <div class="admin_name">
                    <div class="image_container">
                        <img src="../../../asset/images/TOWSIF_PIC.jpg" alt="">
                    </div>
                    <p>Hello, <?php echo $name ?></p>
                </div>
            </div>
            <div class="left">
                <div class="logo_cotainer">
                    <img src="../../../asset/SVG/white_ad.svg" alt="">
                </div>
                <div class="admin_menu_container">
                <div>
                    <a href="../../dashboard/admin_menu.php?id=<?php echo $idd ?>">
                            <img src="../../../asset/images/dashboard.png" alt="">
                            Dashboard
                        </a>
                    </div>
                    <div>
                    <a href="../../manage_ads/manage_ad.php?id=<?php echo $idd ?>">
                            <img src="../../../asset/images/ad.png" alt="">
                            Manage ADs
                        </a>
                    </div>
                    <div>
                        <a href="../manage_users/view_users.php?id=<?php echo $idd ?>">
                            <img src="../../../asset/images/users.png" alt="">
                            View User
                        </a>
                    </div>
                    <div>
                        <a href="../manage_users/manage_users.php?id=<?php echo $idd ?>">
                            <img src="../../../asset/images/manage_users.png" alt="">
                            Manage Users
                        </a>
                    </div>
                    <div>
                        <a href="../manage_advertisers/view_advertisers.php?id=<?php echo $idd ?>">
                            <img src="../../../asset/images/advs.png" alt="">
                            View Advertisers
                        </a>
                    </div>
                    <div>
                        <a href="../manage_advertisers/manage_advertisers.php?id=<?php echo $idd ?>">
                            <img src="../../../asset/images/manage_advs.png" alt="">
                            Manage Advertisers
                        </a>
                    </div>
                    <div>
                        <a href="../ad_analytics/ad_analytics.php?id=<?php echo $idd ?>">
                            <img src="../../../asset/images/analytics.png" alt="">
                            AD Analytics
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img src="../../../asset/images/settings.png" alt="">
                            System Settings
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img src="../../../asset/images/flag.png" alt="">
                            Flagged Content
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img src="../../../asset/images/report.png" alt="">
                            Generate Report
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img src="../../../asset/images/change_pass.png" alt="">
                            Change Password
                        </a>
                    </div>
                    <div class="go_back">
                        <a href="../../opi_features/menu/admin_menu.php?id=<?php echo $idd ?>"> 
                        <img src="../../../asset/images/back.png" alt="">Go Back</a> 
                    </div>

                </div>
            </div>
            
            <div class="middle">
                <form action="">
                    <div class="advs_manage_contatiner">
                        <div class="search_container">
                            <div class="search_advs_container">
                                <img src="../../../asset/images/search.png" alt="">
                                <rtiser>Search Advertisers</p>
                            </div>
                            <div class="search_input_container">
                                <input type="text">
                                <button>search</button>
                            </div>
                        </div>

                       
                        <div class="filter_container">
                            <div class="filter_advs_container">
                                <img src="../../../asset/images/filter_user.png" alt="">
                                <p>Filter Advertisers by category</p>
                            </div>
                            <div class="filter_options_container">
                                <select name="" id="">
                                    <option value="Fashion">Fashion</option>
                                    <option value="Technology">Technolgy</option>
                                    <option value="Science">Science</option>
                                </select>
                            </div>
                        </div>

                        <div class="view_ad_campaign_container">
                            <button>
                                <a href="">
                                View AD Campaign
                                </a>
                            </button>
                        </div>

                        <div class="view_profile_details_container">
                        
                            <button>
                                <a href="">
                                View Business Profile Details
                                </a>
                            </button>
                        </div>

                        <div class="manupulate_container">
                        
                            <button>
                                <a href="">
                                Manage Status
                                </a>
                            </button>
                            
                            <button>
                            <a href="">
                            Edit Information
                            </a> </button>
                            
                        </div>

                        <div class="ban_unban_container">
                        
                            <button>
                                <a href="">
                                 Ban
                                </a>
                            </button>
                            
                            <button>
                            <a href="">
                            Unban
                            </a> </button>
                            <button>

                            <a href="">
                            Delete 
                            </a> </button>
                            
                        </div>

                    </div>
                </form>
            </div>
            <div class="right">
                <div class='all_user_container'>
                <div class="table_container">
                <table  cellspacing="0"  class="user_table">
                <tr  align="center">
                <th>ID</th>
                <th>Profile Pic</th>
                <th>Name</th>
                <th>Email</th>
                <th>User Type</th>
                <th>Status</th>
                <th colspan="2">Action</th>
                
            </tr>
            <?php 
                 while($row = mysqli_fetch_assoc($result)){
                 if($row['type'] == 'Advertiser'){
                //echo "<br>";
                //print_r($row);
                // }
            ?>
            <tr align="center">
                <td><?php echo $row['user_id']; ?></td>
                <td><img src="../../../asset/images/profile_pics/<?php if($row['profile_pic'] != "") {
    echo $row['profile_pic'];
} else {
    echo "no_profile_pic.png";
}
 ?>" alt="" > </td>
                <td><?php echo $row['username']; ?></td>
                <td><?php echo $row['email']; ?></td>
                <td><?php echo $row['type']; ?></td>
                <td><button id="status-<?php echo $row['status']; ?>"><?php echo $row['status']; ?></button></td>
                <td>    
                        <a href="../manage_users/edit_users.php?id=<?php echo $idd?>&idt=<?php echo $row['user_id']?>"> <img src="../../../asset/images/view_users_icons/edit2.ico" alt=""> </a> 
                    
                </td>
                <td>
                    
                        <a id="delete_user" href="../../../model/delete_user.php?id=<?php echo $idd?>&idt=<?php echo $row['user_id']?>"> <img src="../../../asset/images/view_users_icons/delete.ico" alt=""> </a> 
                   
                </td>
                <?php }} ?>
            </tr>
                </table>
                </div>
                </div>
            </div>
            <div class="footer"></div>
        </div>
    </div>

</body>
</html>