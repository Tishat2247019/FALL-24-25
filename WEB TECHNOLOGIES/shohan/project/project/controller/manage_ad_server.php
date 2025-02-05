<?php

require_once("../model/usermodel.php");
require_once("../model/admodel.php");
$idd = $_REQUEST['id'];

if(isset($_REQUEST['ad_category'])){
    $ad_category = $_REQUEST['ad_category'];
    $result = show_ads($ad_category);
    
    while($row = mysqli_fetch_assoc($result)){
        $adv_id = $row['user_id'];
        $user_info =  user_info($adv_id);
        $adv_name = $user_info['username'];

         echo "<tr align='center'>
                <td> {$row['id']}</td>
                <td> {$adv_name}  </td>
                <td> {$row['ad_title']}</td>
                <td id='ad_description'> {$row['ad_description']}</td>
                <td>
                    <div class='ad_photo_container'>
                        <img src='../../../asset/images/ad_pics/{$row['ad_photo']}' alt='' >
                    </div>
                 </td>
                <td> {$row['price']}</td>
                <td>{$row['category']}</td>
                
                <td>    
                        <a href='edit_ad.php?id={$idd}&idt={$row['id']}'> <img src='../../../asset/images/view_users_icons/edit2.ico' alt=''> </a>                     
                </td>
                <td>
                    
                        <a id='delete_user' href='../../../model/delete_ad.php?idt={$row['id']}'> <img src='../../../asset/images/view_users_icons/delete.ico' alt=''> </a> 
                   
                </td>
            </tr> ";
}
}


if(isset($_REQUEST['search_word'])){
    $search_word = $_REQUEST['search_word'];
    $result = show_ads();
    $ad_found = false;
    
    while($row = mysqli_fetch_assoc($result)){
        $adv_id = $row['user_id'];
        $user_info =  user_info($adv_id);
        $adv_name = $user_info['username'];

        $search_word_original = strpos($row['ad_title'], $search_word);
        $search_word_upper = strpos(strtoupper($row['ad_title']), strtoupper($search_word)) ;
        $search_word_lower = strpos(strtolower($row['ad_title']), strtolower($search_word));

        $search_word_original_desc = strpos($row['ad_description'], $search_word);
        $search_word_upper_desc = strpos(strtoupper($row['ad_description']), strtoupper($search_word)) ;
        $search_word_upper_desc = strpos(strtolower($row['ad_description']), strtolower($search_word));

        $search_word_original_price = strpos($row['price'], $search_word);


        if ($search_word_original !== false || $search_word_upper !== false || $search_word_lower !== false ||  $search_word_original_desc !== false || $search_word_upper_desc !== false || $search_word_upper_desc !== false || $search_word_original_price !== false){
            echo "<tr align='center'>
            <td> {$row['id']}</td>
            <td> {$adv_name}  </td>
            <td> {$row['ad_title']}</td>
                <td id='ad_description'> {$row['ad_description']}</td>
                <td>
                <div class='ad_photo_container'>
                <img src='../../../asset/images/ad_pics/{$row['ad_photo']}' alt='' >
                </div>
                </td>
                <td> {$row['price']}</td>
                <td>{$row['category']}</td>
                
                <td>    
                <a href='edit_ad.php?id={$idd}&idt={$row['id']}'> <img src='../../../asset/images/view_users_icons/edit2.ico' alt=''> </a> 
                
                </td>
                <td>
                
                <a id='delete_user' href='../../../model/delete_ad.php?idt={$row['id']}'> <img src='../../../asset/images/view_users_icons/delete.ico' alt=''> </a> 
                
                </td>
                </tr> ";
                $ad_found = true;
            }
        }
        if(!$ad_found){
            echo "no add found";
        }
}

?>