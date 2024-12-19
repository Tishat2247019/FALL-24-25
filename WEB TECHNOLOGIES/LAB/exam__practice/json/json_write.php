<?php

$file_name = "json_write.json";

// Check if the file exists and has content
if (file_exists($file_name) && filesize($file_name) > 0) {
    // Read existing data
    $existing_data = file_get_contents($file_name);
    echo $existing_data ."<br>";
    $json_array = json_decode($existing_data, true); // Decode to associative array
    var_dump($json_array);

    if (!is_array($json_array)) {
        // If the file does not contain a valid JSON array, reset it
        $json_array = [];
    }
} else {
    // If the file doesn't exist or is empty, start with an empty array
    $json_array = [];
}

// New data to be appended
$data_to_be_write = array("name" => "opi", "age" => "23");

// Add new data to the array
$json_array[] = $data_to_be_write;

// Encode the updated array back to JSON
$string_to_json = json_encode($json_array, JSON_PRETTY_PRINT);

// Write the updated JSON back to the file
file_put_contents($file_name, $string_to_json);

?>
