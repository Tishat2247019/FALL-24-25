<?php
$xml=simplexml_load_file("new.xml") or die("Error: Cannot create
object");
// print_r($xml->product[2]->name);
echo($xml->product[2]->name);

echo "<br>";
$xmlData = file_get_contents('new.xml');
$other = file_get_contents('myfile.txt');
echo $other;
$products = new SimpleXMLElement($xmlData);
echo $products->product[1]->id;
?>