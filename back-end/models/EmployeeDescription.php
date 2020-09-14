<?php

class EmployeeDescription {
  private $id;
  private $employeeId;
  private $introduction;
  private $workExperience;
  private $education;
  private $language;

  function __construct($id, $employeeId, $introduction, $workExperience, $education, $language) {
    $this->id = $id;
    $this->employeeId = $employeeId;
    $this->introduction = $introduction;
    $this->workExperience = $workExperience;
    $this->education = $education;
    $this->language = $language;
  }

}

 ?>
