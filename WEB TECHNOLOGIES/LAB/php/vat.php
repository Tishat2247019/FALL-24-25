<?php

$amount = 1400;
$vat_added = $amount + ($amount * (15 / 100));
echo "The price after adding VAT " . $vat_added . "<br>";

?>