/* Database */
CREATE DATABASE IF NOT EXISTS `ajakupson_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ajakupson_database`;


/* Tables */
CREATE TABLE `ajakupson_database`.`employees`
(
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `birthdate` DATE NOT NULL,
  `id_code_ssn` VARCHAR(30) NOT NULL,
  `is_current_employee` BOOLEAN NOT NULL DEFAULT FALSE,
  `contact_information` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE `ID_SSN_INDX` (`id_code_ssn`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `ajakupson_database`.`employees_description`
(
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `employee_id` INT(11) UNSIGNED NOT NULL ,
  `introduction` TEXT NOT NULL ,
  `work_experience` TEXT NOT NULL ,
  `education` TEXT NOT NULL ,
  `language` VARCHAR(5) NOT NULL DEFAULT 'en-us' ,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `ajakupson_database`.`employees_description`
ADD CONSTRAINT `fk_description_has_employees`
FOREIGN KEY (`employee_id`)
REFERENCES `ajakupson_database`.`employees`(`id`)
ON DELETE CASCADE
ON UPDATE CASCADE;

CREATE TABLE `ajakupson_database`.`data_changes_log`
(
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `user` VARCHAR(150) NOT NULL ,
  `event_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `action` VARCHAR(20) NOT NULL ,
  `table` VARCHAR(50) NOT NULL,
  `record_id` INT(11) NOT NULL,
  `old_val` JSON NULL,
  `new_val` JSON NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci;


/* Triggers */
CREATE TRIGGER employee_data_insert AFTER INSERT ON `ajakupson_database`.`employees`
  FOR EACH ROW
    INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`)
    VALUES(USER(), "INSERT", "employees", NEW.id);

CREATE TRIGGER employee_data_update AFTER UPDATE ON `ajakupson_database`.`employees`
  FOR EACH ROW
    INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`, `old_val`, `new_val`)
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
    );

CREATE TRIGGER employee_data_delete AFTER DELETE ON `ajakupson_database`.`employees`
  FOR EACH ROW
    INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`, `old_val`)
    VALUES(
      USER(), "DELETE", "employees", OLD.id,
      JSON_OBJECT(
        "name", OLD.name,
        "birthdate", OLD.birthdate,
        "id_code_ssn", OLD.id_code_ssn,
        "is_current_employee", OLD.is_current_employee,
        "contact_information", OLD.contact_information
      )
    );

CREATE TRIGGER employee_description_insert AFTER INSERT ON `ajakupson_database`.`employees_description`
  FOR EACH ROW
    INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`)
    VALUES(USER(), "INSERT", "employees_description", NEW.id);

CREATE TRIGGER employee_description_update AFTER UPDATE ON `ajakupson_database`.`employees_description`
  FOR EACH ROW
    INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`, `old_val`, `new_val`)
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
    );

CREATE TRIGGER employee_description_delete AFTER DELETE ON `ajakupson_database`.`employees_description`
  FOR EACH ROW
    INSERT INTO `ajakupson_database`.`data_changes_log` (`user`, `action`, `table`, `record_id`, `old_val`)
    VALUES(
      USER(), "DELETE", "employees_description", OLD.id,
      JSON_OBJECT(
        "employee_id", OLD.employee_id,
        "introduction", OLD.introduction,
        "work_experience", OLD.work_experience,
        "education", OLD.education
      )
    );
