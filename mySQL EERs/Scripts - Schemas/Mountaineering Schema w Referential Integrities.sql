-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mountaineering
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mountaineering` ;

-- -----------------------------------------------------
-- Schema mountaineering
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mountaineering` DEFAULT CHARACTER SET utf8 ;
USE `mountaineering` ;

-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack` (
  `climbing_rack_id` INT NOT NULL,
  `climbing_rack_weight` DOUBLE NULL,
  PRIMARY KEY (`climbing_rack_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_nuts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_nuts` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_nuts` (
  `nuts_id` INT NOT NULL,
  `nuts_type` ENUM('N/A', 'Regular', 'Brassies', 'Offsets', 'Micros') NOT NULL,
  `nuts_size` INT(11) NOT NULL,
  `nuts_company` VARCHAR(45) NULL,
  `nuts_brand` VARCHAR(45) NULL,
  `nuts_weight` DOUBLE NULL COMMENT 'oz',
  `nuts_size_min` INT(11) NULL COMMENT 'mm',
  `nuts_size_max` INT(11) NULL COMMENT 'mm',
  PRIMARY KEY (`nuts_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_tricams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_tricams` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_tricams` (
  `tricams_id` INT NOT NULL,
  `tricams_color` VARCHAR(45) NULL,
  `tricams_size` INT(11) NOT NULL,
  `tricams_company` VARCHAR(45) NULL,
  `tricams_weight` DOUBLE NULL COMMENT 'OZ',
  `tricams_size_min` INT(11) NULL COMMENT 'mm',
  `tricams_size_max` INT(11) NULL COMMENT 'mm',
  PRIMARY KEY (`tricams_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_hexes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_hexes` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_hexes` (
  `hexes_id` INT NOT NULL,
  `hexes_color` VARCHAR(45) NULL,
  `hexes_size` INT(11) NOT NULL,
  `hexes_company` VARCHAR(45) NULL,
  `hexes_weight` DOUBLE NULL COMMENT 'OZ',
  `hexes_size_min` INT(11) NULL COMMENT 'mm',
  `hexes_size_max` INT(11) NULL COMMENT 'mm',
  PRIMARY KEY (`hexes_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_SLCDs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_SLCDs` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_SLCDs` (
  `SLCD_id` INT NOT NULL,
  `SLCD_color` VARCHAR(45) NULL,
  `SLCD_size` INT(11) NOT NULL,
  `SLCD_company` VARCHAR(45) NULL,
  `SLCD_weight` DOUBLE NULL COMMENT 'OZ',
  `SLCD_size_min` INT(11) NULL COMMENT 'mm',
  `SLCD_size_max` INT(11) NULL COMMENT 'mm',
  `SLCD_brand` VARCHAR(45) NULL,
  `SLCD_type` ENUM('N/A', 'Regular', 'Offset', 'Valley Giant') NOT NULL,
  PRIMARY KEY (`SLCD_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_slings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_slings` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_slings` (
  `sling_id` INT NOT NULL,
  `sling_type` ENUM('N/A', 'Single', 'Double', 'Triple', 'Other') NOT NULL,
  `sling_length` INT(11) NULL COMMENT 'in',
  `sling_weight` DOUBLE NULL COMMENT 'oz',
  `sling_size_category` ENUM('N/A', 'Cordalette', 'Webbing - Sewn Spectra', 'Webbing - Sewn 1in', 'Webbing - Tied 1in', 'Rabbit Runner') NOT NULL,
  PRIMARY KEY (`sling_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_big_bros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_big_bros` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_big_bros` (
  `big_bro_id` INT NOT NULL,
  `big_bro_color` VARCHAR(45) NULL,
  `big_bro_size` INT(11) NOT NULL,
  `big_bro_weight` DOUBLE NULL COMMENT 'oz',
  PRIMARY KEY (`big_bro_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_to_nuts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_to_nuts` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_to_nuts` (
  `climbing_rack_id` INT NOT NULL,
  `nuts_id` INT NOT NULL,
  `nuts_quantity` INT NOT NULL,
  `notes` VARCHAR(45) NULL,
  `nuts_quantity_optional` INT NULL,
  `notes_quantity_optional` VARCHAR(45) NULL,
  PRIMARY KEY (`climbing_rack_id`, `nuts_id`),
  INDEX `fk_climbing_rack_to_nuts_climbing_rack_nuts_idx` (`nuts_id` ASC),
  INDEX `fk_climbing_rack_to_nuts_climbing_rack1_idx` (`climbing_rack_id` ASC),
  CONSTRAINT `fk_climbing_rack_to_nuts_climbing_rack_nuts`
    FOREIGN KEY (`nuts_id`)
    REFERENCES `mountaineering`.`climbing_rack_nuts` (`nuts_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_climbing_rack_to_nuts_climbing_rack1`
    FOREIGN KEY (`climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_to_tricams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_to_tricams` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_to_tricams` (
  `climbing_rack_id` INT NOT NULL,
  `tricams_id` INT NOT NULL,
  `tricams_quantity` INT NOT NULL,
  `notes` VARCHAR(45) NULL,
  `tricams_quantity_optional` INT NULL,
  `notes_quantity_optional` VARCHAR(45) NULL,
  PRIMARY KEY (`climbing_rack_id`, `tricams_id`),
  INDEX `fk_climbing_rack_to_tricams_climbing_rack1_idx` (`climbing_rack_id` ASC),
  CONSTRAINT `fk_climbing_rack_to_tricams_climbing_rack_tricams1`
    FOREIGN KEY (`tricams_id`)
    REFERENCES `mountaineering`.`climbing_rack_tricams` (`tricams_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_climbing_rack_to_tricams_climbing_rack1`
    FOREIGN KEY (`climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_to_hexes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_to_hexes` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_to_hexes` (
  `climbing_rack_id` INT NOT NULL,
  `hexes_id` INT NOT NULL,
  `hexes_quantity` INT NOT NULL,
  `notes` VARCHAR(45) NULL,
  `hexes_quantity_optional` INT NULL,
  `notes_quantity_optional` VARCHAR(45) NULL,
  PRIMARY KEY (`climbing_rack_id`, `hexes_id`),
  INDEX `fk_climbing_rack_to_hexes_climbing_rack1_idx` (`climbing_rack_id` ASC),
  CONSTRAINT `fk_climbing_rack_to_hexes_climbing_rack_hexes1`
    FOREIGN KEY (`hexes_id`)
    REFERENCES `mountaineering`.`climbing_rack_hexes` (`hexes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_climbing_rack_to_hexes_climbing_rack1`
    FOREIGN KEY (`climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_to_SLCDs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_to_SLCDs` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_to_SLCDs` (
  `climbing_rack_id` INT NOT NULL,
  `SLCD_id` INT NOT NULL,
  `SLCD_quantity` INT NOT NULL,
  `notes` VARCHAR(45) NULL,
  `SLCD_quantity_optional` INT NULL,
  `notes_quantity_optional` VARCHAR(45) NULL,
  PRIMARY KEY (`climbing_rack_id`, `SLCD_id`),
  INDEX `fk_climbing_rack_to_SLCDs_climbing_rack1_idx` (`climbing_rack_id` ASC),
  CONSTRAINT `fk_climbing_rack_to_SLCDs_climbing_rack_SLCDs1`
    FOREIGN KEY (`SLCD_id`)
    REFERENCES `mountaineering`.`climbing_rack_SLCDs` (`SLCD_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_climbing_rack_to_SLCDs_climbing_rack1`
    FOREIGN KEY (`climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_to_slings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_to_slings` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_to_slings` (
  `climbing_rack_id` INT NOT NULL,
  `sling_id` INT NOT NULL,
  `slings_quantity` INT NOT NULL,
  `notes` VARCHAR(45) NULL,
  `slings_quantity_optional` INT NULL,
  `notes_quantity_optional` VARCHAR(45) NULL,
  PRIMARY KEY (`climbing_rack_id`, `sling_id`),
  INDEX `fk_climbing_rack_to_slings_climbing_rack1_idx` (`climbing_rack_id` ASC),
  CONSTRAINT `fk_climbing_rack_to_slings_climbing_rack_slings1`
    FOREIGN KEY (`sling_id`)
    REFERENCES `mountaineering`.`climbing_rack_slings` (`sling_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_climbing_rack_to_slings_climbing_rack1`
    FOREIGN KEY (`climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`climbing_rack_to_big_bros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`climbing_rack_to_big_bros` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`climbing_rack_to_big_bros` (
  `climbing_rack_id` INT NOT NULL,
  `big_bro_id` INT NOT NULL,
  `big_bros_quantity` INT NOT NULL,
  `notes` VARCHAR(45) NULL,
  `big_bros_quantity_optional` INT NULL,
  `notes_quantity_optional` VARCHAR(45) NULL,
  PRIMARY KEY (`climbing_rack_id`, `big_bro_id`),
  INDEX `fk_climbing_rack_to_slings_climbing_rack1_idx` (`climbing_rack_id` ASC),
  INDEX `fk_climbing_rack_to_slings_copy1_climbing_rack_big_bros1_idx` (`big_bro_id` ASC),
  CONSTRAINT `fk_climbing_rack_to_slings_climbing_rack10`
    FOREIGN KEY (`climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_climbing_rack_to_slings_copy1_climbing_rack_big_bros1`
    FOREIGN KEY (`big_bro_id`)
    REFERENCES `mountaineering`.`climbing_rack_big_bros` (`big_bro_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`map_resources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`map_resources` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`map_resources` (
  `map_resources_id` INT NOT NULL,
  `map_resources_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`map_resources_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`elevation_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`elevation_profiles` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`elevation_profiles` (
  `elevation_profiles_id` INT NOT NULL,
  `elevation_profiles_title` VARCHAR(45) NOT NULL,
  `elevation_profiles_url` VARCHAR(45) NULL,
  `elevation_profiles_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `elevation_profiles_tasks` VARCHAR(45) NULL,
  PRIMARY KEY (`elevation_profiles_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`map_resources_to_elevation_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`map_resources_to_elevation_profiles` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`map_resources_to_elevation_profiles` (
  `elevation_profiles_id` INT NOT NULL,
  `map_resources_id` INT NOT NULL,
  PRIMARY KEY (`elevation_profiles_id`, `map_resources_id`),
  INDEX `fk_map_resources_to_elevation_profiles_map_resources1_idx` (`map_resources_id` ASC),
  CONSTRAINT `fk_map_resources_to_elevation_profiles_elevation_profiles1`
    FOREIGN KEY (`elevation_profiles_id`)
    REFERENCES `mountaineering`.`elevation_profiles` (`elevation_profiles_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_map_resources_to_elevation_profiles_map_resources1`
    FOREIGN KEY (`map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`maps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`maps` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`maps` (
  `map_id` INT NOT NULL,
  `map_title` VARCHAR(45) NOT NULL,
  `map_url` VARCHAR(45) NULL,
  `map_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `map_tasks` VARCHAR(45) NULL,
  PRIMARY KEY (`map_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`files_topo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`files_topo` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`files_topo` (
  `topo_file_id` INT NOT NULL,
  `topo_file_title` VARCHAR(45) NOT NULL,
  `topo_file_url` VARCHAR(45) NULL,
  `topo_file_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `topo_file_tasks` VARCHAR(45) NULL,
  PRIMARY KEY (`topo_file_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`files_ge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`files_ge` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`files_ge` (
  `ge_file_id` INT NOT NULL,
  `ge_file_title` VARCHAR(45) NOT NULL,
  `ge_file_url` VARCHAR(45) NULL,
  `ge_file_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `ge_file_tasks` VARCHAR(45) NULL,
  PRIMARY KEY (`ge_file_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`files_gpx`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`files_gpx` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`files_gpx` (
  `gpx_file_id` INT NOT NULL,
  `gpx_file_title` VARCHAR(45) NOT NULL,
  `gpx_file_url` VARCHAR(45) NULL,
  `gpx_file_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `gpx_file_tasks` VARCHAR(45) NULL,
  PRIMARY KEY (`gpx_file_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`annotated_images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`annotated_images` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`annotated_images` (
  `annotated_images_id` INT NOT NULL,
  `annotated_images_title` VARCHAR(45) NOT NULL,
  `annotated_images_url` VARCHAR(45) NULL,
  `annotated_images_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `annotated_images_tasks` VARCHAR(45) NULL,
  PRIMARY KEY (`annotated_images_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`route_topos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`route_topos` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`route_topos` (
  `route_topo_id` INT NOT NULL,
  `route_topo_title` VARCHAR(45) NOT NULL,
  `route_topo_url` VARCHAR(45) NULL,
  `route_topo_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `route_topo_tasks` VARCHAR(45) NULL,
  PRIMARY KEY (`route_topo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`map_resources_to_maps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`map_resources_to_maps` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`map_resources_to_maps` (
  `map_id` INT NOT NULL,
  `map_resources_id` INT NOT NULL,
  PRIMARY KEY (`map_id`, `map_resources_id`),
  INDEX `fk_map_resources_to_maps_map_resources1_idx` (`map_resources_id` ASC),
  CONSTRAINT `fk_map_resources_to_maps_maps1`
    FOREIGN KEY (`map_id`)
    REFERENCES `mountaineering`.`maps` (`map_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_map_resources_to_maps_map_resources1`
    FOREIGN KEY (`map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`map_resources_to_topo_files`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`map_resources_to_topo_files` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`map_resources_to_topo_files` (
  `topo_file_id` INT NOT NULL,
  `map_resources_id` INT NOT NULL,
  PRIMARY KEY (`topo_file_id`, `map_resources_id`),
  INDEX `fk_map_resources_to_topo_files_map_resources1_idx` (`map_resources_id` ASC),
  CONSTRAINT `fk_map_resources_to_topo_files_topo_files1`
    FOREIGN KEY (`topo_file_id`)
    REFERENCES `mountaineering`.`files_topo` (`topo_file_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_map_resources_to_topo_files_map_resources1`
    FOREIGN KEY (`map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`map_resources_to_ge_files`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`map_resources_to_ge_files` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`map_resources_to_ge_files` (
  `ge_file_id` INT NOT NULL,
  `map_resources_id` INT NOT NULL,
  PRIMARY KEY (`ge_file_id`, `map_resources_id`),
  INDEX `fk_map_resources_to_ge_files_map_resources1_idx` (`map_resources_id` ASC),
  CONSTRAINT `fk_map_resources_to_ge_files_ge_files1`
    FOREIGN KEY (`ge_file_id`)
    REFERENCES `mountaineering`.`files_ge` (`ge_file_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_map_resources_to_ge_files_map_resources1`
    FOREIGN KEY (`map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`map_resources_to_gpx_files`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`map_resources_to_gpx_files` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`map_resources_to_gpx_files` (
  `gpx_file_id` INT NOT NULL,
  `map_resources_id` INT NOT NULL,
  PRIMARY KEY (`gpx_file_id`, `map_resources_id`),
  INDEX `fk_map_resources_to_gpx_files_map_resources1_idx` (`map_resources_id` ASC),
  CONSTRAINT `fk_map_resources_to_gpx_files_gpx_files1`
    FOREIGN KEY (`gpx_file_id`)
    REFERENCES `mountaineering`.`files_gpx` (`gpx_file_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_map_resources_to_gpx_files_map_resources1`
    FOREIGN KEY (`map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`map_resources_to_annotated_images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`map_resources_to_annotated_images` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`map_resources_to_annotated_images` (
  `annotated_images_id` INT NOT NULL,
  `map_resources_id` INT NOT NULL,
  PRIMARY KEY (`annotated_images_id`, `map_resources_id`),
  INDEX `fk_map_resources_to_annotated_images_map_resources1_idx` (`map_resources_id` ASC),
  CONSTRAINT `fk_map_resources_to_annotated_images_annotated_images1`
    FOREIGN KEY (`annotated_images_id`)
    REFERENCES `mountaineering`.`annotated_images` (`annotated_images_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_map_resources_to_annotated_images_map_resources1`
    FOREIGN KEY (`map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`map_resources_to_route_topos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`map_resources_to_route_topos` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`map_resources_to_route_topos` (
  `route_topo_id` INT NOT NULL,
  `map_resources_id` INT NOT NULL,
  PRIMARY KEY (`route_topo_id`, `map_resources_id`),
  INDEX `fk_map_resources_to_route_topos_map_resources1_idx` (`map_resources_id` ASC),
  CONSTRAINT `fk_map_resources_to_route_topos_route_topos1`
    FOREIGN KEY (`route_topo_id`)
    REFERENCES `mountaineering`.`route_topos` (`route_topo_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_map_resources_to_route_topos_map_resources1`
    FOREIGN KEY (`map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`references_online`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`references_online` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`references_online` (
  `reference_online_id` INT NOT NULL,
  `reference_name` VARCHAR(45) NOT NULL,
  `reference_description` VARCHAR(45) NULL,
  `reference_URL` VARCHAR(45) NOT NULL,
  `reference_usage` ENUM('N/A', 'Trailhead', 'Route', 'Feature', 'Region', 'Geographic Parent', 'List') NULL,
  PRIMARY KEY (`reference_online_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`pages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`pages` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`pages` (
  `page_id` INT NOT NULL,
  `page_description` VARCHAR(45) NOT NULL,
  `page_image` VARCHAR(45) NULL,
  `page_page_url` VARCHAR(45) NULL,
  `page_date_create` TIMESTAMP NULL,
  `page_date_modify` TIMESTAMP NULL,
  `page_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `page_title_menu` VARCHAR(45) NOT NULL,
  `page_title_full` VARCHAR(45) NOT NULL,
  `page_tasks` VARCHAR(45) NULL,
  `page_visible` TINYINT(1) NOT NULL,
  PRIMARY KEY (`page_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`technical_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`technical_rating` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`technical_rating` (
  `technical_rating_id` INT NOT NULL,
  `rating_grade` ENUM('N/A', 'I', 'II', 'II+', 'III', 'III+', 'IV-', 'IV', 'IV+', 'V-', 'V', 'V+', 'VI-', 'VI', 'VI+') NULL,
  `rating_rock` ENUM('N/A', 'Trail', 'cl. 1', 'cl. 2', 'cl. 3', 'cl. 4', 'cl. 5', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7', '5.7+', '5.8', '5.8+', '5.9', '5.9+', '5.10-', '5.10', '5.10+', '5.10a', '5.10b', '5.10c', '5.10d', '5.11-', '5.11', '5.11+', '5.11a', '5.11b', '5.11c', '5.11d', '5.12-', '5.12', '5.12+', '5.12a', '5.12b', '5.12c', '5.12d') NULL,
  `rating_aid` ENUM('N/A', 'A0', 'A1', 'A1+', 'A2', 'A2+', 'A3', 'A3+', 'A4', 'A5', 'C1', 'C1+', 'C2', 'C2+', 'C3', 'C3+', 'C4', 'C5') NULL,
  `rating_ice` ENUM('N/A', 'WI1', 'WI2', 'WI3', 'WI4', 'WI5', 'WI6', 'AI1', 'AI2', 'AI3', 'AI4', 'AI5', 'AI6') NULL,
  `rating_snow_steepness` ENUM('N/A', '25 deg', '30 deg', '35 deg', '40 deg', '45 deg', '50 deg', '55 deg', '60 deg', '65 deg', '70 deg', '75 deg', '80 deg', '+80 deg') NULL,
  `rating_snow` ENUM('N/A', 'Snowshoe', 'Ski', 'Neve', 'Cornice', 'Rime', 'Glacier - Easy', 'Glacier - Moderate', 'Glacier - Hard', 'Mixed', 'AK1', 'AK2', 'AK3', 'AK4', 'AK5') NULL,
  `rating_other` VARCHAR(45) NULL,
  PRIMARY KEY (`technical_rating_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_routes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_routes` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_routes` (
  `routes_id` INT NOT NULL,
  `technical_rating_technical_rating_id` INT NULL,
  `routes_descriptions` VARCHAR(45) NOT NULL COMMENT 'Summary description\n',
  `routes_description_list` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `routes_distance` DOUBLE NULL COMMENT 'Miles. From path sums.\n',
  `routes_elevation_gain` INT(11) NULL COMMENT 'Feet. From path sums.\n',
  `routes_elevation_loss` INT(11) NULL COMMENT 'Feet. From path sums.\n',
  `routes_time` INT(11) NULL COMMENT 'Minutes.\n',
  `routes_max_rating` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `routes_pitches_number` INT(11) NULL COMMENT 'From path sums.\n',
  `routes_max_technical_rating` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `routes_pitches_rappel_number` INT(11) NULL COMMENT 'From path sums.\n',
  PRIMARY KEY (`routes_id`),
  INDEX `fk_path_routes_technical_rating1_idx` (`technical_rating_technical_rating_id` ASC),
  CONSTRAINT `fk_path_routes_technical_rating1`
    FOREIGN KEY (`technical_rating_technical_rating_id`)
    REFERENCES `mountaineering`.`technical_rating` (`technical_rating_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`routes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`routes` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`routes` (
  `route_id` INT NOT NULL,
  `path_routes_routes_id` INT NULL,
  `pages_page_id` INT NULL,
  `map_resources_map_resources_id` INT NULL,
  `route_name` VARCHAR(45) NOT NULL,
  `route_stars` INT(11) NULL,
  `route_type` ENUM('N/A', 'Non-Technical', 'Technical', 'Free w/ Aid', 'Aid') NULL,
  `route_characteristic_rock` SET('Ridge/Arete', 'Wide', 'Chimney', 'Squeeze Chimney', 'OW', 'Crack', 'Finger Crack', 'Hand Crack', 'Fist Crack', 'Lieback', 'Face', 'Friction', 'Roofs') NULL,
  `route_characteristic_ice` SET('Ridge/Arete', 'Couloir', 'Waterfall', 'Glacier', 'Chandelier', 'Mushrooms', 'Cornices') NULL,
  `route_travel_style` ENUM('N/A', 'Cragging', 'Single Day', 'Multi-day', 'Carryover', 'Expedition') NULL,
  `route_travel_modes` SET('Cycling', 'Hiking', 'Scrambling', 'Rock', 'Mixed', 'Snow/Neve', 'Ice', 'Snowshoeing', 'Skiing', 'Canoeing/Kayaking/Rowing', 'Sailing', 'White Water') NULL,
  `route_traverses` TINYINT(1) NULL COMMENT 'True if # feature parents > 1\n',
  PRIMARY KEY (`route_id`),
  INDEX `fk_routes_map_resources1_idx` (`map_resources_map_resources_id` ASC),
  INDEX `fk_routes_pages1_idx` (`pages_page_id` ASC),
  INDEX `fk_routes_path_routes1_idx` (`path_routes_routes_id` ASC),
  CONSTRAINT `fk_routes_map_resources1`
    FOREIGN KEY (`map_resources_map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_routes_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_routes_path_routes1`
    FOREIGN KEY (`path_routes_routes_id`)
    REFERENCES `mountaineering`.`path_routes` (`routes_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`routes_to_references_online`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`routes_to_references_online` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`routes_to_references_online` (
  `reference_online_id` INT NOT NULL,
  `routes_route_id` INT NOT NULL,
  PRIMARY KEY (`reference_online_id`, `routes_route_id`),
  INDEX `fk_routes_to_references_online_routes1_idx` (`routes_route_id` ASC),
  CONSTRAINT `fk_routes_to_references_online_references_online1`
    FOREIGN KEY (`reference_online_id`)
    REFERENCES `mountaineering`.`references_online` (`reference_online_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_routes_to_references_online_routes1`
    FOREIGN KEY (`routes_route_id`)
    REFERENCES `mountaineering`.`routes` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`references_offline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`references_offline` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`references_offline` (
  `reference_offline_id` INT NOT NULL,
  `reference_name` VARCHAR(45) NOT NULL,
  `reference_description` VARCHAR(45) NULL,
  `reference_URL` VARCHAR(45) NOT NULL COMMENT 'For book purchase\n',
  `reference_usage` ENUM('N/A', 'Trailhead', 'Route', 'Feature', 'Region', 'Geographic Parent', 'List') NULL,
  `references_author` VARCHAR(45) NULL,
  `references_title` VARCHAR(45) NULL,
  PRIMARY KEY (`reference_offline_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`routes_to_references_offline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`routes_to_references_offline` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`routes_to_references_offline` (
  `reference_offline_id` INT NOT NULL,
  `routes_route_id` INT NOT NULL,
  PRIMARY KEY (`reference_offline_id`, `routes_route_id`),
  INDEX `fk_routes_to_references_offline_routes1_idx` (`routes_route_id` ASC),
  CONSTRAINT `fk_routes_to_references_offline_references_offline1`
    FOREIGN KEY (`reference_offline_id`)
    REFERENCES `mountaineering`.`references_offline` (`reference_offline_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_routes_to_references_offline_routes1`
    FOREIGN KEY (`routes_route_id`)
    REFERENCES `mountaineering`.`routes` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`photo_albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`photo_albums` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`photo_albums` (
  `photo_album_id` INT NOT NULL,
  `photo_album_url` VARCHAR(45) NOT NULL,
  `photo_album_title` VARCHAR(45) NOT NULL,
  `photo_album_summary` VARCHAR(45) NOT NULL,
  `photo_album_latitude` DOUBLE NULL,
  `photo_album_longitude` DOUBLE NULL,
  `photo_album_date` DATE NULL,
  `photo_album_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `photo_album_captions_summary_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  `photo_album_geotag_status` ENUM('N/A', 'Complete', 'IP', 'TBA') NOT NULL,
  PRIMARY KEY (`photo_album_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`photos` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`photos` (
  `photo_id` INT NOT NULL,
  `photo_albums_photo_album_id` INT NOT NULL,
  `photo_url_prefix` VARCHAR(45) NOT NULL,
  `photo_url_suffix` VARCHAR(45) NOT NULL,
  `orientation_landscape` TINYINT(1) NOT NULL,
  `photo_caption` VARCHAR(45) NULL,
  `photo_latitude` DOUBLE NULL,
  `photo_longitude` DOUBLE NULL,
  `photo_timestamp` DATETIME NOT NULL,
  PRIMARY KEY (`photo_id`),
  INDEX `fk_photos_photo_albums1_idx` (`photo_albums_photo_album_id` ASC),
  CONSTRAINT `fk_photos_photo_albums1`
    FOREIGN KEY (`photo_albums_photo_album_id`)
    REFERENCES `mountaineering`.`photo_albums` (`photo_album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`videos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`videos` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`videos` (
  `video_id` INT NOT NULL,
  `photo_albums_photo_album_id` INT NULL,
  `video_url` VARCHAR(45) NOT NULL,
  `orientation_landscape` TINYINT(1) NOT NULL,
  `video_caption` VARCHAR(45) NULL,
  `video_latitude` DOUBLE NULL,
  `video_longitude` DOUBLE NULL,
  `video_timestamp` DATETIME NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_photos_photo_albums1_idx` (`photo_albums_photo_album_id` ASC),
  CONSTRAINT `fk_photos_photo_albums10`
    FOREIGN KEY (`photo_albums_photo_album_id`)
    REFERENCES `mountaineering`.`photo_albums` (`photo_album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`lists_features`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`lists_features` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`lists_features` (
  `feature_list_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `feature_list_name` VARCHAR(45) NULL,
  PRIMARY KEY (`feature_list_id`),
  INDEX `fk_lists_features_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_lists_features_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`lists_routes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`lists_routes` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`lists_routes` (
  `route_list_id` INT NOT NULL AUTO_INCREMENT,
  `pages_page_id` INT NULL,
  `route_list_name` VARCHAR(45) NULL,
  PRIMARY KEY (`route_list_id`),
  INDEX `fk_lists_routes_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_lists_routes_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`state_or_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`state_or_country` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`state_or_country` (
  `state_or_country_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `state_or_country_name` VARCHAR(45) NULL,
  `state_or_country_lat_long_list` DOUBLE NULL COMMENT 'Decimal representation - lat, long, …\n',
  PRIMARY KEY (`state_or_country_id`),
  INDEX `fk_state_or_country_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_state_or_country_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`regions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`regions` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`regions` (
  `region_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `region_name` VARCHAR(45) NULL,
  `region_lat_long_list` DOUBLE NULL COMMENT 'Decimal representation - lat, long, …\n',
  PRIMARY KEY (`region_id`),
  INDEX `fk_regions_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_regions_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`locations` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`locations` (
  `location_id` INT NOT NULL,
  `state_or_country_state_or_country_id` INT NOT NULL,
  `regions_region_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `state_or_country_state_or_country_id`, `regions_region_id`),
  INDEX `fk_locations_state_or_country1_idx` (`state_or_country_state_or_country_id` ASC),
  INDEX `fk_locations_regions1_idx` (`regions_region_id` ASC),
  CONSTRAINT `fk_locations_state_or_country1`
    FOREIGN KEY (`state_or_country_state_or_country_id`)
    REFERENCES `mountaineering`.`state_or_country` (`state_or_country_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_locations_regions1`
    FOREIGN KEY (`regions_region_id`)
    REFERENCES `mountaineering`.`regions` (`region_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`geography_region_level_1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`geography_region_level_1` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`geography_region_level_1` (
  `geography_region_level_1_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `geography_region_level_1_name` VARCHAR(45) NULL,
  `geography_region_level_1_lat_long_list` DOUBLE NULL COMMENT 'Decimal representation - lat, long, …\n',
  PRIMARY KEY (`geography_region_level_1_id`),
  INDEX `fk_geography_region_level_1_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_geography_region_level_1_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`geography_region_level_2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`geography_region_level_2` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`geography_region_level_2` (
  `geography_region_level_2_id` INT NOT NULL,
  `geography_region_level_2_geography_region_level_1_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `geography_region_level_2_name` VARCHAR(45) NULL,
  `geography_region_level_2_lat_long_list` DOUBLE NULL COMMENT 'Decimal representation - lat, long, …\n',
  PRIMARY KEY (`geography_region_level_2_id`),
  INDEX `fk_geography_region_level_1_copy1_geography_region_level_11_idx` (`geography_region_level_2_geography_region_level_1_id` ASC),
  INDEX `fk_geography_region_level_1_copy1_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_geography_region_level_1_copy1_geography_region_level_11`
    FOREIGN KEY (`geography_region_level_2_geography_region_level_1_id`)
    REFERENCES `mountaineering`.`geography_region_level_1` (`geography_region_level_1_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_region_level_1_copy1_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`geography_region_level_3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`geography_region_level_3` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`geography_region_level_3` (
  `geography_region_level_3_id` INT NOT NULL,
  `geography_region_level_3_geography_region_level_2_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `geography_region_level_3_name` VARCHAR(45) NULL,
  `geography_region_level_3_lat_long_list` DOUBLE NULL COMMENT 'Decimal representation - lat, long, …\n',
  PRIMARY KEY (`geography_region_level_3_id`),
  INDEX `fk_geography_region_level_1_copy2_geography_region_level_1__idx` (`geography_region_level_3_geography_region_level_2_id` ASC),
  INDEX `fk_geography_region_level_1_copy2_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_geography_region_level_1_copy2_geography_region_level_1_co1`
    FOREIGN KEY (`geography_region_level_3_geography_region_level_2_id`)
    REFERENCES `mountaineering`.`geography_region_level_2` (`geography_region_level_2_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_region_level_1_copy2_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`geography_region_level_4`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`geography_region_level_4` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`geography_region_level_4` (
  `geography_region_level_4_id` INT NOT NULL,
  `geography_region_level_4_geography_region_level_3_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `geography_region_level_4_name` VARCHAR(45) NULL,
  `geography_region_level_4_lat_long_list` DOUBLE NULL COMMENT 'Decimal representation - lat, long, …\n',
  PRIMARY KEY (`geography_region_level_4_id`),
  INDEX `fk_geography_region_level_1_copy3_geography_region_level_1__idx` (`geography_region_level_4_geography_region_level_3_id` ASC),
  INDEX `fk_geography_region_level_1_copy3_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_geography_region_level_1_copy3_geography_region_level_1_co1`
    FOREIGN KEY (`geography_region_level_4_geography_region_level_3_id`)
    REFERENCES `mountaineering`.`geography_region_level_3` (`geography_region_level_3_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_region_level_1_copy3_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`geography_region_level_5`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`geography_region_level_5` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`geography_region_level_5` (
  `geography_region_level_5_id` INT NOT NULL,
  `geography_region_level_5_geography_region_level_4_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `geography_region_level_5_name` VARCHAR(45) NULL,
  `geography_region_level_5_lat_long_list` DOUBLE NULL COMMENT 'Decimal representation - lat, long, …\n',
  PRIMARY KEY (`geography_region_level_5_id`),
  INDEX `fk_geography_region_level_1_copy3_copy1_geography_region_le_idx` (`geography_region_level_5_geography_region_level_4_id` ASC),
  INDEX `fk_geography_region_level_1_copy3_copy1_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_geography_region_level_1_copy3_copy1_geography_region_leve1`
    FOREIGN KEY (`geography_region_level_5_geography_region_level_4_id`)
    REFERENCES `mountaineering`.`geography_region_level_4` (`geography_region_level_4_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_region_level_1_copy3_copy1_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`geography_region_level_6`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`geography_region_level_6` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`geography_region_level_6` (
  `geography_region_level_6_id` INT NOT NULL,
  `geography_region_level_6_geography_region_level_5_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `geography_region_level_6_name` VARCHAR(45) NULL,
  `geography_region_level_6_lat_long_list` DOUBLE NULL COMMENT 'Decimal representation - lat, long, …\n',
  PRIMARY KEY (`geography_region_level_6_id`),
  INDEX `fk_geography_region_level_1_copy3_copy2_geography_region_le_idx` (`geography_region_level_6_geography_region_level_5_id` ASC),
  INDEX `fk_geography_region_level_1_copy3_copy2_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_geography_region_level_1_copy3_copy2_geography_region_leve1`
    FOREIGN KEY (`geography_region_level_6_geography_region_level_5_id`)
    REFERENCES `mountaineering`.`geography_region_level_5` (`geography_region_level_5_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_region_level_1_copy3_copy2_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`geography_regions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`geography_regions` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`geography_regions` (
  `geography_regions_id` INT NOT NULL,
  `geography_region_level_1_geography_region_level_1_id` INT NOT NULL,
  `geography_region_level_2_geography_region_level_2_id` INT NULL,
  `geography_region_level_3_geography_region_level_3_id` INT NULL,
  `geography_region_level_4_geography_region_level_4_id` INT NULL,
  `geography_region_level_5_geography_region_level_5_id` INT NULL,
  `geography_region_level_6_geography_region_level_6_id` INT NULL,
  PRIMARY KEY (`geography_regions_id`),
  INDEX `fk_geography_regions_geography_region_level_11_idx` (`geography_region_level_1_geography_region_level_1_id` ASC),
  INDEX `fk_geography_regions_geography_region_level_21_idx` (`geography_region_level_2_geography_region_level_2_id` ASC),
  INDEX `fk_geography_regions_geography_region_level_31_idx` (`geography_region_level_3_geography_region_level_3_id` ASC),
  INDEX `fk_geography_regions_geography_region_level_41_idx` (`geography_region_level_4_geography_region_level_4_id` ASC),
  INDEX `fk_geography_regions_geography_region_level_51_idx` (`geography_region_level_5_geography_region_level_5_id` ASC),
  INDEX `fk_geography_regions_geography_region_level_61_idx` (`geography_region_level_6_geography_region_level_6_id` ASC),
  CONSTRAINT `fk_geography_regions_geography_region_level_11`
    FOREIGN KEY (`geography_region_level_1_geography_region_level_1_id`)
    REFERENCES `mountaineering`.`geography_region_level_1` (`geography_region_level_1_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_regions_geography_region_level_21`
    FOREIGN KEY (`geography_region_level_2_geography_region_level_2_id`)
    REFERENCES `mountaineering`.`geography_region_level_2` (`geography_region_level_2_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_regions_geography_region_level_31`
    FOREIGN KEY (`geography_region_level_3_geography_region_level_3_id`)
    REFERENCES `mountaineering`.`geography_region_level_3` (`geography_region_level_3_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_regions_geography_region_level_41`
    FOREIGN KEY (`geography_region_level_4_geography_region_level_4_id`)
    REFERENCES `mountaineering`.`geography_region_level_4` (`geography_region_level_4_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_regions_geography_region_level_51`
    FOREIGN KEY (`geography_region_level_5_geography_region_level_5_id`)
    REFERENCES `mountaineering`.`geography_region_level_5` (`geography_region_level_5_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geography_regions_geography_region_level_61`
    FOREIGN KEY (`geography_region_level_6_geography_region_level_6_id`)
    REFERENCES `mountaineering`.`geography_region_level_6` (`geography_region_level_6_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`peak_or_feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`peak_or_feature` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`peak_or_feature` (
  `peak_or_feature_id` INT NOT NULL,
  `locations_location_id` INT NULL,
  `geography_regions_geography_regions_id` INT NULL,
  `pages_page_id` INT NULL,
  `feature_name` VARCHAR(45) NOT NULL,
  `feature_latitude` DOUBLE NULL,
  `feature_longitude` DOUBLE NULL,
  `feature_elevation` INT(11) NULL,
  `feature_stars` INT(11) NULL,
  `feature_type` ENUM('N/A', 'Desert Tower', 'Spire/Pinnacle', 'Big Wall', 'Crag', 'Waterfall', 'Canyon', 'Mountain', 'Water', 'Road', 'Trail', 'City') NOT NULL,
  `feature_location_type` ENUM('NA', 'Alpine', 'Lowland', 'Desert', 'Urban') NOT NULL,
  `feature_characteristics` SET('Glacier', 'Volcano') NULL,
  PRIMARY KEY (`peak_or_feature_id`),
  INDEX `fk_peak_or_feature_pages1_idx` (`pages_page_id` ASC),
  INDEX `fk_peak_or_feature_locations1_idx` (`locations_location_id` ASC),
  INDEX `fk_peak_or_feature_geography_regions1_idx` (`geography_regions_geography_regions_id` ASC),
  CONSTRAINT `fk_peak_or_feature_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_peak_or_feature_locations1`
    FOREIGN KEY (`locations_location_id`)
    REFERENCES `mountaineering`.`locations` (`location_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_peak_or_feature_geography_regions1`
    FOREIGN KEY (`geography_regions_geography_regions_id`)
    REFERENCES `mountaineering`.`geography_regions` (`geography_regions_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`lists_to_features`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`lists_to_features` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`lists_to_features` (
  `peak_or_feature_peak_or_feature_id` INT NOT NULL,
  `lists_features_feature_list_id` INT NOT NULL,
  `feature_list_description` VARCHAR(45) NULL,
  `feature_list_image` VARCHAR(45) NULL COMMENT 'URL',
  PRIMARY KEY (`peak_or_feature_peak_or_feature_id`, `lists_features_feature_list_id`),
  INDEX `fk_lists_to_features_peak_or_feature1_idx` (`peak_or_feature_peak_or_feature_id` ASC),
  INDEX `fk_lists_to_features_lists_features1_idx` (`lists_features_feature_list_id` ASC),
  CONSTRAINT `fk_lists_to_features_peak_or_feature1`
    FOREIGN KEY (`peak_or_feature_peak_or_feature_id`)
    REFERENCES `mountaineering`.`peak_or_feature` (`peak_or_feature_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lists_to_features_lists_features1`
    FOREIGN KEY (`lists_features_feature_list_id`)
    REFERENCES `mountaineering`.`lists_features` (`feature_list_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`lists_to_routes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`lists_to_routes` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`lists_to_routes` (
  `routes_route_id` INT NOT NULL,
  `lists_routes_route_list_id` INT NOT NULL,
  `route_list_description` VARCHAR(45) NULL,
  `route_list_image` VARCHAR(45) NULL COMMENT 'URL',
  PRIMARY KEY (`routes_route_id`, `lists_routes_route_list_id`),
  INDEX `fk_lists_to_routes_lists_routes1_idx` (`lists_routes_route_list_id` ASC),
  CONSTRAINT `fk_lists_to_routes_routes1`
    FOREIGN KEY (`routes_route_id`)
    REFERENCES `mountaineering`.`routes` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lists_to_routes_lists_routes1`
    FOREIGN KEY (`lists_routes_route_list_id`)
    REFERENCES `mountaineering`.`lists_routes` (`route_list_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`routes_to_features`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`routes_to_features` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`routes_to_features` (
  `routes_route_id` INT NOT NULL,
  `peak_or_feature_peak_or_feature_id` INT NOT NULL,
  PRIMARY KEY (`routes_route_id`, `peak_or_feature_peak_or_feature_id`),
  INDEX `fk_routes_to_features_peak_or_feature1_idx` (`peak_or_feature_peak_or_feature_id` ASC),
  CONSTRAINT `fk_routes_to_features_routes1`
    FOREIGN KEY (`routes_route_id`)
    REFERENCES `mountaineering`.`routes` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_routes_to_features_peak_or_feature1`
    FOREIGN KEY (`peak_or_feature_peak_or_feature_id`)
    REFERENCES `mountaineering`.`peak_or_feature` (`peak_or_feature_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trips` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trips` (
  `report_trip_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `report_trip_type` ENUM('N/A', 'Fully Automated', 'Partially Automated', 'Complete') NOT NULL COMMENT 'URL',
  PRIMARY KEY (`report_trip_id`),
  INDEX `fk_trip_reports_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_trip_reports_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`tick_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`tick_list` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`tick_list` (
  `tick_list_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  `peak_or_feature_peak_or_feature_id` INT NULL,
  `routes_route_id` INT NULL,
  `tick_list_date` DATE NULL,
  `tick_list_notes` VARCHAR(45) NULL,
  `tick_list_category_feature` ENUM('N/A', 'Attempted','Success') NULL,
  `tick_list_category_route` ENUM('N/A', 'Attempted','Success') NULL,
  PRIMARY KEY (`tick_list_id`),
  INDEX `fk_tick_list_pages1_idx` (`pages_page_id` ASC),
  INDEX `fk_tick_list_peak_or_feature1_idx` (`peak_or_feature_peak_or_feature_id` ASC),
  INDEX `fk_tick_list_routes1_idx` (`routes_route_id` ASC),
  CONSTRAINT `fk_tick_list_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tick_list_peak_or_feature1`
    FOREIGN KEY (`peak_or_feature_peak_or_feature_id`)
    REFERENCES `mountaineering`.`peak_or_feature` (`peak_or_feature_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tick_list_routes1`
    FOREIGN KEY (`routes_route_id`)
    REFERENCES `mountaineering`.`routes` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trips_introduction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trips_introduction` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trips_introduction` (
  `report_trip_introduction_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  PRIMARY KEY (`report_trip_introduction_id`),
  INDEX `fk_trip_reports_introduction_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_trip_reports_introduction_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trips_summary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trips_summary` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trips_summary` (
  `report_trip_summary_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  PRIMARY KEY (`report_trip_summary_id`),
  INDEX `fk_trip_reports_summary_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_trip_reports_summary_pages1`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_day`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_day` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_day` (
  `day_id` INT NOT NULL,
  `technical_rating_technical_rating_id` INT NULL,
  `day_distance` DOUBLE NULL COMMENT 'Miles. From path sums.\n',
  `day_elevation_gain` INT(11) NULL COMMENT 'Feet. From path sums.\n',
  `day_elevation_loss` INT(11) NULL COMMENT 'Feet. From path sums.\n',
  `day_time` INT(11) NULL COMMENT 'Minutes.\n',
  `day_max_rating` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `day_pitches_number` INT(11) NULL COMMENT 'From path sums.\n',
  `day_max_technical_rating` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `day_pitches_rappel_number` INT(11) NULL COMMENT 'From path sums.\n',
  PRIMARY KEY (`day_id`),
  INDEX `fk_path_day_technical_rating1_idx` (`technical_rating_technical_rating_id` ASC),
  CONSTRAINT `fk_path_day_technical_rating1`
    FOREIGN KEY (`technical_rating_technical_rating_id`)
    REFERENCES `mountaineering`.`technical_rating` (`technical_rating_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`trailheads`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`trailheads` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`trailheads` (
  `trailhead_id` INT NOT NULL,
  `trailhead_name` VARCHAR(45) NOT NULL,
  `trailhead_classifications` SET('Hiking', 'Cragging', 'Cycling', 'Watercraft') NULL,
  `trailhead_latitude` DOUBLE NULL,
  `trailhead_longitude` DOUBLE NULL,
  `trailhead_elevation` INT(11) NULL,
  `trailhead_developed` ENUM('Yes', 'No', 'Unknown') NULL,
  `trailhead_notes_parking` VARCHAR(45) NULL,
  `trailhead_notes_other` VARCHAR(45) NULL,
  PRIMARY KEY (`trailhead_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path` (
  `path_id` INT NOT NULL,
  `path_start_trailhead_id` INT NULL,
  `path_end_trailhead_id` INT NULL,
  `path_description` VARCHAR(45) NOT NULL,
  `path_distance` DOUBLE NULL COMMENT 'Miles. From segment sums.\n',
  `path_elevation_gain` INT(11) NULL COMMENT 'Feet.  From segment sums.\n',
  `path_elevation_loss` INT(11) NULL COMMENT 'Feet.  From segment sums.\n',
  PRIMARY KEY (`path_id`),
  INDEX `fk_path_trailheads1_idx` (`path_start_trailhead_id` ASC),
  INDEX `fk_path_trailheads2_idx` (`path_end_trailhead_id` ASC),
  CONSTRAINT `fk_path_trailheads1`
    FOREIGN KEY (`path_start_trailhead_id`)
    REFERENCES `mountaineering`.`trailheads` (`trailhead_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_trailheads2`
    FOREIGN KEY (`path_end_trailhead_id`)
    REFERENCES `mountaineering`.`trailheads` (`trailhead_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`trips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`trips` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`trips` (
  `trip_id` INT NOT NULL,
  `path_path_id` INT NULL,
  `trip_reports_trip_report_id` INT NULL,
  `trip_reports_introduction_trip_repor_introduction_id` INT NULL,
  `trip_reports_summary_trip_repor_summary_id` INT NULL,
  `trip_description` VARCHAR(45) NOT NULL,
  `trip_date_start` DATE NULL COMMENT 'Calendar Entry - calculated from days\n',
  `trip_date_finish` DATE NULL COMMENT 'Calendar Entry - calculated from days\n',
  `trip_season` ENUM('N/A', 'Winter/Spring', 'Summer/Fall') NULL COMMENT 'Calculated from dates with ranges corresponding to Enum\n',
  `trip_route_conditions` ENUM('N/A', 'Misc', 'Dry', 'Winter') NULL,
  `trip_time` INT(11) NULL COMMENT 'Calculated from date start & finish\n',
  `trip_average_speed` DOUBLE NULL COMMENT 'Averaged from days where average speed is to be displayed. Mph\n',
  `trip_weight_carried` INT(11) NULL COMMENT 'Averaged from days where non-zero weight is carried. Lbs\n',
  `trip_characteristics` SET('Traverses/Linkups', 'Mountaineering Clinic', 'Misc Clinics', 'Humor', 'Gym') NULL,
  PRIMARY KEY (`trip_id`),
  INDEX `fk_trips_path1_idx` (`path_path_id` ASC),
  INDEX `fk_trips_trip_reports1_idx` (`trip_reports_trip_report_id` ASC),
  INDEX `fk_trips_trip_reports_introduction1_idx` (`trip_reports_introduction_trip_repor_introduction_id` ASC),
  INDEX `fk_trips_trip_reports_summary1_idx` (`trip_reports_summary_trip_repor_summary_id` ASC),
  CONSTRAINT `fk_trips_path1`
    FOREIGN KEY (`path_path_id`)
    REFERENCES `mountaineering`.`path` (`path_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_trips_trip_reports1`
    FOREIGN KEY (`trip_reports_trip_report_id`)
    REFERENCES `mountaineering`.`report_trips` (`report_trip_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_trips_trip_reports_introduction1`
    FOREIGN KEY (`trip_reports_introduction_trip_repor_introduction_id`)
    REFERENCES `mountaineering`.`report_trips_introduction` (`report_trip_introduction_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_trips_trip_reports_summary1`
    FOREIGN KEY (`trip_reports_summary_trip_repor_summary_id`)
    REFERENCES `mountaineering`.`report_trips_summary` (`report_trip_summary_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`day_stats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`day_stats` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`day_stats` (
  `day_id` INT NOT NULL,
  `path_day_day_id` INT NULL,
  `map_resources_map_resources_id` INT NULL,
  `trips_trip_id` INT NULL,
  `day_date` DATE NOT NULL,
  `day_description` VARCHAR(45) NULL COMMENT 'Like photo album description\n',
  `day_bivy` TINYINT(1) NULL,
  `day_time` INT(11) NULL COMMENT 'Minutes\n',
  `day_weight_carried` INT(11) NULL COMMENT 'lbs',
  `day_display_average_speed` TINYINT(1) NULL,
  `day_notes` VARCHAR(45) NULL,
  PRIMARY KEY (`day_id`),
  INDEX `fk_day_stats_map_resources1_idx` (`map_resources_map_resources_id` ASC),
  INDEX `fk_day_stats_path_day1_idx` (`path_day_day_id` ASC),
  INDEX `fk_day_stats_trips1_idx` (`trips_trip_id` ASC),
  CONSTRAINT `fk_day_stats_map_resources1`
    FOREIGN KEY (`map_resources_map_resources_id`)
    REFERENCES `mountaineering`.`map_resources` (`map_resources_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_day_stats_path_day1`
    FOREIGN KEY (`path_day_day_id`)
    REFERENCES `mountaineering`.`path_day` (`day_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_day_stats_trips1`
    FOREIGN KEY (`trips_trip_id`)
    REFERENCES `mountaineering`.`trips` (`trip_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`day_overwrites_to_route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`day_overwrites_to_route` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`day_overwrites_to_route` (
  `routes_route_id` INT NOT NULL,
  `day_stats_day_id` INT NOT NULL,
  `climbing_rack_climbing_rack_id` INT NULL,
  `technical_rating_technical_rating_id` INT NULL,
  `route_overwrite_stars` INT(11) NULL,
  `route_overwrite_type` ENUM('N/A', 'Non-Technical', 'Technical', 'Free w/ Aid', 'Aid') NULL,
  `route_overwrite_travel_style` ENUM('N/A', 'Cragging', 'Single Day', 'Multi-day', 'Carryover', 'Expedition') NULL,
  `route_overwrite_trip_method` ENUM('N/A', 'Ascended', 'Traversed', 'Descended', 'Bailed') NULL,
  `route_overwrite_travel_modes` SET('Cycling', 'Hiking', 'Scrambling', 'Rock', 'Mixed', 'Snow/Neve', 'Ice', 'Snowshoeing', 'Skiing', 'Canoeing/Kayaking/Rowing', 'Sailing', 'White Water') NULL,
  `notes` VARCHAR(45) NULL,
  PRIMARY KEY (`routes_route_id`, `day_stats_day_id`),
  INDEX `fk_day_to_route_overwrites_routes1_idx` (`routes_route_id` ASC),
  INDEX `fk_day_to_route_overwrites_day_stats1_idx` (`day_stats_day_id` ASC),
  INDEX `fk_day_to_route_overwrites_climbing_rack1_idx` (`climbing_rack_climbing_rack_id` ASC),
  INDEX `fk_day_to_route_overwrites_technical_rating1_idx` (`technical_rating_technical_rating_id` ASC),
  CONSTRAINT `fk_day_to_route_overwrites_routes1`
    FOREIGN KEY (`routes_route_id`)
    REFERENCES `mountaineering`.`routes` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_day_to_route_overwrites_day_stats1`
    FOREIGN KEY (`day_stats_day_id`)
    REFERENCES `mountaineering`.`day_stats` (`day_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_day_to_route_overwrites_climbing_rack1`
    FOREIGN KEY (`climbing_rack_climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_day_to_route_overwrites_technical_rating1`
    FOREIGN KEY (`technical_rating_technical_rating_id`)
    REFERENCES `mountaineering`.`technical_rating` (`technical_rating_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`trailhead_driving_directions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`trailhead_driving_directions` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`trailhead_driving_directions` (
  `driving_directions_id` INT NOT NULL,
  `driving_directions_name` VARCHAR(45) NOT NULL,
  `driving_directions_latitude_start` DOUBLE NOT NULL,
  `driving_directions_longitude_start` DOUBLE NOT NULL,
  `driving_directions_latitude_end` DOUBLE NOT NULL,
  `driving_directions_longitude_end` DOUBLE NOT NULL,
  `driving_directions_url` VARCHAR(45) NOT NULL,
  `driving_directions_url_ge` VARCHAR(45) NULL,
  PRIMARY KEY (`driving_directions_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`trailheads_to_trailhead_driving_directions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`trailheads_to_trailhead_driving_directions` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`trailheads_to_trailhead_driving_directions` (
  `trailhead_driving_directions_driving_directions_id` INT NOT NULL,
  `trailheads_trailhead_id` INT NOT NULL,
  PRIMARY KEY (`trailhead_driving_directions_driving_directions_id`, `trailheads_trailhead_id`),
  INDEX `fk_trailheads_to_trailhead_driving_directions_trailheads1_idx` (`trailheads_trailhead_id` ASC),
  CONSTRAINT `fk_trailheads_to_trailhead_driving_directions_trailhead_drivi1`
    FOREIGN KEY (`trailhead_driving_directions_driving_directions_id`)
    REFERENCES `mountaineering`.`trailhead_driving_directions` (`driving_directions_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_trailheads_to_trailhead_driving_directions_trailheads1`
    FOREIGN KEY (`trailheads_trailhead_id`)
    REFERENCES `mountaineering`.`trailheads` (`trailhead_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`routes_to_technical_ratings_secondary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`routes_to_technical_ratings_secondary` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`routes_to_technical_ratings_secondary` (
  `routes_route_id` INT NOT NULL,
  `technical_rating_technical_rating_id` INT NOT NULL,
  PRIMARY KEY (`routes_route_id`, `technical_rating_technical_rating_id`),
  INDEX `fk_routes_to_technical_ratings_secondary_technical_rating1_idx` (`technical_rating_technical_rating_id` ASC),
  CONSTRAINT `fk_routes_to_technical_ratings_secondary_routes1`
    FOREIGN KEY (`routes_route_id`)
    REFERENCES `mountaineering`.`routes` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_routes_to_technical_ratings_secondary_technical_rating1`
    FOREIGN KEY (`technical_rating_technical_rating_id`)
    REFERENCES `mountaineering`.`technical_rating` (`technical_rating_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_segments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_segments` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_segments` (
  `segment_id` INT NOT NULL,
  `climbing_rack_climbing_rack_id` INT NULL,
  `segment_classification` ENUM('Segment_Classification', 'N/A', 'Approach', 'Route', 'Descent') NOT NULL,
  `segment_description` VARCHAR(45) NOT NULL,
  `segment_lat_long_list` VARCHAR(45) NULL COMMENT 'Decimal representation, separated by , & ;\n',
  `segment_distance_list` VARCHAR(45) NULL COMMENT 'Decimal representation, separated by ;\n',
  `segment_elevation_list` VARCHAR(45) NULL COMMENT 'Decimal representation, separated by ;\n',
  `segment_distance` DOUBLE NULL COMMENT 'Miles\n',
  `segment_elevation_gain` INT(11) NULL COMMENT 'Feet\n',
  `segment_elevation_loss` INT(11) NULL COMMENT 'Feet\n',
  `segment_start_latitude` DOUBLE NULL COMMENT 'Decimal representation\n',
  `segment_start_longitude` DOUBLE NULL COMMENT 'Decimal representation\n',
  `segment_finish_latitude` DOUBLE NULL COMMENT 'Decimal representation\n',
  `segment_finish_longitude` DOUBLE NULL COMMENT 'Decimal representation\n',
  `segment_rating` ENUM('Segment_Rating', 'N/A', 'Paved Road', 'Dirt Road', 'Water', 'Permanent Snow', 'Trail', 'cl. 1', 'cl. 2', 'cl. 3', 'cl. 4', 'cl. 5', 'Glacier - Easy', 'Glacier - Moderate', 'Glacier - Hard') NULL,
  `segment_pitches_notes` VARCHAR(45) NULL COMMENT 'Combine all pitch descriptions\n',
  `segment_pitches_number` INT(11) NULL COMMENT 'Summation from list.\n',
  `segment_max_length` INT(11) NULL COMMENT 'Feet. Max from list\n',
  `segment_rappels_number` INT(11) NULL COMMENT 'Summation from list.\n',
  `segment_max_rappel_length` INT(11) NULL COMMENT 'Feet. Max from list.\n',
  `segment_max_technical_rating` VARCHAR(45) NULL COMMENT 'Combine max of all pitches technical ratings\n',
  PRIMARY KEY (`segment_id`),
  INDEX `fk_path_segments_climbing_rack1_idx` (`climbing_rack_climbing_rack_id` ASC),
  CONSTRAINT `fk_path_segments_climbing_rack1`
    FOREIGN KEY (`climbing_rack_climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_approaches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_approaches` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_approaches` (
  `approach_id` INT NOT NULL,
  `approach_descriptions` VARCHAR(45) NOT NULL COMMENT 'Summary description\n',
  `approach_description_list` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `approach_distance` DOUBLE NULL COMMENT 'Miles. From path sums.\n',
  `approach_elevation_gain` INT(11) NULL COMMENT 'Feet. From path sums.\n',
  `approach_elevation_loss` INT(11) NULL COMMENT 'Feet. From path sums.\n',
  `approach_time` INT(11) NULL COMMENT 'Minutes.\n',
  `approach_max_rating` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `approach_pitches_number` INT(11) NULL COMMENT 'From path sums.\n',
  `approach_max_technical_rating` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `approach_pitches_rappel_number` INT(11) NULL COMMENT 'From path sums.\n',
  PRIMARY KEY (`approach_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_descents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_descents` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_descents` (
  `descent_id` INT NOT NULL,
  `descent_descriptions` VARCHAR(45) NOT NULL COMMENT 'Summary description\n',
  `descent_description_list` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `descent_distance` DOUBLE NULL COMMENT 'Miles. From path sums.\n',
  `descent_elevation_gain` INT(11) NULL COMMENT 'Feet. From path sums.\n',
  `descent_elevation_loss` INT(11) NULL COMMENT 'Feet. From path sums.\n',
  `descent_time` INT(11) NULL COMMENT 'Minutes.\n',
  `descent_max_rating` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `descent_pitches_number` INT(11) NULL COMMENT 'From path sums.\n',
  `descent_max_technical_rating` VARCHAR(45) NULL COMMENT 'Combine all segment descriptions\n',
  `descent_pitches_rappel_number` INT(11) NULL COMMENT 'From path sums.\n',
  PRIMARY KEY (`descent_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`pitches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`pitches` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`pitches` (
  `pitch_id` VARCHAR(45) NOT NULL,
  `pitch_sequence` INT NOT NULL,
  `technical_rating_technical_rating_id` INT NULL,
  `climbing_rack_climbing_rack_id` INT NULL,
  `pitch_description` VARCHAR(45) NULL,
  `pitch_length` INT(11) NULL,
  `pitch_rappels_number` INT(11) NULL,
  `pitch_max_rappel_length` INT(11) NULL,
  PRIMARY KEY (`pitch_id`),
  INDEX `fk_pitches_technical_rating1_idx` (`technical_rating_technical_rating_id` ASC),
  INDEX `fk_pitches_climbing_rack1_idx` (`climbing_rack_climbing_rack_id` ASC),
  CONSTRAINT `fk_pitches_technical_rating1`
    FOREIGN KEY (`technical_rating_technical_rating_id`)
    REFERENCES `mountaineering`.`technical_rating` (`technical_rating_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pitches_climbing_rack1`
    FOREIGN KEY (`climbing_rack_climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_approaches_key`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_approaches_key` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_approaches_key` (
  `path_segments_segment_id` INT NOT NULL,
  `path_approaches_approach_id` INT NOT NULL,
  `segment_sequence_id` INT(11) NOT NULL COMMENT 'Counts up in order of addition to path\n',
  `segment_forward` TINYINT(1) NOT NULL COMMENT 'Determines which direction the segment goes\n',
  PRIMARY KEY (`path_segments_segment_id`, `path_approaches_approach_id`),
  INDEX `fk_path_approaches_key_path_segments1_idx` (`path_segments_segment_id` ASC),
  CONSTRAINT `fk_path_approaches_key_path_approaches1`
    FOREIGN KEY (`path_approaches_approach_id`)
    REFERENCES `mountaineering`.`path_approaches` (`approach_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_approaches_key_path_segments1`
    FOREIGN KEY (`path_segments_segment_id`)
    REFERENCES `mountaineering`.`path_segments` (`segment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_descents_key`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_descents_key` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_descents_key` (
  `path_segments_segment_id` INT NOT NULL,
  `path_descents_descent_id` INT NOT NULL,
  `segment_sequence_id` INT(11) NOT NULL COMMENT 'Counts up in order of addition to path\n',
  `segment_forward` TINYINT(1) NOT NULL COMMENT 'Determines which direction the segment goes\n',
  PRIMARY KEY (`path_segments_segment_id`, `path_descents_descent_id`),
  INDEX `fk_path_descents_path_descents1_idx` (`path_descents_descent_id` ASC),
  CONSTRAINT `fk_path_descents_path_segments1`
    FOREIGN KEY (`path_segments_segment_id`)
    REFERENCES `mountaineering`.`path_segments` (`segment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_descents_path_descents1`
    FOREIGN KEY (`path_descents_descent_id`)
    REFERENCES `mountaineering`.`path_descents` (`descent_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_routes_key`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_routes_key` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_routes_key` (
  `path_segments_segment_id` INT NOT NULL,
  `path_routes_routes_id` INT NOT NULL,
  `segment_sequence_id` INT(11) NOT NULL COMMENT 'Counts up in order of addition to path\n',
  `segment_forward` TINYINT(1) NOT NULL COMMENT 'Determines which direction the segment goes\n',
  PRIMARY KEY (`path_segments_segment_id`, `path_routes_routes_id`),
  INDEX `fk_path_approaches_key_path_segments1_idx` (`path_segments_segment_id` ASC),
  INDEX `fk_path_routes_key_path_routes1_idx` (`path_routes_routes_id` ASC),
  CONSTRAINT `fk_path_approaches_key_path_segments10`
    FOREIGN KEY (`path_segments_segment_id`)
    REFERENCES `mountaineering`.`path_segments` (`segment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_routes_key_path_routes1`
    FOREIGN KEY (`path_routes_routes_id`)
    REFERENCES `mountaineering`.`path_routes` (`routes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_route_total_key`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_route_total_key` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_route_total_key` (
  `path_path_id` INT NOT NULL,
  `path_approaches_approach_id` INT NOT NULL,
  `path_routes_routes_id` INT NOT NULL,
  `path_descents_descent_id` INT NOT NULL,
  PRIMARY KEY (`path_path_id`),
  INDEX `fk_path_total_key_path_approaches1_idx` (`path_approaches_approach_id` ASC),
  INDEX `fk_path_total_key_path_routes1_idx` (`path_routes_routes_id` ASC),
  INDEX `fk_path_total_key_path_descents1_idx` (`path_descents_descent_id` ASC),
  CONSTRAINT `fk_path_total_key_path1`
    FOREIGN KEY (`path_path_id`)
    REFERENCES `mountaineering`.`path` (`path_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_total_key_path_approaches1`
    FOREIGN KEY (`path_approaches_approach_id`)
    REFERENCES `mountaineering`.`path_approaches` (`approach_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_total_key_path_routes1`
    FOREIGN KEY (`path_routes_routes_id`)
    REFERENCES `mountaineering`.`path_routes` (`routes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_total_key_path_descents1`
    FOREIGN KEY (`path_descents_descent_id`)
    REFERENCES `mountaineering`.`path_descents` (`descent_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_day_key`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_day_key` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_day_key` (
  `path_segments_segment_id` INT NOT NULL,
  `path_day_day_id` INT NOT NULL,
  `segment_sequence_id` INT(11) NOT NULL COMMENT 'Counts up in order of addition to path\n',
  `segment_forward` TINYINT(1) NOT NULL COMMENT 'Determines which direction the segment goes\n',
  PRIMARY KEY (`path_segments_segment_id`, `path_day_day_id`),
  INDEX `fk_path_approaches_key_path_segments1_idx` (`path_segments_segment_id` ASC),
  INDEX `fk_path_day_key_path_day1_idx` (`path_day_day_id` ASC),
  CONSTRAINT `fk_path_approaches_key_path_segments100`
    FOREIGN KEY (`path_segments_segment_id`)
    REFERENCES `mountaineering`.`path_segments` (`segment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_day_key_path_day1`
    FOREIGN KEY (`path_day_day_id`)
    REFERENCES `mountaineering`.`path_day` (`day_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`path_days_total_key`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`path_days_total_key` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`path_days_total_key` (
  `path_path_id` INT NOT NULL,
  `path_day_day_id` INT NOT NULL,
  PRIMARY KEY (`path_path_id`, `path_day_day_id`),
  INDEX `fk_path_days_total_key_path_day1_idx` (`path_day_day_id` ASC),
  CONSTRAINT `fk_path_days_total_key_path1`
    FOREIGN KEY (`path_path_id`)
    REFERENCES `mountaineering`.`path` (`path_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_path_days_total_key_path_day1`
    FOREIGN KEY (`path_day_day_id`)
    REFERENCES `mountaineering`.`path_day` (`day_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`partners`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`partners` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`partners` (
  `partner_id` INT NOT NULL,
  `partner_name_first` VARCHAR(45) NOT NULL,
  `partner_name_last` VARCHAR(45) NULL,
  `partner_url` VARCHAR(45) NULL,
  `partner_notes` VARCHAR(45) NULL,
  PRIMARY KEY (`partner_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`partners_to_days`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`partners_to_days` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`partners_to_days` (
  `partners_partner_id` INT NOT NULL,
  `day_stats_day_id` INT NOT NULL,
  PRIMARY KEY (`partners_partner_id`, `day_stats_day_id`),
  INDEX `fk_partners_has_day_stats_day_stats1_idx` (`day_stats_day_id` ASC),
  INDEX `fk_partners_has_day_stats_partners1_idx` (`partners_partner_id` ASC),
  CONSTRAINT `fk_partners_has_day_stats_partners1`
    FOREIGN KEY (`partners_partner_id`)
    REFERENCES `mountaineering`.`partners` (`partner_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_partners_has_day_stats_day_stats1`
    FOREIGN KEY (`day_stats_day_id`)
    REFERENCES `mountaineering`.`day_stats` (`day_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_photos` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_photos` (
  `report_photo_id` INT NOT NULL,
  `photos_photo_id` INT NOT NULL,
  `report_photo_suppress_caption` TINYINT(1) NULL,
  PRIMARY KEY (`report_photo_id`),
  INDEX `fk_report_photos_photos1_idx` (`photos_photo_id` ASC),
  CONSTRAINT `fk_report_photos_photos1`
    FOREIGN KEY (`photos_photo_id`)
    REFERENCES `mountaineering`.`photos` (`photo_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_videos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_videos` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_videos` (
  `report_video_id` INT NOT NULL,
  `videos_video_id` INT NOT NULL,
  `report_video_suppress_caption` TINYINT(1) NULL,
  PRIMARY KEY (`report_video_id`),
  INDEX `fk_report_videos_videos1_idx` (`videos_video_id` ASC),
  CONSTRAINT `fk_report_videos_videos1`
    FOREIGN KEY (`videos_video_id`)
    REFERENCES `mountaineering`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trip_summary_bodies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trip_summary_bodies` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trip_summary_bodies` (
  `report_body_id` INT NOT NULL,
  `report_trips_summary_report_trip_summary_id` INT NOT NULL,
  `report_id` INT NULL,
  `report_sequence` INT(11) NULL,
  `report_header` VARCHAR(45) NULL,
  `report_header_type` ENUM('None', 'H1', 'H2', 'H3', 'H4') NULL,
  `trip_report_text` LONGTEXT NULL,
  `report_photos_report_photo_id` INT NULL,
  `report_videos_report_video_id` INT NULL,
  PRIMARY KEY (`report_body_id`),
  INDEX `fk_trip_report_body_report_photos1_idx` (`report_photos_report_photo_id` ASC),
  INDEX `fk_trip_report_body_report_videos1_idx` (`report_videos_report_video_id` ASC),
  INDEX `fk_report_trip_summary_bodies_report_trips_summary1_idx` (`report_trips_summary_report_trip_summary_id` ASC),
  CONSTRAINT `fk_trip_report_body_report_photos1`
    FOREIGN KEY (`report_photos_report_photo_id`)
    REFERENCES `mountaineering`.`report_photos` (`report_photo_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_trip_report_body_report_videos1`
    FOREIGN KEY (`report_videos_report_video_id`)
    REFERENCES `mountaineering`.`report_videos` (`report_video_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_trip_summary_bodies_report_trips_summary1`
    FOREIGN KEY (`report_trips_summary_report_trip_summary_id`)
    REFERENCES `mountaineering`.`report_trips_summary` (`report_trip_summary_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`pitches_to_path_segments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`pitches_to_path_segments` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`pitches_to_path_segments` (
  `pitches_pitch_id` VARCHAR(45) NOT NULL,
  `path_segments_segment_id` INT NOT NULL,
  `pitch_sequence` INT NOT NULL,
  PRIMARY KEY (`pitches_pitch_id`, `path_segments_segment_id`),
  INDEX `fk_pitches_has_path_segments_path_segments1_idx` (`path_segments_segment_id` ASC),
  INDEX `fk_pitches_has_path_segments_pitches1_idx` (`pitches_pitch_id` ASC),
  CONSTRAINT `fk_pitches_has_path_segments_pitches1`
    FOREIGN KEY (`pitches_pitch_id`)
    REFERENCES `mountaineering`.`pitches` (`pitch_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pitches_has_path_segments_path_segments1`
    FOREIGN KEY (`path_segments_segment_id`)
    REFERENCES `mountaineering`.`path_segments` (`segment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trip_introduction_bodies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trip_introduction_bodies` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trip_introduction_bodies` (
  `report_body_id` INT NOT NULL,
  `report_trips_introduction_report_trip_introduction_id` INT NOT NULL,
  `report_photos_report_photo_id` INT NULL,
  `report_videos_report_video_id` INT NULL,
  `report_id` INT NULL,
  `report_sequence` INT(11) NULL,
  `report_header` VARCHAR(45) NULL,
  `report_header_type` ENUM('None', 'H1', 'H2', 'H3', 'H4') NULL,
  `trip_report_text` LONGTEXT NULL,
  PRIMARY KEY (`report_body_id`),
  INDEX `fk_report_trip_introduction_bodies_report_photos1_idx` (`report_photos_report_photo_id` ASC),
  INDEX `fk_report_trip_introduction_bodies_report_videos1_idx` (`report_videos_report_video_id` ASC),
  INDEX `fk_report_trip_introduction_bodies_report_trips_introductio_idx` (`report_trips_introduction_report_trip_introduction_id` ASC),
  CONSTRAINT `fk_report_trip_introduction_bodies_report_photos1`
    FOREIGN KEY (`report_photos_report_photo_id`)
    REFERENCES `mountaineering`.`report_photos` (`report_photo_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_trip_introduction_bodies_report_videos1`
    FOREIGN KEY (`report_videos_report_video_id`)
    REFERENCES `mountaineering`.`report_videos` (`report_video_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_trip_introduction_bodies_report_trips_introduction1`
    FOREIGN KEY (`report_trips_introduction_report_trip_introduction_id`)
    REFERENCES `mountaineering`.`report_trips_introduction` (`report_trip_introduction_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trip_bodies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trip_bodies` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trip_bodies` (
  `report_body_id` INT NOT NULL,
  `report_trips_report_trip_id` INT NOT NULL,
  `report_id` INT NULL,
  `report_sequence` INT(11) NULL,
  `report_header` VARCHAR(45) NULL,
  `report_header_type` ENUM('None', 'H1', 'H2', 'H3', 'H4') NULL,
  `trip_report_text` LONGTEXT NULL,
  `report_photos_report_photo_id` INT NULL,
  `report_videos_report_video_id` INT NULL,
  PRIMARY KEY (`report_body_id`),
  INDEX `fk_report_trip_bodies_report_photos1_idx` (`report_photos_report_photo_id` ASC),
  INDEX `fk_report_trip_bodies_report_videos1_idx` (`report_videos_report_video_id` ASC),
  INDEX `fk_report_trip_bodies_report_trips1_idx` (`report_trips_report_trip_id` ASC),
  CONSTRAINT `fk_report_trip_bodies_report_photos1`
    FOREIGN KEY (`report_photos_report_photo_id`)
    REFERENCES `mountaineering`.`report_photos` (`report_photo_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_trip_bodies_report_videos1`
    FOREIGN KEY (`report_videos_report_video_id`)
    REFERENCES `mountaineering`.`report_videos` (`report_video_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_trip_bodies_report_trips1`
    FOREIGN KEY (`report_trips_report_trip_id`)
    REFERENCES `mountaineering`.`report_trips` (`report_trip_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_articles` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_articles` (
  `report_article_id` INT NOT NULL,
  `pages_page_id` INT NULL,
  PRIMARY KEY (`report_article_id`),
  INDEX `fk_trip_reports_pages1_idx` (`pages_page_id` ASC),
  CONSTRAINT `fk_trip_reports_pages10`
    FOREIGN KEY (`pages_page_id`)
    REFERENCES `mountaineering`.`pages` (`page_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_article_bodies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_article_bodies` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_article_bodies` (
  `report_body_id` INT NOT NULL,
  `report_articles_report_article_id` INT NOT NULL,
  `report_photos_report_photo_id` INT NULL,
  `report_videos_report_video_id` INT NULL,
  `report_id` INT NULL,
  `report_sequence` INT(11) NULL,
  `report_header` VARCHAR(45) NULL,
  `report_header_type` ENUM('None', 'H1', 'H2', 'H3', 'H4') NULL,
  `trip_report_text` LONGTEXT NULL,
  PRIMARY KEY (`report_body_id`),
  INDEX `fk_report_article_bodies_report_photos1_idx` (`report_photos_report_photo_id` ASC),
  INDEX `fk_report_article_bodies_report_videos1_idx` (`report_videos_report_video_id` ASC),
  INDEX `fk_report_article_bodies_report_articles1_idx` (`report_articles_report_article_id` ASC),
  CONSTRAINT `fk_report_article_bodies_report_photos1`
    FOREIGN KEY (`report_photos_report_photo_id`)
    REFERENCES `mountaineering`.`report_photos` (`report_photo_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_article_bodies_report_videos1`
    FOREIGN KEY (`report_videos_report_video_id`)
    REFERENCES `mountaineering`.`report_videos` (`report_video_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_article_bodies_report_articles1`
    FOREIGN KEY (`report_articles_report_article_id`)
    REFERENCES `mountaineering`.`report_articles` (`report_article_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trips_summary_has_photo_albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trips_summary_has_photo_albums` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trips_summary_has_photo_albums` (
  `report_trips_summary_report_trip_summary_id` INT NOT NULL,
  `photo_albums_photo_album_id` INT NOT NULL,
  PRIMARY KEY (`report_trips_summary_report_trip_summary_id`, `photo_albums_photo_album_id`),
  INDEX `fk_report_trips_summary_has_photo_albums_photo_albums1_idx` (`photo_albums_photo_album_id` ASC),
  INDEX `fk_report_trips_summary_has_photo_albums_report_trips_summa_idx` (`report_trips_summary_report_trip_summary_id` ASC),
  CONSTRAINT `fk_report_trips_summary_has_photo_albums_report_trips_summary1`
    FOREIGN KEY (`report_trips_summary_report_trip_summary_id`)
    REFERENCES `mountaineering`.`report_trips_summary` (`report_trip_summary_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_trips_summary_has_photo_albums_photo_albums1`
    FOREIGN KEY (`photo_albums_photo_album_id`)
    REFERENCES `mountaineering`.`photo_albums` (`photo_album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trips_introduction_has_photo_albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trips_introduction_has_photo_albums` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trips_introduction_has_photo_albums` (
  `report_trips_introduction_report_trip_introduction_id` INT NOT NULL,
  `photo_albums_photo_album_id` INT NOT NULL,
  PRIMARY KEY (`report_trips_introduction_report_trip_introduction_id`, `photo_albums_photo_album_id`),
  INDEX `fk_report_trips_introduction_has_photo_albums_photo_albums1_idx` (`photo_albums_photo_album_id` ASC),
  INDEX `fk_report_trips_introduction_has_photo_albums_report_trips__idx` (`report_trips_introduction_report_trip_introduction_id` ASC),
  CONSTRAINT `fk_report_trips_introduction_has_photo_albums_report_trips_in1`
    FOREIGN KEY (`report_trips_introduction_report_trip_introduction_id`)
    REFERENCES `mountaineering`.`report_trips_introduction` (`report_trip_introduction_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_trips_introduction_has_photo_albums_photo_albums1`
    FOREIGN KEY (`photo_albums_photo_album_id`)
    REFERENCES `mountaineering`.`photo_albums` (`photo_album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_trips_has_photo_albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_trips_has_photo_albums` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_trips_has_photo_albums` (
  `report_trips_report_trip_id` INT NOT NULL,
  `photo_albums_photo_album_id` INT NOT NULL,
  PRIMARY KEY (`report_trips_report_trip_id`, `photo_albums_photo_album_id`),
  INDEX `fk_report_trips_has_photo_albums_photo_albums1_idx` (`photo_albums_photo_album_id` ASC),
  INDEX `fk_report_trips_has_photo_albums_report_trips1_idx` (`report_trips_report_trip_id` ASC),
  CONSTRAINT `fk_report_trips_has_photo_albums_report_trips1`
    FOREIGN KEY (`report_trips_report_trip_id`)
    REFERENCES `mountaineering`.`report_trips` (`report_trip_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_trips_has_photo_albums_photo_albums1`
    FOREIGN KEY (`photo_albums_photo_album_id`)
    REFERENCES `mountaineering`.`photo_albums` (`photo_album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`report_articles_has_photo_albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`report_articles_has_photo_albums` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`report_articles_has_photo_albums` (
  `report_articles_report_article_id` INT NOT NULL,
  `photo_albums_photo_album_id` INT NOT NULL,
  PRIMARY KEY (`report_articles_report_article_id`, `photo_albums_photo_album_id`),
  INDEX `fk_report_articles_has_photo_albums_photo_albums1_idx` (`photo_albums_photo_album_id` ASC),
  INDEX `fk_report_articles_has_photo_albums_report_articles1_idx` (`report_articles_report_article_id` ASC),
  CONSTRAINT `fk_report_articles_has_photo_albums_report_articles1`
    FOREIGN KEY (`report_articles_report_article_id`)
    REFERENCES `mountaineering`.`report_articles` (`report_article_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_report_articles_has_photo_albums_photo_albums1`
    FOREIGN KEY (`photo_albums_photo_album_id`)
    REFERENCES `mountaineering`.`photo_albums` (`photo_album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountaineering`.`route_overwrites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountaineering`.`route_overwrites` ;

CREATE TABLE IF NOT EXISTS `mountaineering`.`route_overwrites` (
  `route_overwrite_id` INT NOT NULL,
  `routes_route_id` INT NOT NULL,
  `technical_rating_technical_rating_id` INT NULL,
  `climbing_rack_climbing_rack_id` INT NULL,
  `pitches_pitch_id` VARCHAR(45) NULL,
  `route_overwrite_stars` INT(11) NULL,
  `route_overwrite_notes` VARCHAR(45) NULL,
  PRIMARY KEY (`route_overwrite_id`),
  INDEX `fk_route_overwrites_routes1_idx` (`routes_route_id` ASC),
  INDEX `fk_route_overwrites_technical_rating1_idx` (`technical_rating_technical_rating_id` ASC),
  INDEX `fk_route_overwrites_climbing_rack1_idx` (`climbing_rack_climbing_rack_id` ASC),
  INDEX `fk_route_overwrites_pitches1_idx` (`pitches_pitch_id` ASC),
  CONSTRAINT `fk_route_overwrites_routes1`
    FOREIGN KEY (`routes_route_id`)
    REFERENCES `mountaineering`.`routes` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_route_overwrites_technical_rating1`
    FOREIGN KEY (`technical_rating_technical_rating_id`)
    REFERENCES `mountaineering`.`technical_rating` (`technical_rating_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_route_overwrites_climbing_rack1`
    FOREIGN KEY (`climbing_rack_climbing_rack_id`)
    REFERENCES `mountaineering`.`climbing_rack` (`climbing_rack_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_route_overwrites_pitches1`
    FOREIGN KEY (`pitches_pitch_id`)
    REFERENCES `mountaineering`.`pitches` (`pitch_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
