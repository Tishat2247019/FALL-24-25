<?php
    session_start();
    require_once("../../../model/usermodel.php");
    if(!isset($_SESSION['status'])){
        header('location: login.html'); 
    }
    $idd = $_REQUEST['id'];
    $result = show_users();
      // while($row = mysqli_fetch_assoc($result)){
    //     echo "<br>";
    //     print_r($row);
    // }
?>
<html>
<head>
    <title>View Users Page</title>
    <link rel="stylesheet" href="view_users.css">
</head>
<body>
    <div class="main_container">
        <div class="container">
            <div class="header">
            </div>
            <div class="left">
                <div class="admin_menu_container">
                    <button>Dashboard</button>
                    <button>Manage ADs</button>
                    <button>View User</button>
                    <button>Manage Users</button>
                    <button>View Advertiesers</button>
                    <button>Manage ADvertisers</button>
                    <button>AD Analytics </button>
                    <button>System settings</button>
                    <button>Flagged Content</button>
                    <button>Generate Report </button>
                    <button>Change Password </button>
                </div>
            </div>
            <div class="right"></div>
            <div class="middle">
                <div class="user_manage_contatiner">
                    <p>search Users</p>
                    <form action="">
                        <input type="text">
                        <button>search</button>
                        <div class="user_status_container">
                            <div class="active_users">Active users</div>
                            <div class="inactive_users">Inactive users</div>
                        </div>
                    </form>
                    <button>User Activity History </button><br>
                    <button>Manage Status</button><br>
                    <button>Edit Information </button>
                </div>
                <div class='all_user'>
                <table border=1 cellspacing="0" align="center" width="50%">
            <tr align="center">
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>User Type</th>
                <th colspan="2">Action</th>
                
            </tr>
            <?php 
                 while($row = mysqli_fetch_assoc($result)){
                 if($row['type'] == 'User'){
                //echo "<br>";
                //print_r($row);
                // }
            ?>
            <tr align="center">
                <td><?php echo $row['id']; ?></td>
                <td><?php echo $row['name']; ?></td>
                <td><?php echo $row['email']; ?></td>
                <td><?php echo $row['type']; ?></td>
                <td>
                    <a href="edit.php?id=<?php echo $idd?>&idt=<?php echo $row['id']?>"> EDIT </a> 
                </td>
                <td>
                <a href="../model/delete_user.php?id=<?php echo $idd?>&idt=<?php echo $row['id']?>"> DELETE </a> 
                </td>
                <?php }} ?>
            </tr>
                <tr align="center">
                <td colspan="6">
                    <a href="../../dashboard/admin_menu.php?id=<?php echo $idd ?>"> Go to Menu </a> 
                </td>
                </tr>
                </table>
                </div>
            </div>
            <div class="footer"></div>
        </div>
    </div>

</body>
</html>