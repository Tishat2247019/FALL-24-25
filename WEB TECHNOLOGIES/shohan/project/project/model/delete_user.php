<?php
// $idd = $_REQUEST['id'];
$idt = $_REQUEST['idt'];
require_once("usermodel.php");

$result = delete_user($idt);
if ($result) {
    $msg1 = array("success" => true, "message" => "User deleted successfully");
    echo json_encode($msg1);
} else {
    $msg2 = array("success" => false, "message" => "Error deleting user");
    echo json_encode($msg2);
    
}


?>



