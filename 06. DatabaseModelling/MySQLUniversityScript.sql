-- MySQL Script generated by MySQL Workbench
-- 10/05/15 19:55:42
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `University` ;

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `University` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `University` ;

-- -----------------------------------------------------
-- Table `University`.`Universities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Universities` (
  `UniversityId` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `table1col` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`UniversityId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Faculties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Faculties` (
  `idFaculties` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `UniversityId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idFaculties`)  COMMENT '',
  INDEX `fk_Faculties_Universities_idx` (`UniversityId` ASC)  COMMENT '',
  CONSTRAINT `fk_Faculties_Universities`
    FOREIGN KEY (`UniversityId`)
    REFERENCES `University`.`Universities` (`UniversityId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Departments` (
  `idDepartments` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `idFaculties` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idDepartments`)  COMMENT '',
  INDEX `fk_Departments_Faculties1_idx` (`idFaculties` ASC)  COMMENT '',
  CONSTRAINT `fk_Departments_Faculties1`
    FOREIGN KEY (`idFaculties`)
    REFERENCES `University`.`Faculties` (`idFaculties`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '				';


-- -----------------------------------------------------
-- Table `University`.`Professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Professors` (
  `idProfessors` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `idDepartments` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idProfessors`)  COMMENT '',
  INDEX `fk_Professors_Departments1_idx` (`idDepartments` ASC)  COMMENT '',
  CONSTRAINT `fk_Professors_Departments1`
    FOREIGN KEY (`idDepartments`)
    REFERENCES `University`.`Departments` (`idDepartments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Courses` (
  `idCourses` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `idDepartments` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idCourses`)  COMMENT '',
  INDEX `fk_Courses_Departments1_idx` (`idDepartments` ASC)  COMMENT '',
  CONSTRAINT `fk_Courses_Departments1`
    FOREIGN KEY (`idDepartments`)
    REFERENCES `University`.`Departments` (`idDepartments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Students` (
  `idStudents` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `idFaculties` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idStudents`)  COMMENT '',
  INDEX `fk_Students_Faculties1_idx` (`idFaculties` ASC)  COMMENT '',
  CONSTRAINT `fk_Students_Faculties1`
    FOREIGN KEY (`idFaculties`)
    REFERENCES `University`.`Faculties` (`idFaculties`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`CoursesStudents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`CoursesStudents` (
  `idCourses` INT NOT NULL COMMENT '',
  `idStudents` INT NOT NULL COMMENT '',
  `Courses_idCourses` INT NOT NULL COMMENT '',
  `Students_idStudents` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idCourses`, `idStudents`)  COMMENT '',
  INDEX `fk_CoursesStudents_Courses1_idx` (`Courses_idCourses` ASC)  COMMENT '',
  INDEX `fk_CoursesStudents_Students1_idx` (`Students_idStudents` ASC)  COMMENT '',
  CONSTRAINT `fk_CoursesStudents_Courses1`
    FOREIGN KEY (`Courses_idCourses`)
    REFERENCES `University`.`Courses` (`idCourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CoursesStudents_Students1`
    FOREIGN KEY (`Students_idStudents`)
    REFERENCES `University`.`Students` (`idStudents`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`TitlesProfessors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`TitlesProfessors` (
  `idProfessors` INT NOT NULL COMMENT '',
  `idTitles` INT NULL COMMENT '',
  PRIMARY KEY (`idProfessors`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Titles` (
  `idTitles` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `Professors_idProfessors` INT NOT NULL COMMENT '',
  `TitlesProfessors_idProfessors` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idTitles`)  COMMENT '',
  INDEX `fk_Titles_Professors1_idx` (`Professors_idProfessors` ASC)  COMMENT '',
  INDEX `fk_Titles_TitlesProfessors1_idx` (`TitlesProfessors_idProfessors` ASC)  COMMENT '',
  CONSTRAINT `fk_Titles_Professors1`
    FOREIGN KEY (`Professors_idProfessors`)
    REFERENCES `University`.`Professors` (`idProfessors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Titles_TitlesProfessors1`
    FOREIGN KEY (`TitlesProfessors_idProfessors`)
    REFERENCES `University`.`TitlesProfessors` (`idProfessors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
