<?php  

session_start();
require_once("../model/usermodel.php");

function display_users($row){

    return "<tr align='center'>
                    <td>{$row['user_id']}</td>
                    <td><img src='../../../asset/images/profile_pics/" . (!empty($row['profile_pic']) ? $row['profile_pic'] : 'no_profile_pic.png') . "' alt='' '> </td>
                    <td>{$row['username']}</td>
                    <td>{$row['email']}</td>
                    <td>{$row['type']}</td>
                    <td><button id='status-{$row['status']}'>{$row['status']}</button></td>
                    <td>
                        <a href='edit_users.php?id={$row['user_id']}&idt={$row['user_id']}'> 
                            <img src='../../../asset/images/view_users_icons/edit2.ico' alt='Edit' style='width:20px;height:20px;'> 
                        </a> 
                    </td>
                    <td>
                        <a id='delete_user' onclick=\"confirmDelete({$row['user_id']})\"> 
                            <img src='../../../asset/images/view_users_icons/delete.ico' alt='Delete' style='width:20px;height:20px;'> 
                        </a> 
                    </td>
                </tr>
            ";
}


if(isset($_REQUEST['status'])){
    $status = $_REQUEST['status'];
    $result = show_users($status);
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            if ($row['type'] === 'User') {
                echo display_users($row);
            }
        }
    } 
    
}


if(isset($_REQUEST['search_word'])){
    $search_word = $_REQUEST['search_word'];
    $result1 = show_users();
    $user_found = false;

    while ($row = mysqli_fetch_assoc($result1)) {
        $search_word_original = strpos($row['username'], $search_word);
        $search_word_upper = strpos(strtoupper($row['username']), strtoupper($search_word)) ;
        $search_word_lower = strpos(strtolower($row['username']), strtolower($search_word));

        if ($row['type'] === 'User' && ($search_word_original !== false || $search_word_upper !== false || $search_word_lower !== false )) {
            echo display_users($row);
            $user_found = true;

        }
    }
    if(!$user_found){
        echo "no user found";
    }

}

?>