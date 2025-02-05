<?php

require_once '../model/usermodel.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['search_query'])) {
    $search_query = trim($_GET['search_query']);

    echo "
    <html>
    <head>
        <title>Search Results</title>
        <link rel='stylesheet' type='text/css' href='../asset/search_results.css'>
    </head>
    <body>";

    if (empty($search_query)) {
        echo "<h3>Please enter a keyword to search for ads.</h3>";
    } else {
        $conn = getConnection();
        $search_query = mysqli_real_escape_string($conn, $search_query);

        $sql = "SELECT ad_title, ad_description, price, phone, email FROM ads 
                WHERE ad_title LIKE '%$search_query%' 
                OR ad_description LIKE '%$search_query%'";

        $result = mysqli_query($conn, $sql);

        echo "<h3>Search Results for: '" . $search_query . "'</h3>";

        if (mysqli_num_rows($result) > 0) {
            echo "<ul>";
            while ($ad = mysqli_fetch_assoc($result)) {
                echo "<li><strong>" . $ad['ad_title'] . "</strong><br>" .
                     "Description: " . $ad['ad_description'] . "<br>" .
                     "Price: $" . $ad['price'] . "<br>" .
                     "Contact: " . $ad['phone'] . " | " . $ad['email'] . 
                     "</li><br>";
            }

            echo "</ul>";
        } else {
            echo "<p>No ads found matching your search query.</p>";
        }

        mysqli_close($conn);
    }

    echo "</body>
    </html>";
} else {
    header("Location: ../view/search_ads.html");
    exit();
}

?>