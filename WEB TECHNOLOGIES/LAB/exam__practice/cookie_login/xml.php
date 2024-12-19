<?php
// Define the XML file path
$xml_file = "example.xml";

// Create a new XML structure
$xml = new SimpleXMLElement("<root/>");

// Add child nodes to the XML structure
$child1 = $xml->addChild("child");
$child1->addChild("name", "John");
$child1->addChild("age", "30");

$child2 = $xml->addChild("child");
$child2->addChild("name", "Jane");
$child2->addChild("age", "25");

// Save the XML structure to a file
if (file_put_contents($xml_file, $xml->asXML())) {
    echo "XML file created successfully at: " . realpath($xml_file);
} else {
    echo "Failed to create XML file.";
}
?>
