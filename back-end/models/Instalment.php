<?php

  class Instalment {

    public function __construct($basePremium = 0, $commission = 0, $tax = 0, $grandTotals = 0) {
      $this->basePremium = $basePremium;
      $this->commission = $commission;
      $this->tax = $tax;
      $this->grandTotals = $grandTotals;
    }

    private $basePremium;
    private $commission;
    private $tax;
    private $grandTotals;

    public function getBasePremium() {
      return $this->basePremium;
    }
    public function setBasePremium($basePremium) {
      $this->basePremium = $basePremium;
    }

    public function getCommission() {
      return $this->commission;
    }
    public function setCommission($commission) {
      $this->commission = $commission;
    }

    public function getTax() {
      return $this->tax;
    }
    public function setTax($tax) {
      $this->tax = $tax;
    }

    public function getGrandTotals() {
      return $this->grandTotals;
    }
    public function setGrandTotals($grandTotals) {
      $this->grandTotals = $grandTotals;
    }

  }

 ?>
