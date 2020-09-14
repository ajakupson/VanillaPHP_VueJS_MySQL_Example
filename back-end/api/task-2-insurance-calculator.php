<?php
require_once('./../models/PolicyPrice.php');
require_once('./../utils/Utils.php');

$_POST = json_decode(file_get_contents('php://input'));
$formData = $_POST->formData;

$carPrice = $formData->estimatedCarPrice;
$taxPrcntg = $formData->taxPercentage;
$numOfInstalments = $formData->numOfInstalments;
$basePricePrcntg = $formData->basePricePrcntg;

$policyPrice = new PolicyPrice($carPrice, $basePricePrcntg, $taxPrcntg, $numOfInstalments);
$policyPrice->RoundEverythingUpToTwoDecimalPlaces();

$response = jsonEncodePrivate($policyPrice);
echo $response;
//return $response;


//var_dump($postData);

 ?>
