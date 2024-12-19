<?php
session_start();
$username = trim($_POST['username']);
$password = trim($_POST['password']);
$email = trim($_POST['email']);
$confirm_password = trim($_POST['confirm_password']);
$email = trim($_POST['email']);
$id = trim($_POST['id']);

//$gender = trim($_POST['gender']);
$dob = strtotime($_POST['dob']);
// $dob1 = date('Y-m-d', strtotime($_POST['dob']));
if (empty($username) || empty($password) || empty($email) || empty($confirm_password) || empty($id)  || empty($dob) || !isset($_POST['gender'])) {
    echo "input field can not be empty";
}
elseif($password !== $confirm_password){
    echo "Password and confirm password does not match";
}
else{
    // echo $_POST['gender'];
    // echo "ok";
    // echo "<br>";    
    $gender = $_POST['gender'];
    $dob = date("Y-m-d", $dob); #convertin the date input type to year-month-date format using date function
    $user_indformation = array("username" => $username, "password" => $password, "email" => $email, "id"=>$id, "gender" => $gender, "dob"=>$dob);
    $_SESSION = $user_indformation;

   
    $my_file2 = "user_info1.json";

    if(file_exists($my_file2)){
        $json_data = file_get_contents($my_file2);
        $json_data_to_php_array = json_decode($json_data, true);

        if(!is_array($json_data_to_php_array)){
            $json_data_to_php_array = [];
        }
    }
    else{
        $json_data_to_php_array = [];
    }

    $data_to_write =array("username"=> $username,"email"=> $email);
    $json_data_to_php_array[]= $data_to_write;
    $php_array_to_json = json_encode($json_data_to_php_array, JSON_PRETTY_PRINT);
    file_put_contents($my_file2, $php_array_to_json);



    $my_file = "userinfo.xml";
    
     if(file_exists($my_file)){
    
        $user_info = simplexml_load_file($my_file);
        // $uu = file_get_contents($my_file);
        // $user_info = new SimpleXMLElement($uu);
    }
    else{
        $user_info = new SimpleXMLElement("<users/>");
    }
    
    //$user_info = new SimpleXMLElement("<users/>");
        $users = $user_info->addchild("user");  
        $users->addChild("name", $username);

        file_put_contents($my_file, $user_info->asXML());




    header("location: login.html");
    // echo $new_time;
    // var_dump($new_time);    
}


?>