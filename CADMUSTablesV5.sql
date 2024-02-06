-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CADMUS_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CADMUS_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CADMUS_db` DEFAULT CHARACTER SET utf8 ;
USE `CADMUS_db` ;

-- -----------------------------------------------------
-- Table `CADMUS_db`.`agencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`agencies` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `agency_name` VARCHAR(255) NOT NULL,
  `password` BLOB NOT NULL,
  `registered_timestamp` INT NOT NULL,
  `last_login_timestamp` INT NULL,
  `access_token` VARCHAR(255) NULL,
  `reports_processed` INT NOT NULL DEFAULT 0,
  `ePCR_provider` VARCHAR(45) NOT NULL,
  `nemsis_agency_name` VARCHAR(45) NOT NULL,
  `nemsis_agency_number` INT NOT NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`medics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`medics` (
  `medic_uid` INT NOT NULL AUTO_INCREMENT,
  `medic_name` VARCHAR(255) NOT NULL,
  `medic_email` VARCHAR(255) NOT NULL,
  `agencies_uid` INT NOT NULL,
  INDEX `fk_medics_agencies_idx` (`agencies_uid` ASC) VISIBLE,
  PRIMARY KEY (`medic_uid`),
  CONSTRAINT `fk_medics_agencies`
    FOREIGN KEY (`agencies_uid`)
    REFERENCES `CADMUS_db`.`agencies` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`reports` (
  `report_id` INT NOT NULL AUTO_INCREMENT,
  `vehicle_dispatch_gps_location` POINT NULL,
  `vehicle_dispatch_national_grid_location` VARCHAR(15) NULL,
  `beginning_odom_readings` FLOAT NULL,
  `on_scene_odom_readings` FLOAT NULL,
  `patient_destination_odom_readings` FLOAT NULL,
  `ending_odom_readings` FLOAT NULL,
  `response_mode_to_scene` INT NULL,
  `dispatch_priority` INT NULL,
  `call_time` DATETIME NULL,
  `unit_notified` DATETIME NULL,
  `dispatch_ack` DATETIME NULL,
  `unit_on_route` DATETIME NULL,
  `unit_arrived_on_scene` DATETIME NULL,
  `unit_arrived_at_patient` DATETIME NULL,
  `transfer_of_ems_care` DATETIME NULL,
  `unit_left_scene` DATETIME NULL,
  `arrival_at_dest_landing_area` DATETIME NULL,
  `patient_at_destination` DATETIME NULL,
  `destination_transfer_of_care` DATETIME NULL,
  `unit_back_in_service` DATETIME NULL,
  `unit_cancelled` DATETIME NULL,
  `unit_home` DATETIME NULL,
  `ems_call_completed` DATETIME NULL,
  `arrival_at_staging` DATETIME NULL,
  `pcs` TINYINT NULL,
  `pcs_signed` TINYINT NULL,
  `milage_to_closest_hospital` FLOAT NULL,
  `num_patients_at_scene` INT NULL,
  `scene_gps_location` POINT NULL,
  `scene_national_grid_coordinates` VARCHAR(15) NULL,
  `primary_symptom` VARCHAR(45) NULL,
  `primary_impression` VARCHAR(45) NULL,
  `cardiac_arrest` INT NULL,
  `resuscitation_attempted` INT NULL,
  `return_of_circulation` INT NULL,
  `time_of_resuscitation` DATETIME NULL,
  `resuscitation_discontinued` DATETIME NULL,
  `initial_time_of_cpr` DATETIME NULL,
  `medical_history` VARCHAR(45) NULL,
  `destination_gps_location` POINT NULL,
  `destination_national_grid_location` VARCHAR(15) NULL,
  `num_patients_transported` INT NULL,
  `level_of_care_provided` INT NULL,
  `reportscol` VARCHAR(45) NULL,
  `narrative` TEXT NULL,
  `dispatch_to_scene_odom` FLOAT NULL,
  `dispatch_to_patient_dest_odom` FLOAT NULL,
  `dispatch_to_end_odom` FLOAT NULL,
  `on_scene_to_end_odom` FLOAT NULL,
  `call_notified_time` INT NULL,
  `notified_to_en_route_time` INT NULL,
  `driving_time` INT NULL,
  `notified_to_complete_time` INT NULL,
  `scene_to_patient_time` INT NULL,
  `total_on_scene_time` INT NULL,
  `patient_to_destination_time` INT NULL,
  `care_by_crew_time` INT NULL,
  `recovery_time` INT NULL,
  `response_mode_matches_level_of_care_test` TINYINT NOT NULL DEFAULT 0,
  `pcs_obtained_for_bls` TINYINT NOT NULL DEFAULT 0,
  `pcs_has_signature_test` TINYINT NOT NULL DEFAULT 0,
  `dispatch_priority_matches_dispatch_test` TINYINT NOT NULL DEFAULT 0,
  `pcs_date_test` TINYINT NOT NULL DEFAULT 0,
  `time_test` TINYINT NOT NULL DEFAULT 0,
  `arrest_test` TINYINT NOT NULL DEFAULT 0,
  `vitals_test` TINYINT NOT NULL DEFAULT 0,
  `procedures_valid_test` TINYINT NOT NULL DEFAULT 0,
  `closest_hospital_chosen_test` TINYINT NOT NULL DEFAULT 0,
  `odom_to_dest_test` TINYINT NOT NULL DEFAULT 0,
  `odom_to_scene_test` TINYINT NOT NULL DEFAULT 0,
  `pcs_symptom_test` TINYINT NOT NULL DEFAULT 0,
  `pcs_impression_test` TINYINT NOT NULL DEFAULT 0,
  `failed_to_resuscitate_test` TINYINT NOT NULL DEFAULT 0,
  `medical_history_test` TINYINT NOT NULL DEFAULT 0,
  `medication_history_test` TINYINT NOT NULL DEFAULT 0,
  `two_sets_vitals_test` TINYINT NOT NULL DEFAULT 0,
  `pain_scale_test` TINYINT NOT NULL DEFAULT 0,
  `ecg_recorded_output_test` TINYINT NOT NULL DEFAULT 0,
  `narrative_exists` TINYINT NOT NULL DEFAULT 0,
  `agencies_uid` INT NOT NULL,
  PRIMARY KEY (`report_id`),
  INDEX `fk_reports_agencies1_idx` (`agencies_uid` ASC) VISIBLE,
  CONSTRAINT `fk_reports_agencies1`
    FOREIGN KEY (`agencies_uid`)
    REFERENCES `CADMUS_db`.`agencies` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`associated_symptoms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`associated_symptoms` (
  `reports_report_id` INT NOT NULL,
  `associated_symptom` VARCHAR(45) NOT NULL,
  INDEX `fk_associated_symptoms_reports1_idx` (`reports_report_id` ASC) VISIBLE,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_associated_symptoms_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`secondary_impressions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`secondary_impressions` (
  `reports_report_id` INT NOT NULL,
  `secondary_impressions` VARCHAR(45) NOT NULL,
  INDEX `fk_secondary_impressions_reports1_idx` (`reports_report_id` ASC) VISIBLE,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_secondary_impressions_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`current_medications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`current_medications` (
  `reports_report_id` INT NOT NULL,
  `medication` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_current_medications_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`vitals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`vitals` (
  `reports_report_id` INT NOT NULL,
  `time_vitals_taken` DATETIME NULL,
  `systolic_blood_pressure` INT NULL,
  `diastolic_blood_pressure` INT NULL,
  `heart_rate` INT NULL,
  `pain_scale` INT NULL,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_vitals_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`protocols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`protocols` (
  `reports_report_id` INT NOT NULL,
  `protocol` INT NOT NULL,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_protocols_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`procedures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`procedures` (
  `reports_report_id` INT NOT NULL,
  `procedure_time` DATETIME NULL,
  `procedure_code` INT NOT NULL,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_procedures_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`devices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`devices` (
  `reports_report_id` INT NOT NULL,
  `time_of_event` DATETIME NULL,
  `event_type` INT NOT NULL,
  `contains_waveform` TINYINT NOT NULL,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_devices_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`emergency_dept_analysis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`emergency_dept_analysis` (
  `reports_report_id` INT NOT NULL,
  `emergency_dept_analysis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_table1_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CADMUS_db`.`hospital_diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CADMUS_db`.`hospital_diagnosis` (
  `reports_report_id` INT NOT NULL,
  `hospital_diagnosis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reports_report_id`),
  CONSTRAINT `fk_hospital_diagnosis_reports1`
    FOREIGN KEY (`reports_report_id`)
    REFERENCES `CADMUS_db`.`reports` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
