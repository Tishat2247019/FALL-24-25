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
    $sql = "select * from first_check where id = $idd";
    $result = mysqli_query($conn, $sql);
    // var_dump($result);
    $row = mysqli_fetch_assoc($result);
    $name = $row['username'];
    $id = $row['id'];
    $email = $row['email'];
?>
    <html>
        <head>
            <title>Home Page</title>
        </head>
            <body>
                
                <table align="center" border="1" cellspacing="0" width="300px" height="300px">
                    
                
                <tr align="center">
                    <td colspan="2">Profile</td>
                </tr>
                <tr align="center">
                    <td>Id</td>
                    <td><?php echo $id  ?></td>
                </tr>
                <tr align="center">
                    <td>Name</td>
                    <td><?php echo $name ?></td>
                </tr>
                <tr align="center">
                    <td>Name</td>
                    <td><?php echo $email ?></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="user_home.php?id=<?php echo $id?>">Go Home</a>
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