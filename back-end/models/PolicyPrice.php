<?php

require_once('Instalment.php');
require_once('./../utils/xConstants.php');

class PolicyPrice {

  public function __construct($carPrice = 100, $taxPrcntg = 0, $numOfInstalments = 1) {
    $this->carPrice = $carPrice;
    $this->instalments = array();
    $this->CalculatePolicyPrice($taxPrcntg, $numOfInstalments);
  }

  private $carPrice;
  private $totalBasePrice;
  private $totalCommision;
  private $totalTax;
  private $grandTotals;
  private $instalments;

  private function CalculatePolicyPrice($taxPrcntg = 0, $numOfInstalments = 1) {
    // TODO: check day and time
    $policyBasePricePercntg = POLICY_BASE_PRICE_NOT_FRIDAY_15_20;

    $this->totalBasePrice = $this->carPrice * $policyBasePricePercntg;
    $this->totalCommision = $this->totalBasePrice * COMMISION;
    $this->totalTax = $taxPrcntg / 100 * $this->totalBasePrice;
    $this->grandTotals = $this->totalBasePrice + $this->totalCommision + $this->totalTax;

    if($numOfInstalments > 1) {
        for($i = 0; $i < $numOfInstalments; $i++) {
        $instalment = new Instalment($this->totalBasePrice / $numOfInstalments, $this->totalCommision / $numOfInstalments,
                                    $this->totalTax / $numOfInstalments, $this->grandTotals / $numOfInstalments);

        $this->instalments[] = $instalment;
      }
    } else {
      $instalment = new Instalment($this->totalBasePrice, $this->totalCommision,
                                  $this->totalTax, $this->grandTotals);
      $this->instalments[] = $instalment;
    }

  }

  public function RoundEverythingUpToTwoDecimalPlaces() {
    $this->carPrice = sprintf('%0.2f', $this->carPrice);
    $this->totalBasePrice = sprintf('%0.2f', $this->totalBasePrice);
    $this->totalCommision = sprintf('%0.2f', $this->totalCommision);
    $this->totalTax = sprintf('%0.2f', $this->totalTax);
    $this->grandTotals = sprintf('%0.2f', $this->grandTotals);
    foreach($this->instalments as $key => $instalment) {
      $instalment->setBasePremium(sprintf('%0.2f', $instalment->getBasePremium()));
      $instalment->setCommission(sprintf('%0.2f', $instalment->getCommission()));
      $instalment->setTax(sprintf('%0.2f', $instalment->getTax()));
      $instalment->setGrandTotals(sprintf('%0.2f', $instalment->getGrandTotals()));
    }
  }

}

 ?>
