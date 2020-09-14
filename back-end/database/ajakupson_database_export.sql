-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2020 at 11:07 PM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajakupson_database`
--
CREATE DATABASE IF NOT EXISTS `ajakupson_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ajakupson_database`;

-- --------------------------------------------------------

--
-- Table structure for table `data_changes_log`
--

CREATE TABLE `data_changes_log` (
  `id` int(11) NOT NULL,
  `user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `table` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int(11) NOT NULL,
  `old_val` json DEFAULT NULL,
  `new_val` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `id_code_ssn` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `is_current_employee` tinyint(1) NOT NULL DEFAULT '0',
  `contact_information` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `birthdate`, `id_code_ssn`, `is_current_employee`, `contact_information`) VALUES
(1, 'Aleksandr Anisimov', '1985-05-15', '38505153456', 0, 'email: aleksanisimov@gmail.com; phone: +37256789789; address: Estonia, Tallinn, Tartu maantee 5-27 ');

--
-- Triggers `employees`
--
DELIMITER $$
CREATE TRIGGER `employee_data_delete` AFTER DELETE ON `employees` FOR EACH ROW INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`, `old_val`)
    VALUES(
      USER(), "DELETE", "employees", OLD.id,
      JSON_OBJECT(
        "name", OLD.name,
        "birthdate", OLD.birthdate,
        "id_code_ssn", OLD.id_code_ssn,
        "is_current_employee", OLD.is_current_employee,
        "contact_information", OLD.contact_information
      )
    )
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `employee_data_insert` AFTER INSERT ON `employees` FOR EACH ROW INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`)
    VALUES(USER(), "INSERT", "employees", NEW.id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `employee_data_update` AFTER UPDATE ON `employees` FOR EACH ROW INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`, `old_val`, `new_val`)
    VALUES(
      USER(), "UPDATE", "employees", NEW.id,
      JSON_OBJECT(
        "name", OLD.name,
        "birthdate", OLD.birthdate,
        "id_code_ssn", OLD.id_code_ssn,
        "is_current_employee", OLD.is_current_employee,
        "contact_information", OLD.contact_information
      ),
      JSON_OBJECT(
        "name", NEW.name,
        "birthdate", NEW.birthdate,
        "id_code_ssn", NEW.id_code_ssn,
        "is_current_employee", NEW.is_current_employee,
        "contact_information", NEW.contact_information
      )
    )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees_description`
--

CREATE TABLE `employees_description` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) UNSIGNED NOT NULL,
  `introduction` text COLLATE utf8_unicode_ci NOT NULL,
  `work_experience` text COLLATE utf8_unicode_ci NOT NULL,
  `education` text COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en-us'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees_description`
--

INSERT INTO `employees_description` (`id`, `employee_id`, `introduction`, `work_experience`, `education`, `language`) VALUES
(1, 1, 'This is introduction of employee Aleksandr Anisimov (en-us)', 'This is workexperience of employee Aleksandr Anisimov (en-us)', 'This is education of employee Aleksandr Anisimov (en-us)', 'en-us'),
(2, 1, 'Esta es la introducción del empleado Aleksandr Anisimov (es)', 'Esta es la experiencia laboral del empleado Aleksandr Anisimov (es)', 'Esta es la educación del empleado Aleksandr Anisimov (es)', 'es'),
(3, 1, 'C\'est l\'introduction au travail de l\'employé Aleksandr Anisimov (fr)', 'C\'est l\'expérience de travail de l\'employé Aleksandr Anisimov (fr)', 'C\'est la formation professionnelle de l\'employé Aleksandr Anisimov (fr)', 'fr');

--
-- Triggers `employees_description`
--
DELIMITER $$
CREATE TRIGGER `employee_description_delete` AFTER DELETE ON `employees_description` FOR EACH ROW INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`, `old_val`)
    VALUES(
      USER(), "DELETE", "employees_description", OLD.id,
      JSON_OBJECT(
        "employee_id", OLD.employee_id,
        "introduction", OLD.introduction,
        "work_experience", OLD.work_experience,
        "education", OLD.education
      )
    )
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `employee_description_insert` AFTER INSERT ON `employees_description` FOR EACH ROW INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`)
    VALUES(USER(), "INSERT", "employees_description", NEW.id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `employee_description_update` AFTER UPDATE ON `employees_description` FOR EACH ROW INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`, `old_val`, `new_val`)
    VALUES(
      USER(), "UPDATE", "employees_description", NEW.id,
      JSON_OBJECT(
        "employee_id", OLD.employee_id,
        "introduction", OLD.introduction,
        "work_experience", OLD.work_experience,
        "education", OLD.education
      ),
      JSON_OBJECT(
        "employee_id", NEW.employee_id,
        "introduction", NEW.introduction,
        "work_experience", NEW.work_experience,
        "education", NEW.education
      )
    )
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_changes_log`
--
ALTER TABLE `data_changes_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_SSN_INDX` (`id_code_ssn`);

--
-- Indexes for table `employees_description`
--
ALTER TABLE `employees_description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_description_has_employees` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_changes_log`
--
ALTER TABLE `data_changes_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employees_description`
--
ALTER TABLE `employees_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees_description`
--
ALTER TABLE `employees_description`
  ADD CONSTRAINT `fk_description_has_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
