<?php

$my_xml = simplexml_load_file("employe.xml");

// echo $my_xml->employee[0]->name->first_name;
//echo $my_xml->employee[0]->name->first_name;



$my_new_xml = file_get_contents("employe.xml");
$em = new SimpleXMLElement($my_new_xml);
echo $em->employee[0]->name->first_name;

?>