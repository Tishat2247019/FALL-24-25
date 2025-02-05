<?php
$user_id = $_REQUEST["id"];
?>

<html>
<head>
    <title>Generate Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 10px;
        }

        .form-box {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .form-box h2 {
            font-size: 20px;
            font-weight: bold;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        select, input[type="submit"], button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        select {
            background-color: #f9f9f9;
            color: #555;
        }

        input[type="submit"] {
            background-color: #4CAF50; 
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        /*input[type="submit"]:hover, button:hover {
            background-color: #3e8e41; 
        }*/

        button {
            background-color: #ff9900;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <div class="form-box">
            <h2>Generate Report</h2>
            <form action="check_generate_reports.php" method="post" enctype="multipart/form-data" id="generate_reports_form">
                
                <label for="report-type">Select Report Type</label>
                <select name="report-type" id="report-type" required>
                    <option value="" disabled selected>Please Select File Format</option>
                    <option value=".txt">.txt</option>
                    <option value=".pdf">.pdf</option>
                </select>

                <input type="submit" name="download_report" value="Download Report" title="Download the selected report type">
                <button type="button" onclick="window.location.href='../view/dashboard/advertiser_menu.php'" title="Go back to the previous page">Go Back</button>

            </form>
        </div>
    </div>

</body>
</html>
