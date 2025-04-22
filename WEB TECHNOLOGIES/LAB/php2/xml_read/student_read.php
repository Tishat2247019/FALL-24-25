<?php

$student_data = file_get_contents("./student.xml");
$students = new SimpleXMLElement($student_data);

echo $students->student[0]->address->add2->city;


?>