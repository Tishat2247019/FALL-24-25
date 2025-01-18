<?php
require_once '../model/usermodel.php';

$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : null;
$price_min = isset($_GET['price_min']) ? (int)$_GET['price_min'] : null;
$price_max = isset($_GET['price_max']) ? (int)$_GET['price_max'] : null;
$sort = isset($_GET['sort']) ? $_GET['sort'] : null;


$ads = getAllAds();


if ($keyword) {
    $ads = array_filter($ads, function ($ad) use ($keyword) {
        return stripos($ad['ad_title'], $keyword) !== false || stripos($ad['ad_description'], $keyword) !== false;
    });
}

if ($price_min !== null && $price_max !== null) {
    $ads = array_filter($ads, function ($ad) use ($price_min, $price_max) {
        return $ad['price'] >= $price_min && $ad['price'] <= $price_max;
    });
}

if ($sort === 'price_asc') {
    usort($ads, function ($a, $b) {
        return $a['price'] - $b['price'];
    });
} elseif ($sort === 'price_desc') {
    usort($ads, function ($a, $b) {
        return $b['price'] - $a['price'];
    });
} elseif ($sort === 'title_asc') {
    usort($ads, function ($a, $b) {
        return strcmp($a['ad_title'], $b['ad_title']);
    });
} elseif ($sort === 'title_desc') {
    usort($ads, function ($a, $b) {
        return strcmp($b['ad_title'], $a['ad_title']);
    });
}

?>

<html>
<head>
    <title>View Ads</title>
    <link rel="stylesheet" href="../asset/view_ads.css"></link>
</head>
<body>
    <h1 align="center">List of Ads</h1>
    <?php if (!empty($ads)): ?>
        <ul>
            <?php foreach ($ads as $ad): ?>
                <li>
                    <strong><?= $ad['ad_title'] ?></strong><br>
                    Description: <?= $ad['ad_description'] ?><br>
                    Price: $<?= $ad['price'] ?><br>
                    <a href="ad_details.php?id=<?= $ad['id'] ?>">View Details</a>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>No ads found based on your search criteria.</p>
    <?php endif; ?>
</body>
</html>