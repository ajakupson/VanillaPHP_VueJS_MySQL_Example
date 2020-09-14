# VanillaPHP + VueJS + MySQL Example

```
project root/
├── index.php
├── back-end/ -- everything related to server side
│   ├── api/ -- ajax calls
│   │   └── task-2-insurance-calculator.php
│   ├── database/
│   │   ├── dev.sql -- queries used during development
|   |   ├── ajakupson database exoprt.sql -- export from phpMyAdmin
│   │   └── MySQL_Database.php
│   ├── models/ -- classes and DTOs
│   │   ├── Employee.php
│   │   ├── PolicyPrice.php
│   │   └── Instalements.php
│   └── utils/
│       ├── Utils.php
│       └── xConstants.php
├── front-end/ -- everything related to client side
│    app/
│        ├── app.js -- VueJS app
│        ├── build/
│        │    └── main.bundle.js -- compiled JavaScript used in index.php
│        ├── components/
│        │    ├── Task 1.js
│        │    ├── Task 2.js
│        │    ├── CalculationResult.js
│        │    └── Task 3.js
│        └── layouts/
│            └── TaskLayout.js
└─────── assets/ -- third party libs, custom styles, images and JS utils
         ├── css/
         │   └── ...
         ├── imgs/
         │   └── ...
         └── js/
             └── ...

```
  
