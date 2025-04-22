<?php

$day = $_GET["day_input"];
$month = $_GET["month_input"];
$year = $_GET["year_input"];

$check_day = false;
for ($i = 1; $i <= 31; $i++){
    if($day == $i){
        $check_day = true;
        break;
    }
}

$check_month = false;
for ($i = 1; $i <= 12; $i++){
    if($day == $i){
        $check_month = true;
        break;
    }
}

$check_year = false;
for( $i = 1953 ; $i <=1998 ; $i++){
    if($year == $i){
        $check_year = true;
        break;
}
}

if(empty($day) || empty($month) || empty($year)) { 
    echo "can not be empty";
 }
 else if($check_day == false){
    echo "day must be in between 1 -31";    
 }
 else if($check_month == false){
    echo "month must be in between 1 - 12";
 }
 else if($check_year == false){
    echo "year must be in between 1953 - 1998";
 }


?>