<?php

function getConnection(){
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'check');
    return $conn;
}


function getUserById($user_id) {
    $conn = getConnection();
    $sql = "SELECT * FROM users WHERE user_id = '$user_id'";
    $result = mysqli_query($conn, $sql);
    $user = mysqli_fetch_assoc($result);
    return $user;
}

function updateUserPassword($user_id, $new_password) {
    $conn = getConnection();
    $sql = "UPDATE users SET password = '$new_password' WHERE user_id = '$user_id'";
    $result = mysqli_query($conn, $sql);
    mysqli_close($conn);
    return $result;
}

// have to check this again,
function getWishlist() {
    $conn = getConnection();
    $sql = "SELECT w.id, a.ad_title 
        FROM wishlist w 
        JOIN ads a ON w.id = a.id";
    $result = mysqli_query($conn, $sql);
    $wishlist = [];
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $wishlist[] = $row;
        }
    }
    return $wishlist;
}


function getAllAds() {
    $conn = getConnection();
    $sql = "SELECT id, ad_title, ad_description, phone, email, price, ad_photo FROM ads";
    $result = mysqli_query($conn, $sql);

    $ads = [];
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $ads[] = $row;
        }
    }

    mysqli_close($conn);
    return $ads;
}


?>