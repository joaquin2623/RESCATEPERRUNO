CREATE SCHEMA IF NOT EXISTS `TALLERES` DEFAULT CHARACTER SET utf8 ;
USE `TALLERES` ;
-- -----------------------------------------------------
-- Table `TALLERES`.`Institucion`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `TALLERES`.`Institucion` (
  `idInstitucion` INT NOT NULL auto_increment,
  `nombre` VARCHAR(85) NOT NULL,
  `nivel` VARCHAR(45) NOT NULL,
  `codigo_modular` VARCHAR(10) NOT NULL,
  `logo` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idInstitucion`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `TALLERES`.`Grado`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `TALLERES`.`Grado` (
  `idGrado` INT NOT NULL auto_increment,
  `grado` VARCHAR(45) NOT NULL,
  `seccion` VARCHAR(2) NULL,
  `tutor` VARCHAR(75) NULL,
  PRIMARY KEY (`idGrado`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `TALLERES`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TALLERES`.`Estudiante` (
  `idEstudiante` INT NOT NULL auto_increment,
  `nombre` VARCHAR(75) NOT NULL,
  `apellido` VARCHAR(55) NOT NULL,
  `dni` INT (8) NOT NULL,
  `codigo_est` VARCHAR(20) NOT NULL,
  `idGrado` INT NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `fk_Estudiante_Grado` USING HASH (`idGrado`),
  CONSTRAINT `fk_Estudiante_Grado`
    FOREIGN KEY (`idGrado`)
    REFERENCES `TALLERES`.`Grado` (`idGrado`)
    ON UPDATE CASCADE)
ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -----------------------------------------------------
-- Table `TALLERES`.`Asistencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TALLERES`.`Asistencias` (
  `idAsistencias` INT NOT NULL auto_increment,
  `inasistencias_justificada` VARCHAR(2) NOT NULL,
  `inasistencias_injustificada` VARCHAR(2) NOT NULL,
  `tardanza_justificada` VARCHAR(2) NOT NULL,
  `tardanza_injustificada` VARCHAR(2) NOT NULL,
  `idEstudiante` INT NOT NULL,
  PRIMARY KEY (`idAsistencias`),
  KEY `fk_Asistencias_Estudiante` USING HASH (`idEstudiante`),
  CONSTRAINT `fk_Asistencias_Estudiante`
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `TALLERES`.`Estudiante` (`idEstudiante`)
    ON UPDATE CASCADE)
ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -----------------------------------------------------
-- Table `TALLERES`.`Tipo_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TALLERES`.`Tipo_Usuario` (
  `idTipo_Usuario` INT NOT NULL auto_increment,
  `tipo` VARCHAR(85) NOT NULL,
  PRIMARY KEY (`idTipo_Usuario`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -----------------------------------------------------
-- Table `TALLERES`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TALLERES`.`Curso` (
  `idCurso` INT NOT NULL auto_increment,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -----------------------------------------------------
-- Table `TALLERES`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TALLERES`.`Personal` (
  `idPersonal` INT NOT NULL auto_increment,
  `nombre` VARCHAR(55) NOT NULL,
  `apellido` VARCHAR(75) NOT NULL,
  `usuario` VARCHAR(10) NOT NULL,
  `clave` VARCHAR(8) NOT NULL,
  `idTipo_usuario` INT NOT NULL,
  `idCurso` INT NOT NULL,
  PRIMARY KEY (`idPersonal`),
  KEY `fk_Personal_TipoUsuario` USING HASH (`idTipo_usuario`),
  KEY `fk_Personal_Curso` USING HASH (`idCurso`),
  CONSTRAINT `fk_Personal_TipoUsuario`
    FOREIGN KEY (`idTipo_usuario`)
    REFERENCES `TALLERES`.`Tipo_Usuario` (`idTipo_usuario`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Personal_Curso`
    FOREIGN KEY (`idCurso`)
    REFERENCES `TALLERES`.`Curso` (`idCurso`)
    ON UPDATE CASCADE)
ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -----------------------------------------------------
-- Table `TALLERES`.`Notas_Periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TALLERES`.`Notas_Periodo` (
  `idPeriodo` INT NOT NULL auto_increment,
  `nota_periodo1` VARCHAR(45) NOT NULL,
  `nota_periodo2` VARCHAR(45) NOT NULL,
  `nota_periodo3` VARCHAR(45) NOT NULL,
  `nota_periodo4` VARCHAR(45) NOT NULL,
  `promedio_anual` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeriodo`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -----------------------------------------------------
-- Table `TALLERES`.`Notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TALLERES`.`Notas` (
  `idNotas` INT NOT NULL auto_increment,
  `idEstudiante` INT NOT NULL,
  `idCurso` INT NOT NULL,
  `idPeriodo` INT NOT NULL,
  `nota1` DECIMAL NOT NULL,
  `nota2` DECIMAL NOT NULL,
  `nota3` DECIMAL NOT NULL,
  `nota4` DECIMAL NOT NULL,
  `promedio` DECIMAL NOT NULL,
  PRIMARY KEY (`idNotas`),
  KEY `fk_Notas_Estudiante` USING HASH (`idEstudiante`),
  KEY `fk_Notas_Curso` USING HASH (`idCurso`),
  KEY `fk_Notas_Periodo` USING HASH (`idPeriodo`),
  CONSTRAINT `fk_Notas_Estudiante`
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `TALLERES`.`Estudiante` (`idEstudiante`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Notas_Curso`
    FOREIGN KEY (`idCurso`)
    REFERENCES `TALLERES`.`Curso` (`idCurso`)
    ON UPDATE CASCADE,
    CONSTRAINT `fk_Notas_Periodo`
    FOREIGN KEY (`idPeriodo`)
    REFERENCES `TALLERES`.`Notas_Periodo` (`idPeriodo`)
    ON UPDATE CASCADE)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `TALLERES`.`Conclucion_Descriptiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TALLERES`.`Conclucion_Descriptiva` (
  `idConclucion_descriptiva` INT NOT NULL auto_increment,
  `idEstudiante` VARCHAR(45) NOT NULL,
  `idPersona` VARCHAR(45) DEFAULT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `periodo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConclucion_descriptiva`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -----------------------------------------------------
