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
    <task-3-mysql></task-3-mysql>
  </main>
  <!-- development version, includes helpful console warnings -->
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <script src="front-end/app/build/main.bundle.js"></script>
</body>
</html>
