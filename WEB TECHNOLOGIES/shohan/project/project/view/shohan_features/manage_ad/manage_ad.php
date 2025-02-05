<?php
$user_id = $_REQUEST["id"];
?>

<html>
<head>
    <title>Manage Ads</title>
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

        .form-container {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .form-container h1 {
            font-size: 22px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label {
            font-size: 14px;
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        .form-container input[type="text"],
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-container input[type="text"] {
            background-color: #f9f9f9;
            color: #555;
        }

        .form-container input[type="submit"] {
            color: white;
            font-weight: bold;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:nth-child(2) {
            background-color: #4CAF50; /* Green */
        }

        /*.form-container input[type="submit"]:nth-child(2):hover {
            background-color: #45a049;
        }*/

        .form-container input[type="submit"]:nth-child(3) {
            background-color: #f44336; /* Red */
        }

        /*.form-container input[type="submit"]:nth-child(3):hover {
            background-color: #d32f2f;
        }*/

        .form-container input[type="submit"]:nth-child(4) {
            background-color: #ff9900; /* Orange */
        }

        /*.form-container input[type="submit"]:nth-child(4):hover {
            background-color: #e68a00;
        }*/
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Manage Ad</h1>
        <form action="" method="">
            <div>
                <label for="ad-title">Search Ad by Title</label>
                <input type="text" id="ad-title" name="ad-title" placeholder="Enter Ad Title">
            </div>
            <input type="submit" value="Edit Ad">
            <input type="submit" value="Delete Ad">
            <input type="submit" value="Go Back" onclick="window.history.back(); return false;">
        </form>
    </div>
</body>
</html>