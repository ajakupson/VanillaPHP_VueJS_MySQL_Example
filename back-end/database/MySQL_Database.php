<?php
require_once('./back-end/models/Employee.php');

class MySQL_Database
{
    private $con;
    private $db_host;
    private $db_name;
    private $db_user;
    private $db_pass;
    private $result;

    function __construct($db_host="localhost", $db_user="root", $db_pass="TiAsGa90", $db_name="ajakupson_database") {
        $this->db_host = $db_host;
        $this->db_name = $db_name;
        $this->db_user = $db_user;
        $this->db_pass = $db_pass;

        $this->con = mysqli_connect($this->db_host, $this->db_user, $this->db_pass, $this->db_name);
    }

    public function getConnectionStatus() {
      return $this->con;
    }

    public function getFirstEmployeeDataInAllLanguages() {
      $query = "SELECT * FROM employees e INNER JOIN employees_description ed ON e.id = ed.employee_id WHERE e.id = (SELECT MIN(id) FROM employees)";
      $this->result = mysqli_query($this->con, $query);
      $rows = mysqli_num_rows($this->result);
      $data = array();
      for($r = 0; $r < $rows; $r++)
      {
        $data[] = mysqli_fetch_row($this->result);
      }
      return $this->convertEmployeeDataToModels($data);
    }

    private function convertEmployeeDataToModels($arrayOfData) {
      $employeeRecords = array();
      foreach($arrayOfData as $key => $record) {
        $employee = new Employee($record[0], $record[1], $record[2], $record[3], $record[4], $record[5], $record[8], $record[9], $record[10]);
        $employeeRecords[] = $employee;
      }
      return $employeeRecords;
    }
}

?>
