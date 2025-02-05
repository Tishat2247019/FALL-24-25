<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Advertiser Profile Photo</title>
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

        
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        
        .form-section {
            margin-bottom: 20px;
        }

        .form-section label {
            font-size: 16px;
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        .form-section input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .form-section img {
            display: block;
            width: 100%;
            max-width: 200px;
            height: auto;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        
        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
            color: white;
        }

        button[type="submit"] {
            background-color: #4CAF50;
        }

        button[type="button"] {
            background-color: #ff9900;
        }

        
        button[type="submit"]:hover {
            background-color: #45a049;
        }

        button[type="button"]:hover {
            background-color: #e68a00;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Change Profile Photo</h1>
        <form action="" method="" enctype="multipart/form-data">
            <div class="form-section">
                <label for="new-photo">Upload New Profile Photo</label>
                <input type="file" id="new-photo" name="new-photo" accept="image/*">
            </div>

            <div class="form-section">
                <label>Current Photo</label>
                <img src="" alt="Current Profile Photo">
            </div>

            <button type="submit">Save Changes</button>
            <button type="button" onclick="history.back()">Go Back</button>
        </form>
    </div>

</body>
</html>