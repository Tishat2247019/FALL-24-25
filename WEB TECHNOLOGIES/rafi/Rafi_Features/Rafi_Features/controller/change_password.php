<?php 

session_start();
require_once '../model/usermodel.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $current_password = trim($_POST['current_password']);
    $new_password = trim($_POST['new_password']);
    $confirm_new_password = trim($_POST['confirm_new_password']);

    if (empty($current_password) || empty($new_password) || empty($confirm_new_password)) {
        echo "Each field must be filled!";
        exit();
    }

    $user_id = $_SESSION['user_id'] ?? null;

    if (!$user_id) {
        echo "Invalid session. Please log in again.";
        exit();
    }

    $user = getUserById($user_id);

    if (!$user) {
        echo "User not found.";
        exit();
    }

    $stored_password = $user['password'];


    if ($current_password !== $stored_password) {
        echo "Your current password is incorrect.";
        exit();
    }

    if (strlen($new_password) < 8) {
        echo "New password must be at least 8 characters long and include letters and numbers.";
        exit();
    }

    if ($new_password !== $confirm_new_password) {
        echo "New passwords do not match.";
        exit();
    }

    $result = updateUserPassword($user_id, $new_password);

    if ($result) {
        echo "<h3>Your password has been successfully changed!</h3>";
    } else {
        echo "Failed to update the password. Please try again later.";
    }
} else {
    header("Location: ../view/changepassword_admin.html");
    exit();
}