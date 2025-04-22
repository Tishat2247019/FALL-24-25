
<html>
<head>
    
    <title>Edit Advertiser Profile</title>
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
            max-width: 600px;
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

        
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        
        button[type="submit"],
        button[type="button"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        button[type="button"] {
            background-color: #ff9900;
            color: white;
        }

        button[type="button"]:hover {
            background-color: #e68a00;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Edit Profile (Advertiser)</h1>
        <form action="" method="">
            <div class="form-section">
                <label for="business-name">Edit Business Name</label>
                <input type="text" id="business-name" name="business-name" value="">
            </div>

            <div class="form-section">
                <label for="contact-email">Edit Contact Email</label>
                <input type="email" id="contact-email" name="contact-email" value="">
            </div>

            <button type="submit">Update Profile</button>
            <button type="button" onclick="window.history.back();">Go Back</button>
        </form>
    </div>

</body>
</html>