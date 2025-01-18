<?php

session_start();

if (isset($_SESSION['wishlist']) && isset($_POST['ad_id'])) {
    $ad_id = $_POST['ad_id'];
    $wishlist = $_SESSION['wishlist'];

    foreach ($wishlist as $key => $ad) {
        if ($ad['id'] == $ad_id) {
            unset($wishlist[$key]);
            $_SESSION['wishlist'] = array_values($wishlist);
            echo "Ad successfully removed from your wishlist.";
            echo "<a href='wishlist.php'>Back to Wishlist</a>";
            exit;
        }
    }

    echo "Ad not found in your wishlist.";
    echo "<a href='wishlist.php'>Back to Wishlist</a>";

} else {

    echo "Invalid request or no ads in the wishlist.";
    echo "<a href='wishlist.php'>Back to Wishlist</a>";
}

?>
