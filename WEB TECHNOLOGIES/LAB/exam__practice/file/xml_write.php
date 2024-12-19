<?php

$my_xml = new SimpleXMLElement("<users/>");

$user1 = $my_xml->addChild("user");
$user1->addChild("name","opi jan");
$user1->addChild("email","jan opi @gmial.com");
$user1->addChild("chummi","accha sorry");

file_put_contents("user_info.xml", $my_xml ->asXML());


?>