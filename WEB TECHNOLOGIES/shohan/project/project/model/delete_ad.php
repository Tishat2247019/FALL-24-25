<?php
$idd = $_REQUEST['id'];
$idt = $_REQUEST['idt'];
require_once("admodel.php");

$result = delete_ad($idt);
if($result){
    echo "user deleted";
}
else{
    echo "some error";
}
?>

<a href="../view/tishat_features/manage_ads/manage_ad.php?id=<?php echo $idd ?>"> Go Back</a>


