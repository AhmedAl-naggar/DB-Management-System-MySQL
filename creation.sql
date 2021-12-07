SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Management system of charities
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Management system of charities` ;
CREATE SCHEMA IF NOT EXISTS `Management system of charities` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Management system of charities` ;

-- -----------------------------------------------------
-- Table `Management system of charities`.`Beneficiary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`Beneficiary` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`Beneficiary` (
  `id` CHAR(9) NOT NULL,
  `fname` VARCHAR(45) NULL,
  `mid_name` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `phone` VARCHAR(11) NULL,
  `address` VARCHAR(45) NULL,
  `birth date` DATE NULL,
  `job` VARCHAR(30) NULL,
  `income` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`donner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`donner` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`donner` (
  `id` CHAR(9) NOT NULL,
  `fname` VARCHAR(45) NULL,
  `mid_name` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `phone` VARCHAR(11) NULL,
  `address` VARCHAR(45) NULL,
  `birth date` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`family member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`family member` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`family member` (
  `id` CHAR(9) NULL,
  `name` VARCHAR(45) NOT NULL,
  `job` VARCHAR(45) NULL,
  `income` INT NULL,
  `costs` INT NULL,
  `birth date` DATE NULL,
  `relationship` VARCHAR(15) NULL,
  INDEX `fk_family member_Beneficiary1_idx` (`id` ASC),
  PRIMARY KEY (`id`, `name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`sickness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`sickness` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`sickness` (
  `type` VARCHAR(45) NOT NULL,
  `medicine` VARCHAR(45) NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`donation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`donation` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`donation` (
  `code of donation` VARCHAR(45) NOT NULL COMMENT 'zero : refer to physical ' /* comment truncated */ /*one : refer to mony*/,
  `date` DATE NULL,
  `occasion` VARCHAR(45) NULL,
  PRIMARY KEY (`code of donation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`physical`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`physical` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`physical` (
  `code of donation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`code of donation`),
  INDEX `fk_physical_donation1_idx` (`code of donation` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`mony`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`mony` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`mony` (
  `code of donation` VARCHAR(45) NOT NULL,
  `amount` INT NULL,
  PRIMARY KEY (`code of donation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`kind`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`kind` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`kind` (
  `code of donation` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`code of donation`, `name`),
  INDEX `fk_kind_physical1_idx` (`code of donation` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`Beneficiary_has_sikness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`Beneficiary_has_sikness` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`Beneficiary_has_sikness` (
  `id` CHAR(9) NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `type`),
  INDEX `fk_Beneficiary_has_sikness_sikness1_idx` (`type` ASC),
  INDEX `fk_Beneficiary_has_sikness_Beneficiary1_idx` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`family member_has_sikness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`family member_has_sikness` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`family member_has_sikness` (
  `id` CHAR(14) NULL,
  `name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `name`, `type`),
  INDEX `fk_family member_has_sikness_sikness1_idx` (`type` ASC),
  INDEX `fk_family member_has_sikness_family member1_idx` (`id` ASC, `name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`donner_has_donation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`donner_has_donation` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`donner_has_donation` (
  `id` CHAR(9) NOT NULL,
  `code of donation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `code of donation`),
  INDEX `fk_donner_has_donation_donation1_idx` (`code of donation` ASC),
  INDEX `fk_donner_has_donation_donner1_idx` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`Benefit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`Benefit` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`Benefit` (
  `id` CHAR(9) NULL,
  `date` DATE NOT NULL,
  `occasion` VARCHAR(45) NULL,
  INDEX `fk_Benefit_Beneficiary1_idx` (`id` ASC),
  PRIMARY KEY (`id`, `date`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`mony b`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`mony b` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`mony b` (
  `id` CHAR(9) NOT NULL,
  `date` DATE NOT NULL,
  `amount` INT NOT NULL,
  INDEX `fk_mony b_Benefit1_idx` (`id` ASC, `date` ASC),
  PRIMARY KEY (`id`, `date`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Management system of charities`.`physical kind b`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Management system of charities`.`physical kind b` ;

CREATE TABLE IF NOT EXISTS `Management system of charities`.`physical kind b` (
  `id` CHAR(9) NOT NULL,
  `date` DATE NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `date`, `name`),
  INDEX `fk_kind b_Benefit1_idx` (`id` ASC, `date` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`Beneficiary`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`Beneficiary` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`, `job`, `income`) VALUES ('666884444', 'som3a', 'asma3il', 'hasan', '7897021356', '8 st,malteya,asyut', '1973-8-8', 'driver', 1500);
INSERT INTO `Management system of charities`.`Beneficiary` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`, `job`, `income`) VALUES ('453453453', 'hssan', 'ibrahem', 'mohamed', '7897021006', '11 st,malteya,asyut', '1973-10-14', 'driver', 1200);
INSERT INTO `Management system of charities`.`Beneficiary` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`, `job`, `income`) VALUES ('987987987', 'nage', 'youssef', 'karam', '7893789506', '7 st,qaron,sohag', '1958-3-7', 'security', 800);
INSERT INTO `Management system of charities`.`Beneficiary` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`, `job`, `income`) VALUES ('789565423', 'Fouad', 'mohamed', 'hasan', '7897021350', '15 st,qaron,asyut', '1952-6-14', 'security', 750);
INSERT INTO `Management system of charities`.`Beneficiary` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`, `job`, `income`) VALUES ('235654446', 'nour', 'ahmed', 'fathy', '1097021006', '4 st,malteya,asyut', '1967-10-14', 'security', 670);
INSERT INTO `Management system of charities`.`Beneficiary` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`, `job`, `income`) VALUES ('792354657', 'saeed', 'taha', 'shokry', '7810789506', '12 st,qaron,sohag', '1960-3-7', 'security', 1000);
INSERT INTO `Management system of charities`.`Beneficiary` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`, `job`, `income`) VALUES ('778200005', 'mahmod', 'ismail', 'ahmed', '4578100254', '7 st,elsalam,cairo', '1966-6-7', 'Worker at factory', 1200);
INSERT INTO `Management system of charities`.`Beneficiary` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`, `job`, `income`) VALUES ('453846416', 'foaud', 'hassan', 'mohamed', '7890021545', '8 st,naser,cairo', '1968-2-12', 'Worker at factory', 900);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`donner`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`donner` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`) VALUES ('123456789', 'mosatafa', 'aly elden', 'mohamed', '1245687989', '6 st,ainshams,cairo', '1973-2-7');
INSERT INTO `Management system of charities`.`donner` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`) VALUES ('333445555', 'Asim', 'asame', 'farahat', '1245687777', '5 st,there,cairo', '1984-6-5');
INSERT INTO `Management system of charities`.`donner` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`) VALUES ('999887777', 'Ahmed', 'salama', 'elngar', '7125687991', '9 st,fasel,giza', '1965-9-7');
INSERT INTO `Management system of charities`.`donner` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`) VALUES ('987654321', 'Kirolos', 'sabry', 'wadea', '7125007991', '21 st,Sidi Bishr,alex', NULL);
INSERT INTO `Management system of charities`.`donner` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`) VALUES ('888665555', 'George', 'Antoine', 'hosny', '9468507991', '3 st,abbasiyah,cairo', NULL);
INSERT INTO `Management system of charities`.`donner` (`id`, `fname`, `mid_name`, `lname`, `phone`, `address`, `birth date`) VALUES ('789567162', 'khaled', 'ahmed', 'fathy', '1785230523', '7 st,fasel,giza', '1972-9-9');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`family member`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('666884444', 'ahmed', 'Worker at textile factory', 750, 75, '1989-9-14', 'son');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('666884444', 'mohamed', 'primary student', NULL, 100, '2007-6-5', 'son');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('666884444', 'khaled', 'secandary student', NULL, 2000, '2003-7-7', 'son');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('666884444', 'mostafa', 'secandary student', NULL, 2000, '2002-9-8', 'son');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('666884444', 'mona', 'Housewife', NULL, NULL, '1975-8-6', 'wife');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('453453453', 'omar', 'saby naash', 250, 50, '1999-9-7', 'son');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('453453453', 'sara', 'primary student', NULL, 100, '2003-3-4', 'daughter');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('453453453', 'fatma', 'Home Cleaner', 200, 30, '1976-10-4', 'wife');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('987987987', 'yassmine', 'tailor', 500, 300, '1965-3-7', 'wife');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('987987987', 'fathe', 'College student', NULL, 400, '1996-4-14', 'son');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('789565423', 'aid', NULL, NULL, NULL, '1990-7-6', 'son');
INSERT INTO `Management system of charities`.`family member` (`id`, `name`, `job`, `income`, `costs`, `birth date`, `relationship`) VALUES ('235654446', 'hassen', NULL, NULL, NULL, '1989-4-12', 'son');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`sickness`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`sickness` (`type`, `medicine`) VALUES ('heard', 'Earphone');
INSERT INTO `Management system of charities`.`sickness` (`type`, `medicine`) VALUES ('sight', 'ABC');
INSERT INTO `Management system of charities`.`sickness` (`type`, `medicine`) VALUES ('cancer', 'ASF');
INSERT INTO `Management system of charities`.`sickness` (`type`, `medicine`) VALUES ('heart', 'qll');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`donation`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400005', '2014-3-3', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('900004', '2014-3-3', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('300001', '2014-3-4', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('900007', '2014-3-6', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('900006', '2014-3-1', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('300002', '2014-3-27', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400007', '2014-4-1', 'aid_alfater');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400008', '2014-7-2', 'aid_aladha');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('500001', '2014-7-2', 'aid_aladha');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400001', '2015-4-6', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('200003', '2015-4-4', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400004', '2015-4-6', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('900002', '2015-4-6', 'ramadan');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('500006', '2015-5-6', 'aid_alfater');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('500007', '2015-9-6', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('700001', '2015-10-8', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400017', '2015-11-8', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400002', '2015-12-8', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('900005', '2015-12-8', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('900017', '2016-4-3', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('500005', '2016-5-4', 'aid_aladha');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400009', '2016-5-7', 'aid_aladha');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('700003', '2016-5-3', 'aid_aladha');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('500004', '2016-5-3', 'aid_aladha');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('900009', '2017-5-2', 'aid_aladha');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400015', '2017-5-3', 'aid_aladha');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400011', '2017-3-3', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('500017', '2017-4-10', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('900010', '2017-5-14', 'no');
INSERT INTO `Management system of charities`.`donation` (`code of donation`, `date`, `occasion`) VALUES ('400013', '2017-6-22', 'no');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`physical`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400005');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('300001');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('300002');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400007');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400008');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('500001');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400001');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('200003');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400004');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('500006');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('500007');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('700001');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400017');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400002');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('500005');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400009');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('700003');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('500004');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400015');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400011');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('500017');
INSERT INTO `Management system of charities`.`physical` (`code of donation`) VALUES ('400013');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`mony`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`mony` (`code of donation`, `amount`) VALUES ('900004', 2000);
INSERT INTO `Management system of charities`.`mony` (`code of donation`, `amount`) VALUES ('900007', 5000);
INSERT INTO `Management system of charities`.`mony` (`code of donation`, `amount`) VALUES ('900006', 500);
INSERT INTO `Management system of charities`.`mony` (`code of donation`, `amount`) VALUES ('900002', 7000);
INSERT INTO `Management system of charities`.`mony` (`code of donation`, `amount`) VALUES ('900017', 150);
INSERT INTO `Management system of charities`.`mony` (`code of donation`, `amount`) VALUES ('900009', 3000);
INSERT INTO `Management system of charities`.`mony` (`code of donation`, `amount`) VALUES ('900010', 700);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`kind`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400005', 'rice', '5 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400005', 'sugar', '4 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400005', 'oil', '3 L');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('300001', 'chickens', '7 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('300001', 'meat', '4 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('300002', 'rice', '4 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400007', 'new_clothes_men', '20 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400008', 'old_clothes_men', '13 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500001', 'new_clothes_women', '14 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400001', 'rice', '4 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('200003', 'sugar', '3 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('200003', 'oil', '2 L');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400004', 'chickens', '5 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400004', 'meat', '7 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500006', 'new_clothes_men', '16 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500006', 'old_clothes_men', '17 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500006', 'new_clothes_women', '18 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500006', 'new_clothes_children', '19 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500007', 'blanket', '13 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('700001', 'blanket', '14 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400017', 'blanket', '15 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400002', 'blanket', '16 p');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500005', 'meat', '20 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400009', 'meat', '10 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('700003', 'meat', '5 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500004', 'meat', '6 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400015', 'meat', '7 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400011', 'rice', '15 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('500017', 'meat', '15 kg');
INSERT INTO `Management system of charities`.`kind` (`code of donation`, `name`, `quantity`) VALUES ('400013', 'old_clothes_men', '20 p');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`Beneficiary_has_sikness`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`Beneficiary_has_sikness` (`id`, `type`) VALUES ('453846416', 'heart');
INSERT INTO `Management system of charities`.`Beneficiary_has_sikness` (`id`, `type`) VALUES ('453453453', 'heard');
INSERT INTO `Management system of charities`.`Beneficiary_has_sikness` (`id`, `type`) VALUES ('235654446', 'heart');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`family member_has_sikness`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`family member_has_sikness` (`id`, `name`, `type`) VALUES ('789565423', 'aid', 'heard');
INSERT INTO `Management system of charities`.`family member_has_sikness` (`id`, `name`, `type`) VALUES ('235654446', 'hassen', 'sight');
INSERT INTO `Management system of charities`.`family member_has_sikness` (`id`, `name`, `type`) VALUES ('666884444', 'mona', 'cancer');
INSERT INTO `Management system of charities`.`family member_has_sikness` (`id`, `name`, `type`) VALUES ('666884444', 'mohamed', 'heart');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`donner_has_donation`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('123456789', '400005');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('999887777', '900004');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('123456789', '300001');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('999887777', '900007');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('888665555', '900004');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('789567162', '300002');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('888665555', '400007');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('987654321', '400008');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('333445555', '500001');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('789567162', '400001');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('123456789', '200003');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('333445555', '400004');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('999887777', '900002');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('888665555', '500006');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('987654321', '500007');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('999887777', '700001');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('789567162', '400017');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('333445555', '400002');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('333445555', '900005');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('888665555', '900007');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('999887777', '500005');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('123456789', '400009');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('888665555', '700003');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('789567162', '500004');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('888665555', '900009');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('123456789', '400015');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('999887777', '400011');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('888665555', '500017');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('123456789', '900010');
INSERT INTO `Management system of charities`.`donner_has_donation` (`id`, `code of donation`) VALUES ('333445555', '400013');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`Benefit`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('666884444', '2015-2-2', 'aid');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('453453453', '2016-2-3', 'aid');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('987987987', '2016-4-3', 'aid');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('789565423', '2016-9-7', 'ramadan');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('235654446', '2016-9-10', 'ramadan');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('792354657', '2017-2-14', 'no');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('778200005', '2017-3-15', 'no');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('453846416', '2017-4-16', 'no');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('666884444', '2017-7-16', 'no');
INSERT INTO `Management system of charities`.`Benefit` (`id`, `date`, `occasion`) VALUES ('453453453', '2017-8-26', 'no');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`mony b`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('666884444', '2015-2-2', 4000);
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('987987987', '2016-4-3', 2000);
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('789565423', '2016-9-7', 800);
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('235654446', '2016-9-10', 4000);
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('792354657', '2017-2-14', 350);
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('778200005', '2017-3-15', 250);
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('453846416', '2017-4-16', 4000);
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('666884444', '2017-7-16', 4000);
INSERT INTO `Management system of charities`.`mony b` (`id`, `date`, `amount`) VALUES ('453453453', '2017-8-26', 1500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Management system of charities`.`physical kind b`
-- -----------------------------------------------------
START TRANSACTION;
USE `Management system of charities`;
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('666884444', '2015-2-2', 'rice', '4 kg  ');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('666884444', '2015-2-2', 'sugar', '3 kg    ');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('666884444', '2015-2-2', 'oil', '2 L');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('666884444', '2015-2-2', 'chickens', '3 kg    ');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('453453453', '2016-2-3', 'blanket', '3');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('453453453', '2016-2-3', 'new_clothes_men', '3');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('453453453', '2016-2-3', 'new_clothes_women', '3');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('453453453', '2016-2-3', 'new_clothes_children', '2');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('666884444', '2017-7-16', 'blanket', '3');
INSERT INTO `Management system of charities`.`physical kind b` (`id`, `date`, `name`, `quantity`) VALUES ('666884444', '2017-7-16', 'meat', '4 kg');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
