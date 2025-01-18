<?php
// error_reporting(0);

// $msg = "";

// If upload button is clicked ...
if (isset($_POST['submit'])) {

    $filename = $_FILES["uploadfile"]["name"];
    $tempname = $_FILES["uploadfile"]["tmp_name"];
    $folder = "../asset/images/ad_pics/" . $filename;
    $title = $_POST['title'];
    $description = $_POST['ad_description'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $ad_category = $_POST['ad_category'];

    $db = mysqli_connect("localhost", "root", "", "check");
    $current_date = date('Y-m-d');

    
    $sql = "INSERT INTO ads (ad_title, ad_description, phone, email, ad_photo, category) VALUES ('$title', '$description', '$phone', '$email', '$filename', $ad_category)";
    mysqli_query($db, $sql);
    
    $ad_id = mysqli_insert_id($db);
    echo $current_date;
    $sql1 = "insert into ad_statistics(id, date_posted) values ('$ad_id','$current_date')";
    mysqli_query($db, $sql1);

    if (move_uploaded_file($tempname, $folder)) {
        $msg = "<h3 style='color: green;'>Your Ad uploaded successfully!</h3>";
    } else {
        $msg = "<h3 style='color: red;'>Failed to upload!</h3>";
    }
}

if (isset($_POST['go_back'])) {
    // Redirect to the desired page
    header("Location: ../view/dashboard/advertiser_menu.php");
    exit();
}
?>

<html>
<head>
    <title>Ad Check</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            text-align: center;
        }
        .message {
            margin-bottom: 20px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ff9900;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        /*.button:hover {
            background-color: #ff9900;
        }*/
    </style>
</head>
<body>

    <div class="container">
        <div class="message">
            <?php echo isset($msg) ? $msg : ''; ?>
        </div>
        <a href="../view/dashboard/advertiser_menu.php" class="button">Go Back</a>
    </div>

</body>
</html>
