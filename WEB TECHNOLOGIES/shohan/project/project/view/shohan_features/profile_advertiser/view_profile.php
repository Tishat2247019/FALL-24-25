<?php
session_start();
require_once("../model/usermodel.php");
if(!isset($_SESSION['status'])){
    header('location: ../../../signin/signin.html'); 
}

    $user_id = $_REQUEST["id"];
    $user_info = user_info($idd);
    $name = $user_info['username'];
    $email = $user_info['email'];
?>


<html>
<head>
    <title>View Advertiser Profile</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        
        .profile-container {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            font-size: 16px;
            color: #333;
        }

        
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        
        .profile-section {
            margin-bottom: 20px;
        }

        
        .profile-section b {
            color: #4CAF50;
            font-size: 18px;
        }

        
        .profile-section p {
            font-size: 16px;
            color: #555;
            margin: 5px 0;
        }

        
        .divider {
            border-top: 1px solid #ddd;
            margin: 20px 0;
        }

        
        .profile-item {
            margin-bottom: 15px;
        }

        
        .go-back-btn {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #ff9900;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            /*transition: background-color 0.3s ease;*/
        }

        /*.go-back-btn:hover {
            background-color: #e68a00;
        }*/
    </style>
</head>
<body>

    <div class="profile-container">
        <h1>View Profile (Advertiser)</h1>
        
        <div class="profile-section profile-item">
            <b>Name:</b>
            <p><?php echo $name?></p>
        </div>

        <div class="profile-section profile-item">
            <b>Contact Information:</b>
            <p><b>Email:</b> <?php echo $email?></p>
        </div>

        <button class="go-back-btn" onclick="window.history.back();">Go Back</button>
    </div>

</body>
</html>