# VanillaPHP_VueJS_MySQL_Example           

project_root/\
├── index.php\
├── back-end/ -- everything related to server side\
│   ├── api/ -- ajax calls\
│   │   └── task-2-insurance-calculator.php\
│   ├── database/\
│   │   ├── dev.sql -- queries used during development\
│   │   └── ajakupson_database_exoprt.sql -- export from phpMyAdmin\
│   ├── models/ -- classes and DTOs\
│   │   ├── Employee.php\
│   │   ├── PolicyPrice.php\
│   │   └── Instalements.php\
│   └── utils/\
│       ├── Utils.php\
│       └── xConstants.php\
├── front-end/ -- everything related to client side\
│    app/\
│        ├── app.js -- VueJS app\
│        ├── build/\
│        │    └── main.bundle.js -- compiled JavaScript used in index.php\
│        ├── components/\
│        │    ├── Task_1.js\
│        │    ├── Task_2.js\
│        │    ├── CalculationResult.js\
│        │    └── Task_3.js\
│        └── layouts/\
│            └── TaskLayout.js\
└─────── assets/ -- third party libs, custom styles, images and JS utils\
        ├── css\
        │    └── ...\
        ├── imgs
        │    └── ...\
        └── js\
            └── ...\ 
