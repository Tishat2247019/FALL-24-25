<?php
session_start();
if(!isset($_COOKIE['flag'])){
    header('location:login.html');
}
else{

$new_xml = simplexml_load_file("file.xml");

?>

<html>
    <head>
        <title>
            Home page
        </title>
        <body>
            <table align="center" width="30%" >
                <tr>
                    <td colspan="2" align="center">
                        <table height="200px"  align="center">
                                <tr align="center">
                                    <th align="center">
                                        User Information
                                    </th>
                                </tr>
                        </table>
                    </td>
                </tr>
                <tr align="center">
                    <td width="50%">
                       Username 
                    </td>
                    <td>
                        <?php echo $_SESSION['username']?>
                    </td>
                </tr>
                <tr align="center">
                    <td width="50%">
                       Email 
                    </td>
                    <td>
                        <?php echo $_SESSION['email']?>
                    </td>
                </tr>
                <tr align="center">
                    <td width="50%">
                       ID 
                    </td>
                    <td>
                        <?php echo $_SESSION['id']?>
                    </td>
                </tr>
                <tr align="center">
                    <td width="50%">
                       Date Of Birth
                    </td>
                    <td>
                        <?php echo $_SESSION['dob']?>
                    </td>
                </tr>
                <tr align="center">
                    <td width="50%">
                       Gender
                    </td>
                    <td>
                        <?php echo $_SESSION['gender']?>
                    </td>
                </tr>
                <tr align="center">
                    <td width="50%">
                       xml
                    </td>
                    <td>
                        <?php echo $new_xml->student[0]->name ?>
                    </td>
                </tr>

                <tr align="center">
                    <td colspan="2" align="end">
                       <a href="logout.php">logout?</a>
                    </td>
                </tr>
            </table>
        </body>
    </head>
</html>


<?php
}

?>