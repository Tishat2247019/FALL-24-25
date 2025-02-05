<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['feedback'])) {
    $feedback = trim($_POST['feedback']);

    
    if (empty($feedback)) {
        echo "Please provide feedback before submitting.";
        echo "<a href='../view/user_feedback.html'>Go Back</a>";

    } else {
        
        $feedbackFile = 'user_feedback.txt'; // Replace korte hbe with database or which method should i use to save?
        $entry = "Feedback: " . $feedback . "\n";

        if (file_put_contents($feedbackFile, $entry, FILE_APPEND)) {
            echo "Thank you for your feedback!";
        } else {
            echo "There was an error saving your feedback. Please try again later.";
        }

        echo "<a href='../view/user_feedback.html'>Go Back</a>";
    }

} else {
    echo "Invalid request. Please provide feedback.";
    echo "<a href='../view/user_feedback.html'>Go Back</a>";
}

?>