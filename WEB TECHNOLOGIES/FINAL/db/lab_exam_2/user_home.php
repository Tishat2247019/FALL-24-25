<?php
session_start();
if($_SESSION['status'] == true){
$idd = $_REQUEST['id'];
// foreach($_SESSION['users'] as $user){
//     if ($idd == $user['id']){
//         break;
//     }
// }
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'check');
    // var_dump($conn);
    $sql = "select * from first_check where id = $idd";
    $result = mysqli_query($conn, $sql);
    // var_dump($result);
    $row = mysqli_fetch_assoc($result);
    $name = $row['username'];
?>
    <html>
        <head>
            <title>Home Page</title>
        </head>
            <body>
                
                <table align="center" border="1" cellspacing="0" width="300px" height="300px">
                    <tr align="center">
                        <td>
                            <h1>Welcome <?php echo $name. "!" ?></h1>
                            <a href="profile.php?id=<?php echo $idd ?>">Profile</a> <br>
                            <a href="pass_change.php?id=<?php echo $idd ?>">Change Password</a> <br>
                            <a href="logout.php">Logout</a> <br>
                        </td>
                    </tr>
                </table>    
            </body>
    </html>

<?php
}
else{
    header("location:login.html");
}
?>