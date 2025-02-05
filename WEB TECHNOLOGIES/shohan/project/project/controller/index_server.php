    <?php

    require_once("../model/usermodel.php");
    require_once("../model/admodel.php");
    require_once("../model/ads_statisticsmodel.php");

    if(isset($_REQUEST['ad_category'])){
        $ad_category = $_REQUEST['ad_category'];
        $result = show_ads($ad_category);
        $num_of_ads = mysqli_num_rows($result);
        // echo $num_of_ads;
        if($num_of_ads > 0){

        while ($data = mysqli_fetch_assoc($result)) {
        
        $id = $data['user_id'];
        $row = user_info($id);
        
        $ad_id = $data['id'];
        $ad_statistics = show_ad_statistics_info($ad_id);


        echo "<div class= 'post '>
        <div class= 'info_container '>
          <div class= 'adv_info_container '>
            <img src= './asset/images/profile_pics/{$row['profile_pic']} ' alt= ' '>
            <p> {$row['username']}</p>
          </div>
         <div class= 'ad_info_container'>
            <p> {$data['category']} </p>
            <div class='ad_impression_class' > <img src='./asset/images/home_page_icons/impression.png' alt='' height='20px'> <p id='impression_{$ad_id}'>{$ad_statistics['impressions']}</p>
             </div>
            <div class='ad_report_class'><img src='./asset/images/home_page_icons/report.png' alt='' height='20px'> <p id='report_{$ad_id}'> {$ad_statistics['report']} </p>
            </div>
         </div>
        </div>
        <div class= 'image_container '>
            <img src= './asset/images/ad_pics/{$data['ad_photo']}' alt= ' '>
            <div class= 'impression'onclick=\"increase_impression({$data['id']})\">
            <img src='./asset/images/home_page_icons/impression.png' alt='' height='20px'>
            <p> Impression </p>
            </div>
            <div class= 'report' onclick=\"increase_report({$data['id']})\">
            <img src='./asset/images/home_page_icons/report.png' alt='' height='20px'>
            <p> Report </p>
            </div>
            <div class= 'price'>
                <p>Tk. {$data['price']}</p>
            </div>
        </div>
        <div class= 'text_container '>
            <h1>AD Title</h1>
            <p>  {$data['ad_title']}</p>
            <h1>AD Description</h1>
            <p>  {$data['ad_description']}</p>
            <h1> Contact Information
                </h1>
                <p>Email:  {$data['email']}</p>
                <p>Phone:  {$data['phone']}</p>
            </div>
        </div>";
    
            }
        }
        else{
            // echo "No ads Found in {$ad_category} Categroy";
            echo "No Ad found";
        }

    }


    if(isset($_REQUEST['increase_impression'])){
        $ad_to_impression_change= $_REQUEST['increase_impression'];
        $result3 = increase_impression($ad_to_impression_change);
        if($result3){
            $row1 = mysqli_fetch_assoc($result3);
            echo $row1['impressions'];
        }
        else{
            echo "error";
        }
    }
    if(isset($_REQUEST['increase_report'])){
        $ad_to_report_change= $_REQUEST['increase_report'];
        $result3 = increase_report($ad_to_report_change);
        if($result3){
            $row1 = mysqli_fetch_assoc($result3);
            echo $row1['report'];
        }
        else{
            echo "error";
        }
    }

    

    ?>