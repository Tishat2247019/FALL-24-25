<?php

require_once("usermodel.php");
function ad_info($id){
    $conn = getConnection();
    $sql = "select * from ads where id = '$id'";
   
    $result = mysqli_query($conn, $sql);
    // var_dump($result);

    $row = mysqli_fetch_assoc($result);
        return $row; 
    
}


function show_ads($ad_category = 'All'){
    $conn = getConnection();
    // if ($category_filter === 'Active') {
    //     $sql = "select * from users where Category = 'category_filter'";
    // } elseif ($status_filter === 'Inactive') {
    //     $sql = "select * from users where status = 'Inactive'";
    // } else {
    // }
    if($ad_category !== 'All'){
    $sql = "select * from ads where category = '{$ad_category}'";
    }
    else{
        $sql = "select * from ads";
    }
    $result = mysqli_query($conn, $sql);
    return $result;
}


function delete_ad($idt){
    $conn = getConnection();
    $sql = "DELETE FROM ads WHERE id='$idt'";
    $result = mysqli_query($conn, $sql);
    if($result){
        return true;
    }
    else{
        return false;
    }
}

function total_ad_adv($adv_id){
    $conn = getConnection();
    $sql = "select * from ads where user_id = '$adv_id'";
    $result = mysqli_query($conn, $sql);
    $num_of_ads=mysqli_num_rows($result);
    return $num_of_ads;
    
}


function edit_ad($idt, $ad_title, $ad_description, $phone, $email, $price, $category){
    $conn = getConnection();
    $sql = "UPDATE ads
            SET ad_title = '$ad_title', $ad_description = '$ad_description', phone = '$phone', email = '$email', price = '$price', category='$category'
            WHERE id = $idt";
    $result = mysqli_query($conn, $sql);
    if($result){
        return true;
    }
    else{
        return false;
    }
}



?>
