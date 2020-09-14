<?php

class Employee {
  private $id;
  private $name;
  private $birthDate;
  private $iDCodeSsn;
  private $isCurrentEmployee;
  private $contactInformation;
  private $employeeIntroduction;
  private $employeeWorkExperience;
  private $employeeEducation;

  function __construct($id, $name, $birthDate, $iDCodeSsn, $isCurrentEmployee, $contactInformation, $employeeIntroduction,
                       $employeeWorkExperience, $employeeEducation) {
    $this->id = $id;
    $this->name = $name;
    $this->birthDate = $birthDate;
    $this->iDCodeSsn = $iDCodeSsn;
    $this->isCurrentEmployee = $isCurrentEmployee;
    $this->contactInformation = $contactInformation;
    $this->employeeIntroduction = utf8_encode($employeeIntroduction);
    $this->employeeWorkExperience = utf8_encode($employeeWorkExperience);
    $this->employeeEducation = utf8_encode($employeeEducation);
  }
}

?>
