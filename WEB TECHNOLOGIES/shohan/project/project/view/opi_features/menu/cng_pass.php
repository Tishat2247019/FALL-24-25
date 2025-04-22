<?php 
session_start();
if($_SESSION['status'] == true){
    
?>
<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" href="flag_con.css">
</head>
<body>
    <div class="main_container">
        <table>
            <form>
                <fieldset align="center">
                    <legend>Change Password</legend>
                    <input type="password" name="curr_pass" id="curr_pass" required><br>
                            <label for="name">Enter Current Password</label>
                        </div>
                        <div>
                        <input type="password" name="new_pass" id="new_pass" required><br>
                        <label for="name">Enter New Password</label>
                        </div>
                        <div>
                        <input type="password" name="new_pass2" id="new_pass2" required><br>
                        <label for="name">Re-enter New Password</label>
                        </div><br>
                        <div>
                            <input type="submit" name="login" value="Submit">
                        </div>
                </fieldset>
            </form>
        </table>
    </div>

</body>
</html>

<?php }