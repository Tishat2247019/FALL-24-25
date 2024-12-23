<?php
session_start();
if($_SESSION['status'] == true){   
    $idd = $_REQUEST['id'];
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'check');
    // var_dump($conn);
    $sql = "select * from first_check where id = $idd";
    $result = mysqli_query($conn, $sql);
    // var_dump($result);
    $row = mysqli_fetch_assoc($result);
    $pass = $row['password'];
    $name = $row['username'];
}

?>

<html>
    <head>
        <title>pass change</title>
    </head>

    <body>

    <table align="center" >
    <form action="pass_change_db.php" method="POST">
        <tr height="250px">
            <td></td>
        </tr>
        <tr>
            <td>ID</td>
            <td><input type="text" value="<?php echo $idd ?>" name="id"></td>
        </tr>
        <tr>
            <td>Username</td>
            <td><input type="text" disabled value="<?php echo $name ?>"></td>
        </tr>
        <tr>
            <td>Old Password</td>
            <td><input type="text" disabled value="<?php echo $pass?>" > </td>
        </tr>
        <tr>
            <td>
            New Password
            </td>
            <td><input name="password" type="text" value=" "> </td>
        </tr>
        <tr>
            <td>Confirm New Password</td>
            <td><input type="text" value=" "> </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Submit" name="submit"> &nbsp; &nbsp; &nbsp;<input type="reset" value="Reset" name="reset"></td>
        </tr>
            
        </form>

    </table>
        
       
    </body>
</html>