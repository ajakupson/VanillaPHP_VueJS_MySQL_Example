<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Vanilla PHP, VueJS, MySQL, Bootstrap Example</title>
  <meta name="description" content="Vanilla PHP, VueJS, MySQL, Bootstrap Example">
  <meta name="Andrei Jakupson" content="SitePoint">

  <link rel="stylesheet" href="front-end/assets/css/third_party/bootstrap-4.5.2-dist/bootstrap.css">
  <link rel="stylesheet" href="front-end/assets/css/common.css">
</head>

<body>
  <main id="app" role="main">
    <h1 class="jumbotron">Vanilla PHP, VueJS, MySQL, Bootstrap Example</h1>
    <task-1-name></task-1-name>
    <?php
      $fullName = "Andrei Jakupson";
      $chars = str_split($fullName);
      echo "<div class='container'><h3>";
      foreach($chars as $char){
          echo $char;
      }
      echo "</h3></div>";
    ?>
    <task-2-calculator></task-2-calculator>
    <task-3-mysql>
      <?php
        error_reporting(E_ERROR | E_PARSE);

        try {
          require_once('./back-end/database/MySQL_Database.php');
          require_once('./back-end/utils/Utils.php');

          $mySqlDb = new MySQL_Database("localhost", "root", "TiAsGa90", "ajakupson_database");
          $isDbConnected = $mySqlDb->getConnectionStatus();

          if(!$isDbConnected) {
            echo '<div class="alert alert-danger">
                    <p>No connection with the DataBase!</p>
                    <p>
                      Can\'t execute the following query
                      <div class="alert alert-dark">SELECT * FROM employees e INNER JOIN employees_description ed ON e.id = ed.employee_id WHERE e.id = (SELECT MIN(id) FROM employees)</div>
                      to get 1-person data in all languages
                    </p>
                  </div>';
          } else {
            echo '<div class="alert alert-success">
                    <p>Connection with DataBase established!</p>
                    <p>
                      Executing the following query
                      <div class="alert alert-dark">SELECT * FROM employees e INNER JOIN employees_description ed ON e.id = ed.employee_id WHERE e.id = (SELECT MIN(id) FROM employees)</div>
                      to get 1-person data in all languages
                    </p>
                  </div>';
                  $employeeRecords = $mySqlDb->getFirstEmployeeDataInAllLanguages();

                  echo '<div class="alert alert-dark">
                          <p><strong>Data in JSON format:</strong></p>';
                            for($i = 0; $i < sizeof($employeeRecords); $i++) {
                              echo '<p>'.unicode_decode(jsonEncodePrivate($employeeRecords[$i])).'</p>';
                            }
                  echo '</div>';
          }
        } catch (\Throwable $e) { // For PHP 7
          echo '<div class="alert alert-danger">'.$e->getMessage().'</div>';
        } catch (\Exception $e) { // For PHP 5
          echo '<div class="alert alert-danger">'.$e->getMessage().'</div>';
        }
      ?>
    </task-3-mysql>
  </main>
  <footer class="footer mt-auto py-3">
    <h3>Vanilla PHP, VueJS, MySQL, Bootstrap Example</h3>
  </footer>
  <!-- development version, includes helpful console warnings -->
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <script src="front-end/app/build/main.bundle.js"></script>
</body>
</html>
