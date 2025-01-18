<?php
$user_id = $_REQUEST["id"];
?>
<html>
<head>
    <title>Create Ad</title>
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

        form {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="file"],
        input[type="text"],
        input[type="email"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        textarea {
            resize: none;
        }

        button[type="submit"], button[type="gsubmit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button[type="submit"] {
            background-color: #4CAF50;
        }

        button[type="gsubmit"] {
            background-color: #ff9900;
        }
    </style>
</head>
<body>

    <form action="../../../controller/shohan_controller/ad_check.php" method="post" enctype="multipart/form-data" id="create_ad_form">
        <h1>Create an Ad</h1>

        <input type="hidden" name="user_id" value="<?php echo $user_id ?>">

        <label for="ad_category">Ad Category</label>
        <select name="ad_category" id="ad_category" onchange="ad_based_catecogry(event, this.value, null)">
            <option value="All">All</option>
            <option value="Electronics">Electronics</option>
            <option value="Education">Education</option>
            <option value="Mobile">Mobiles</option>
            <option value="Agriculture">Agriculture</option>
            <option value="Property">Property</option>
            <option value="Daily living">Daily Living</option>
            <option value="Diverse">Diverse</option>
        </select>

        <label for="uploadfile">Upload Image</label>
        <input type="file" name="uploadfile" id="uploadfile">

        <label for="title">Ad Title</label>
        <input type="text" name="title" id="title">

        <label for="ad_description">Ad Description</label>
        <textarea id="ad_description" cols="56" rows="8" name="ad_description" form="create_ad_form"></textarea>

        <label for="phone">Phone</label>
        <input type="text" name="phone" id="phone">

        <label for="email">Email</label>
        <input type="email" name="email" id="email">

        <label for="price">Price</label>
        <input type="number" name="price" id="price" min="0">

        <button type="submit" name="submit">Submit</button>
        <button type="gsubmit" name="go_back">Go Back</button>
    </form>
</body>
</html>
