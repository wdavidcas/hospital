SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `GrupoPermiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GrupoPermiso` ;

CREATE TABLE IF NOT EXISTS `GrupoPermiso` (
  `idGrupoPermiso` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL COMMENT '_view_',
  PRIMARY KEY (`idGrupoPermiso`))
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `Permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permiso` ;

CREATE TABLE IF NOT EXISTS `Permiso` (
  `idPermiso` INT(11) NOT NULL AUTO_INCREMENT,
  `Formulario` VARCHAR(100) NOT NULL,
  `Etiqueta` VARCHAR(50) NOT NULL COMMENT '_view_',
  `GrupoPermiso_idGrupoPermiso` INT(11) NOT NULL,
  PRIMARY KEY (`idPermiso`),
  INDEX `fk_Permiso_GrupoPermiso1_idx` (`GrupoPermiso_idGrupoPermiso` ASC),
  CONSTRAINT `fk_Permiso_GrupoPermiso1`
    FOREIGN KEY (`GrupoPermiso_idGrupoPermiso`)
    REFERENCES `GrupoPermiso` (`idGrupoPermiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `Rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rol` ;

CREATE TABLE IF NOT EXISTS `Rol` (
  `idRol` INT(11) NOT NULL AUTO_INCREMENT,
  `Rol` VARCHAR(50) NOT NULL COMMENT '_view_',
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `RolPermiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RolPermiso` ;

CREATE TABLE IF NOT EXISTS `RolPermiso` (
  `idRolPermiso` INT(11) NOT NULL AUTO_INCREMENT,
  `Permiso` TINYINT UNSIGNED NOT NULL COMMENT '_view_',
  `Permiso_idPermiso` INT(11) NOT NULL,
  `Rol_idRol` INT(11) NOT NULL,
  PRIMARY KEY (`idRolPermiso`),
  INDEX `fk_RolPermiso_Permiso1_idx` (`Permiso_idPermiso` ASC),
  INDEX `fk_RolPermiso_Rol1_idx` (`Rol_idRol` ASC),
  CONSTRAINT `fk_RolPermiso_Permiso1`
    FOREIGN KEY (`Permiso_idPermiso`)
    REFERENCES `Permiso` (`idPermiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolPermiso_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `LugarTipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LugarTipo` ;

CREATE TABLE IF NOT EXISTS `LugarTipo` (
  `idLugarTipo` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(25) NOT NULL COMMENT '_view_',
  PRIMARY KEY (`idLugarTipo`))
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `Empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Empresa` ;

CREATE TABLE IF NOT EXISTS `Empresa` (
  `idEmpresa` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL COMMENT '_view_',
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `Lugar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Lugar` ;

CREATE TABLE IF NOT EXISTS `Lugar` (
  `idLugar` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Empresa_idEmpresa` INT(11) NOT NULL,
  `LugarTipo_idLugarTipo` TINYINT UNSIGNED NOT NULL,
  `Nombre` VARCHAR(60) NULL DEFAULT NULL COMMENT '_view_',
  `Direccion` VARCHAR(255) NULL DEFAULT NULL,
  `Telefono` VARCHAR(9) NULL DEFAULT NULL,
  `NumPlaca` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`idLugar`),
  INDEX `Lugares_FKIndex1` (`LugarTipo_idLugarTipo` ASC),
  INDEX `Lugar_FKIndex2` (`Empresa_idEmpresa` ASC),
  CONSTRAINT `fk_b8da4644-6acc-11e0-92aa-00242c5e35bb0`
    FOREIGN KEY (`LugarTipo_idLugarTipo`)
    REFERENCES `LugarTipo` (`idLugarTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_b8f62940-6acc-11e0-92aa-00242c5e35bb0`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `Maquina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Maquina` ;

CREATE TABLE IF NOT EXISTS `Maquina` (
  `idMaquina` INT(11) NOT NULL AUTO_INCREMENT,
  `Ip` VARCHAR(15) NULL DEFAULT NULL COMMENT '_view_',
  `Lugar_idLugar` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idMaquina`),
  UNIQUE INDEX `Maquina_index3095` (`Ip` ASC),
  INDEX `fk_Maquina_Lugar1_idx` (`Lugar_idLugar` ASC),
  CONSTRAINT `fk_Maquina_Lugar10`
    FOREIGN KEY (`Lugar_idLugar`)
    REFERENCES `Lugar` (`idLugar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `UsuarioCargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsuarioCargo` ;

CREATE TABLE IF NOT EXISTS `UsuarioCargo` (
  `idUsuarioCargo` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Cargo` VARCHAR(15) NOT NULL COMMENT '_view_',
  PRIMARY KEY (`idUsuarioCargo`))
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `Empresa_idEmpresa` INT(11) NOT NULL,
  `Rol_idRol` INT(11) NOT NULL,
  `UsuarioCargo_idUsuarioCargo` TINYINT UNSIGNED NOT NULL,
  `Nombres` VARCHAR(100) NOT NULL COMMENT '_view_',
  `Apellidos` VARCHAR(100) NOT NULL,
  `Usuario` VARCHAR(35) NOT NULL,
  `FechaHora` DATETIME NOT NULL,
  `Turno` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `Usuarios_indice` (`Usuario` ASC),
  INDEX `Usuarios_FKIndex1` (`UsuarioCargo_idUsuarioCargo` ASC),
  INDEX `Usuarios_FKIndex2` (`Rol_idRol` ASC),
  INDEX `Usuario_FKIndex3` (`Empresa_idEmpresa` ASC),
  CONSTRAINT `fk_b8dc818e-6acc-11e0-92aa-00242c5e35bb0`
    FOREIGN KEY (`UsuarioCargo_idUsuarioCargo`)
    REFERENCES `UsuarioCargo` (`idUsuarioCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_b8ecbe1e-6acc-11e0-92aa-00242c5e35bb0`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_b8f82a74-6acc-11e0-92aa-00242c5e35bb0`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = 0
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `Especialidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Especialidad` ;

CREATE TABLE IF NOT EXISTS `Especialidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `especialidad` VARCHAR(45) NULL,
  `habilitado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Doctor` ;

CREATE TABLE IF NOT EXISTS `Doctor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `direccion` VARCHAR(255) NULL,
  `nit` VARCHAR(13) NULL,
  `observaciones` TEXT NULL,
  `usuario` VARCHAR(35) NULL,
  `accionista` TINYINT(1) NULL DEFAULT 0,
  `habilitado` TINYINT(1) NULL,
  `Especialidad_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `NITINDEX` (`nit` ASC),
  INDEX `fk_Doctor_Especialidad1_idx` (`Especialidad_id` ASC),
  CONSTRAINT `fk_Doctor_Especialidad1`
    FOREIGN KEY (`Especialidad_id`)
    REFERENCES `Especialidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoTel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoTel` ;

CREATE TABLE IF NOT EXISTS `TipoTel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Contacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Contacto` ;

CREATE TABLE IF NOT EXISTS `Contacto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `direccion` VARCHAR(255) NULL,
  `observaciones` TEXT NULL,
  `habilitado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Departamento` ;

CREATE TABLE IF NOT EXISTS `Departamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `departamento` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Municipio` ;

CREATE TABLE IF NOT EXISTS `Municipio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `municipio` VARCHAR(45) NULL,
  `Departamento_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Municipio_Departamento1_idx` (`Departamento_id` ASC),
  CONSTRAINT `fk_Municipio_Departamento1`
    FOREIGN KEY (`Departamento_id`)
    REFERENCES `Departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Estadocivil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Estadocivil` ;

CREATE TABLE IF NOT EXISTS `Estadocivil` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `estadocivil` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aseguradora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aseguradora` ;

CREATE TABLE IF NOT EXISTS `Aseguradora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `habiitado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escolaridad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Escolaridad` ;

CREATE TABLE IF NOT EXISTS `Escolaridad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `escolaridad` VARCHAR(45) NULL,
  `habilitado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paciente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Paciente` ;

CREATE TABLE IF NOT EXISTS `Paciente` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `noexpediente` BIGINT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NULL,
  `nombrepadre` VARCHAR(100) NULL,
  `nombremadre` VARCHAR(100) NULL,
  `sexo` TINYINT NOT NULL COMMENT '1 Femenino\n0 Masculino',
  `direccion` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NULL,
  `fnacimiento` DATETIME NULL,
  `lugarnacimiento` VARCHAR(255) NULL,
  `lugarprocedencia` VARCHAR(255) NULL,
  `dpi` VARCHAR(14) NULL,
  `ocupacion` VARCHAR(45) NULL,
  `nombrepatrono` VARCHAR(100) NULL,
  `nombreconyuge` VARCHAR(45) NULL,
  `direccionconyuge` VARCHAR(45) NULL,
  `contactoemergencia` VARCHAR(100) NULL,
  `parentesco` VARCHAR(45) NULL,
  `direccionemergencia` VARCHAR(45) NULL,
  `responsablecuenta` VARCHAR(100) NULL,
  `direccionresponsable` VARCHAR(45) NULL,
  `nombretrabajo` VARCHAR(100) NULL,
  `direcciontrabajo` VARCHAR(45) NULL,
  `observaciones` TEXT NULL,
  `nit` VARCHAR(13) NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `activo` TINYINT(1) NULL COMMENT '1 Activo' /* comment truncated */ /*0 No Activo*/,
  `poliza` VARCHAR(10) NULL,
  `certificado` VARCHAR(10) NULL,
  `Municipio_id_b_` INT NULL,
  `Estadocivil_id` BIGINT NOT NULL,
  `Aseguradora_id` INT NULL,
  `Municipio_id_a_` INT NULL,
  `Escolaridad_id` INT NOT NULL,
  `asegurado` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Paciente_Municipio1_idx` (`Municipio_id_a_` ASC),
  UNIQUE INDEX `noexpediente_UNIQUE` (`noexpediente` ASC),
  UNIQUE INDEX `dpi_UNIQUE` (`dpi` ASC),
  INDEX `fk_Paciente_Estadocivil1_idx` (`Estadocivil_id` ASC),
  INDEX `fk_Paciente_Municipio2_idx` (`Municipio_id_b_` ASC),
  INDEX `fk_Paciente_Aseguradora1_idx` (`Aseguradora_id` ASC),
  UNIQUE INDEX `NITINDEX` (`nit` ASC),
  INDEX `fk_Paciente_Escolaridad1_idx` (`Escolaridad_id` ASC),
  CONSTRAINT `fk_Paciente_Municipio1`
    FOREIGN KEY (`Municipio_id_a_`)
    REFERENCES `Municipio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Estadocivil1`
    FOREIGN KEY (`Estadocivil_id`)
    REFERENCES `Estadocivil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Municipio2`
    FOREIGN KEY (`Municipio_id_b_`)
    REFERENCES `Municipio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Aseguradora1`
    FOREIGN KEY (`Aseguradora_id`)
    REFERENCES `Aseguradora` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Escolaridad1`
    FOREIGN KEY (`Escolaridad_id`)
    REFERENCES `Escolaridad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proveedor` ;

CREATE TABLE IF NOT EXISTS `Proveedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL,
  `contacto` VARCHAR(100) NULL,
  `direccion` VARCHAR(255) NULL,
  `nit` VARCHAR(15) NULL,
  `observaciones` TEXT NULL,
  `habilitado` TINYINT(1) NULL,
  `es_medicamento` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `NITINDEX` (`nit` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Telefono`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Telefono` ;

CREATE TABLE IF NOT EXISTS `Telefono` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(13) NOT NULL,
  `TipoTel_id` INT NOT NULL,
  `Doctor_id` INT NULL,
  `Contacto_id` INT NULL,
  `Paciente_id` BIGINT NULL,
  `Proveedor_id` INT NULL,
  INDEX `fk_Doctor_has_TipoTel_TipoTel1_idx` (`TipoTel_id` ASC),
  INDEX `fk_Doctor_has_TipoTel_Doctor1_idx` (`Doctor_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_Telefono_Contacto1_idx` (`Contacto_id` ASC),
  INDEX `fk_Telefono_Paciente1_idx` (`Paciente_id` ASC),
  INDEX `fk_Telefono_Proveedor1_idx` (`Proveedor_id` ASC),
  CONSTRAINT `fk_Doctor_has_TipoTel_Doctor1`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `Doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_has_TipoTel_TipoTel1`
    FOREIGN KEY (`TipoTel_id`)
    REFERENCES `TipoTel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefono_Contacto1`
    FOREIGN KEY (`Contacto_id`)
    REFERENCES `Contacto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefono_Paciente1`
    FOREIGN KEY (`Paciente_id`)
    REFERENCES `Paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefono_Proveedor1`
    FOREIGN KEY (`Proveedor_id`)
    REFERENCES `Proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tipoegreso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tipoegreso` ;

CREATE TABLE IF NOT EXISTS `Tipoegreso` (
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  `tipoegreso` VARCHAR(45) NULL,
  `habilitado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Servicio` ;

CREATE TABLE IF NOT EXISTS `Servicio` (
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  `servicio` VARCHAR(45) NULL,
  `habilitado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Habitaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Habitaciones` ;

CREATE TABLE IF NOT EXISTS `Habitaciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habitacion` VARCHAR(5) NULL,
  `ocupada` TINYINT(1) NULL,
  `habilitado` TINYINT(1) NULL,
  `Servicio_id` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Habitaciones_Servicio1_idx` (`Servicio_id` ASC),
  CONSTRAINT `fk_Habitaciones_Servicio1`
    FOREIGN KEY (`Servicio_id`)
    REFERENCES `Servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Controlingresos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Controlingresos` ;

CREATE TABLE IF NOT EXISTS `Controlingresos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `edad` TINYINT NULL,
  `otrosingresos` TINYINT NOT NULL COMMENT '1 SI\n0 NO',
  `fechaingreso` DATETIME NOT NULL,
  `fechaegreso` DATETIME NULL,
  `diasestancia` TINYINT NULL,
  `causamuerte` TEXT NULL,
  `menor` TINYINT(1) NULL COMMENT '1 SI\n0 NO',
  `autopsia` TINYINT(1) NULL COMMENT '1 SI\n0 NO',
  `diagnosticofinal` TEXT NULL,
  `complicaciones` TEXT NULL,
  `operaciones` TEXT NULL,
  `habitacion` VARCHAR(7) NULL,
  `observaciones` TEXT NULL,
  `nofactura` VARCHAR(15) NULL,
  `Servicio_id` TINYINT NOT NULL,
  `Paciente_id` BIGINT NOT NULL,
  `Doctor_id` INT NULL,
  `Tipoegreso_id` TINYINT NULL,
  `Habitaciones_id` INT NULL,
  `es_emergencia` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Controlingresos_Tipoegreso1_idx` (`Tipoegreso_id` ASC),
  INDEX `fk_Controlingresos_Servicio1_idx` (`Servicio_id` ASC),
  INDEX `fk_Controlingresos_Paciente1_idx` (`Paciente_id` ASC),
  INDEX `fk_Controlingresos_Doctor1_idx` (`Doctor_id` ASC),
  INDEX `fk_Controlingresos_Habitaciones1_idx` (`Habitaciones_id` ASC),
  CONSTRAINT `fk_Controlingresos_Tipoegreso1`
    FOREIGN KEY (`Tipoegreso_id`)
    REFERENCES `Tipoegreso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Controlingresos_Servicio1`
    FOREIGN KEY (`Servicio_id`)
    REFERENCES `Servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Controlingresos_Paciente1`
    FOREIGN KEY (`Paciente_id`)
    REFERENCES `Paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Controlingresos_Doctor1`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `Doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Controlingresos_Habitaciones1`
    FOREIGN KEY (`Habitaciones_id`)
    REFERENCES `Habitaciones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RolesMedicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RolesMedicos` ;

CREATE TABLE IF NOT EXISTS `RolesMedicos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `mes` TINYINT NULL,
  `anio` VARCHAR(5) NULL,
  `dia` TINYINT NULL,
  `Doctor_id` INT NOT NULL,
  `Especialidad_id` INT NOT NULL,
  `observaciones` TEXT NULL,
  `usuario` VARCHAR(35) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_RolesMedicos_Doctor1_idx` (`Doctor_id` ASC),
  INDEX `fk_RolesMedicos_Especialidad1_idx` (`Especialidad_id` ASC),
  CONSTRAINT `fk_RolesMedicos_Doctor1`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `Doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolesMedicos_Especialidad1`
    FOREIGN KEY (`Especialidad_id`)
    REFERENCES `Especialidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticketparqueo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ticketparqueo` ;

CREATE TABLE IF NOT EXISTS `Ticketparqueo` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `fechahora` DATETIME NULL,
  `responsable` VARCHAR(100) NULL,
  `placa` VARCHAR(8) NULL,
  `marca` VARCHAR(45) NULL,
  `color` VARCHAR(20) NULL,
  `Paciente_id` BIGINT NOT NULL,
  `habitacion` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ticketparqueo_Paciente1_idx` (`Paciente_id` ASC),
  CONSTRAINT `fk_Ticketparqueo_Paciente1`
    FOREIGN KEY (`Paciente_id`)
    REFERENCES `Paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Categoria` ;

CREATE TABLE IF NOT EXISTS `Categoria` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NULL,
  `habilitado` TINYINT(1) NULL,
  `es_medicamento` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medida` ;

CREATE TABLE IF NOT EXISTS `Medida` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `medida` VARCHAR(45) NULL,
  `es_medicamento` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `derivado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `derivado` ;

CREATE TABLE IF NOT EXISTS `derivado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `derivado` VARCHAR(45) NULL,
  `Medida_id` INT NOT NULL,
  `factorconversion` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_derivado_Medida1_idx` (`Medida_id` ASC),
  CONSTRAINT `fk_derivado_Medida1`
    FOREIGN KEY (`Medida_id`)
    REFERENCES `Medida` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Laboratorio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Laboratorio` ;

CREATE TABLE IF NOT EXISTS `Laboratorio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL,
  `observaciones` TEXT NULL,
  `habilitado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medicamento` ;

CREATE TABLE IF NOT EXISTS `Medicamento` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(10) NULL,
  `nombre` VARCHAR(100) NULL,
  `nombregenerico` VARCHAR(100) NULL,
  `descripcion` VARCHAR(100) NULL,
  `precio` FLOAT NULL,
  `habilitado` TINYINT(1) NULL,
  `maximo` INT NULL,
  `minimo` INT NULL,
  `composicion` VARCHAR(255) NULL,
  `presentacion` VARCHAR(255) NULL,
  `es_medicamento` TINYINT(1) NULL COMMENT '1 Si es ' /* comment truncated */ /*0 Si no es*/,
  `Proveedor_id` INT NULL,
  `Medida_id` INT NOT NULL,
  `Categoria_id` BIGINT NULL,
  `Laboratorio_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Medicamento_Proveedor1_idx` (`Proveedor_id` ASC),
  INDEX `fk_Medicamento_Categoria1_idx` (`Categoria_id` ASC),
  INDEX `fk_Medicamento_Medida1_idx` (`Medida_id` ASC),
  INDEX `fk_Medicamento_Laboratorio1_idx` (`Laboratorio_id` ASC),
  CONSTRAINT `fk_Medicamento_Proveedor1`
    FOREIGN KEY (`Proveedor_id`)
    REFERENCES `Proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicamento_Categoria1`
    FOREIGN KEY (`Categoria_id`)
    REFERENCES `Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicamento_Medida1`
    FOREIGN KEY (`Medida_id`)
    REFERENCES `Medida` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicamento_Laboratorio1`
    FOREIGN KEY (`Laboratorio_id`)
    REFERENCES `Laboratorio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicamentoLugar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicamentoLugar` ;

CREATE TABLE IF NOT EXISTS `MedicamentoLugar` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `existencia` FLOAT NULL COMMENT 'existencia total',
  `habilitado` TINYINT(1) NULL,
  `Servicio_id` TINYINT NOT NULL,
  `Medicamento_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_MedicamentoLugar_Servicio1_idx` (`Servicio_id` ASC),
  INDEX `fk_MedicamentoLugar_Medicamento1_idx` (`Medicamento_id` ASC),
  CONSTRAINT `fk_MedicamentoLugar_Servicio1`
    FOREIGN KEY (`Servicio_id`)
    REFERENCES `Servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MedicamentoLugar_Medicamento1`
    FOREIGN KEY (`Medicamento_id`)
    REFERENCES `Medicamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Lote` ;

CREATE TABLE IF NOT EXISTS `Lote` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `existencia` FLOAT NULL,
  `costo` FLOAT NULL,
  `costodescuento` FLOAT NULL,
  `fechaingreso` DATE NULL,
  `terminado` FLOAT NULL,
  `lotetotal` FLOAT NULL,
  `fecha_vencimiento` DATE NULL,
  `MedicamentoLugar_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Lote_MedicamentoLugar1_idx` (`MedicamentoLugar_id` ASC),
  CONSTRAINT `fk_Lote_MedicamentoLugar1`
    FOREIGN KEY (`MedicamentoLugar_id`)
    REFERENCES `MedicamentoLugar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Compra` ;

CREATE TABLE IF NOT EXISTS `Compra` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `fechahora` DATETIME NOT NULL,
  `total` FLOAT NOT NULL,
  `factura` VARCHAR(8) NOT NULL,
  `anulada` TINYINT(1) NULL DEFAULT 0,
  `credito` TINYINT(1) NULL DEFAULT 0,
  `usuario_id` BIGINT NULL,
  `host` VARCHAR(45) NULL,
  `Proveedor_id` INT NOT NULL,
  `es_farmacia` TINYINT(1) NULL,
  `Servicio_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Compra_Proveedor1_idx` (`Proveedor_id` ASC),
  CONSTRAINT `fk_Compra_Proveedor1`
    FOREIGN KEY (`Proveedor_id`)
    REFERENCES `Proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DetalleCompra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DetalleCompra` ;

CREATE TABLE IF NOT EXISTS `DetalleCompra` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cantidad` FLOAT NULL,
  `costo` FLOAT NULL,
  `subtotal` FLOAT NULL,
  `precio` FLOAT NULL,
  `precioventa` FLOAT NULL,
  `cant_devuelta` FLOAT NULL,
  `anulada` TINYINT(1) NULL,
  `Compra_id` BIGINT NOT NULL,
  `MedicamentoLugar_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DetalleCompra_Compra1_idx` (`Compra_id` ASC),
  INDEX `fk_DetalleCompra_MedicamentoLugar1_idx` (`MedicamentoLugar_id` ASC),
  CONSTRAINT `fk_DetalleCompra_Compra1`
    FOREIGN KEY (`Compra_id`)
    REFERENCES `Compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleCompra_MedicamentoLugar1`
    FOREIGN KEY (`MedicamentoLugar_id`)
    REFERENCES `MedicamentoLugar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Requisicion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Requisicion` ;

CREATE TABLE IF NOT EXISTS `Requisicion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fechahora` DATETIME NULL,
  `usuario_id` BIGINT NULL,
  `host` VARCHAR(45) NULL,
  `anulada` TINYINT(1) NULL DEFAULT 0,
  `entregada` TINYINT(1) NULL DEFAULT 0,
  `parapaciente` TINYINT(1) NULL DEFAULT 0,
  `Servicio_id` TINYINT NULL,
  `Controlingresos_id` BIGINT NULL,
  `es_farmacia` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Requisicion_Servicio1_idx` (`Servicio_id` ASC),
  INDEX `fk_Requisicion_Controlingresos1_idx` (`Controlingresos_id` ASC),
  CONSTRAINT `fk_Requisicion_Servicio1`
    FOREIGN KEY (`Servicio_id`)
    REFERENCES `Servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Requisicion_Controlingresos1`
    FOREIGN KEY (`Controlingresos_id`)
    REFERENCES `Controlingresos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DetalleRequisicion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DetalleRequisicion` ;

CREATE TABLE IF NOT EXISTS `DetalleRequisicion` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cantidad` FLOAT NULL,
  `cantidad_real` FLOAT NULL,
  `cantidad_entregada` FLOAT NULL,
  `cantidad_entregada_real` FLOAT NULL,
  `cantidad_devuelta` FLOAT NULL,
  `cantidad_devuelta_real` FLOAT NULL,
  `cantidad_suministrada` FLOAT NULL,
  `cantidad_suministrada_real` FLOAT NULL,
  `anulado` TINYINT(1) NULL,
  `devolver` TINYINT(1) NULL,
  `Requisicion_id` INT NOT NULL,
  `MedicamentoLugar_id` BIGINT NOT NULL,
  `derivado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DetalleRequisicion_Requisicion1_idx` (`Requisicion_id` ASC),
  INDEX `fk_DetalleRequisicion_MedicamentoLugar1_idx` (`MedicamentoLugar_id` ASC),
  INDEX `fk_DetalleRequisicion_derivado1_idx` (`derivado_id` ASC),
  CONSTRAINT `fk_DetalleRequisicion_Requisicion1`
    FOREIGN KEY (`Requisicion_id`)
    REFERENCES `Requisicion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleRequisicion_MedicamentoLugar1`
    FOREIGN KEY (`MedicamentoLugar_id`)
    REFERENCES `MedicamentoLugar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleRequisicion_derivado1`
    FOREIGN KEY (`derivado_id`)
    REFERENCES `derivado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovimientoMedicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MovimientoMedicamento` ;

CREATE TABLE IF NOT EXISTS `MovimientoMedicamento` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cant_entrada` FLOAT NULL,
  `cant_salida` FLOAT NULL,
  `ultima_existencia` FLOAT NULL,
  `fechahora` DATETIME NULL,
  `usuario_id` BIGINT NULL,
  `host` VARCHAR(45) NULL,
  `motivo` VARCHAR(255) NULL,
  `costo` FLOAT NULL DEFAULT 0,
  `DetalleCompra_id` BIGINT NULL,
  `DetalleRequisicion_id` BIGINT NULL,
  `MedicamentoLugar_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_MovimientoMedicamento_DetalleCompra1_idx` (`DetalleCompra_id` ASC),
  INDEX `fk_MovimientoMedicamento_DetalleRequisicion1_idx` (`DetalleRequisicion_id` ASC),
  INDEX `fk_MovimientoMedicamento_MedicamentoLugar1_idx` (`MedicamentoLugar_id` ASC),
  CONSTRAINT `fk_MovimientoMedicamento_DetalleCompra1`
    FOREIGN KEY (`DetalleCompra_id`)
    REFERENCES `DetalleCompra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovimientoMedicamento_DetalleRequisicion1`
    FOREIGN KEY (`DetalleRequisicion_id`)
    REFERENCES `DetalleRequisicion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovimientoMedicamento_MedicamentoLugar1`
    FOREIGN KEY (`MedicamentoLugar_id`)
    REFERENCES `MedicamentoLugar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovimientoLote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MovimientoLote` ;

CREATE TABLE IF NOT EXISTS `MovimientoLote` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cant_entrada` FLOAT NULL,
  `cant_salida` FLOAT NULL,
  `ultima_existencia` FLOAT NULL,
  `Lote_id` BIGINT NOT NULL,
  `MovimientoMedicamento_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_MovimientoLote_Lote1_idx` (`Lote_id` ASC),
  INDEX `fk_MovimientoLote_MovimientoMedicamento1_idx` (`MovimientoMedicamento_id` ASC),
  CONSTRAINT `fk_MovimientoLote_Lote1`
    FOREIGN KEY (`Lote_id`)
    REFERENCES `Lote` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovimientoLote_MovimientoMedicamento1`
    FOREIGN KEY (`MovimientoMedicamento_id`)
    REFERENCES `MovimientoMedicamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovimientoServicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MovimientoServicio` ;

CREATE TABLE IF NOT EXISTS `MovimientoServicio` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cant_entrada` VARCHAR(45) NULL,
  `entregado` TINYINT(1) NULL,
  `anulado` TINYINT(1) NULL,
  `DetalleRequisicion_id` BIGINT NOT NULL,
  `MovimientoMedicamento_id_a_` BIGINT NOT NULL COMMENT 'Servicio de origen',
  `MovimientoMedicamento_id_b_` BIGINT NOT NULL COMMENT 'Servicio Destino',
  PRIMARY KEY (`id`),
  INDEX `fk_MovimientoServicio_DetalleRequisicion1_idx` (`DetalleRequisicion_id` ASC),
  INDEX `fk_MovimientoServicio_MovimientoMedicamento1_idx` (`MovimientoMedicamento_id_a_` ASC),
  INDEX `fk_MovimientoServicio_MovimientoMedicamento2_idx` (`MovimientoMedicamento_id_b_` ASC),
  CONSTRAINT `fk_MovimientoServicio_DetalleRequisicion1`
    FOREIGN KEY (`DetalleRequisicion_id`)
    REFERENCES `DetalleRequisicion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovimientoServicio_MovimientoMedicamento1`
    FOREIGN KEY (`MovimientoMedicamento_id_a_`)
    REFERENCES `MovimientoMedicamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovimientoServicio_MovimientoMedicamento2`
    FOREIGN KEY (`MovimientoMedicamento_id_b_`)
    REFERENCES `MovimientoMedicamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alimentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Alimentos` ;

CREATE TABLE IF NOT EXISTS `Alimentos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `alimento` VARCHAR(255) NULL,
  `precio` FLOAT NULL,
  `precioventa` FLOAT NULL,
  `habilitado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiciosSolicitados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ServiciosSolicitados` ;

CREATE TABLE IF NOT EXISTS `ServiciosSolicitados` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `examen` VARCHAR(255) NULL,
  `habilitado` TINYINT(1) NULL,
  `Servicio_id` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ServiciosSolicitados_Servicio1_idx` (`Servicio_id` ASC),
  CONSTRAINT `fk_ServiciosSolicitados_Servicio1`
    FOREIGN KEY (`Servicio_id`)
    REFERENCES `Servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IngresosAlimentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IngresosAlimentos` ;

CREATE TABLE IF NOT EXISTS `IngresosAlimentos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `precioventa` FLOAT NULL,
  `subtotal` FLOAT NULL,
  `cantidad` FLOAT NULL,
  `fecha` DATE NULL,
  `usuario_id` INT NULL,
  `Controlingresos_id` BIGINT NOT NULL,
  `Alimentos_id` BIGINT NOT NULL,
  INDEX `fk_Alimentos_has_Controlingresos_Controlingresos1_idx` (`Controlingresos_id` ASC),
  INDEX `fk_Alimentos_has_Controlingresos_Alimentos1_idx` (`Alimentos_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Alimentos_has_Controlingresos_Alimentos1`
    FOREIGN KEY (`Alimentos_id`)
    REFERENCES `Alimentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alimentos_has_Controlingresos_Controlingresos1`
    FOREIGN KEY (`Controlingresos_id`)
    REFERENCES `Controlingresos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PrecioServicios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrecioServicios` ;

CREATE TABLE IF NOT EXISTS `PrecioServicios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `precio` FLOAT NULL,
  `titulo` VARCHAR(10) NULL,
  `ServiciosSolicitados_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PrecioServicios_ServiciosSolicitados1_idx` (`ServiciosSolicitados_id` ASC),
  CONSTRAINT `fk_PrecioServicios_ServiciosSolicitados1`
    FOREIGN KEY (`ServiciosSolicitados_id`)
    REFERENCES `ServiciosSolicitados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IngresosServicios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IngresosServicios` ;

CREATE TABLE IF NOT EXISTS `IngresosServicios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cantidad` FLOAT NULL,
  `precioventa` FLOAT NULL,
  `subtotal` FLOAT NULL,
  `fecha` DATE NULL,
  `usuario_id` BIGINT NULL,
  `Habitaciones_id` INT NOT NULL,
  `PrecioServicios_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ServiciosSolicitados_has_Habitaciones_Habitaciones1_idx` (`Habitaciones_id` ASC),
  INDEX `fk_IngresosServicios_PrecioServicios1_idx` (`PrecioServicios_id` ASC),
  CONSTRAINT `fk_ServiciosSolicitados_has_Habitaciones_Habitaciones1`
    FOREIGN KEY (`Habitaciones_id`)
    REFERENCES `Habitaciones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IngresosServicios_PrecioServicios1`
    FOREIGN KEY (`PrecioServicios_id`)
    REFERENCES `PrecioServicios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipoextra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Equipoextra` ;

CREATE TABLE IF NOT EXISTS `Equipoextra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `equipo` VARCHAR(255) NULL,
  `precio` FLOAT NULL,
  `existencia` FLOAT NULL,
  `utilizados` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Detalleextra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Detalleextra` ;

CREATE TABLE IF NOT EXISTS `Detalleextra` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `precioventa` FLOAT NULL,
  `cantidad` FLOAT NULL,
  `fechahora` DATETIME NULL,
  `Controlingresos_id` BIGINT NOT NULL,
  `Equipoextra_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_IngresosServicios_has_Equipoextra_Equipoextra1_idx` (`Equipoextra_id` ASC),
  INDEX `fk_Detalleextra_Controlingresos1_idx` (`Controlingresos_id` ASC),
  CONSTRAINT `fk_IngresosServicios_has_Equipoextra_Equipoextra1`
    FOREIGN KEY (`Equipoextra_id`)
    REFERENCES `Equipoextra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalleextra_Controlingresos1`
    FOREIGN KEY (`Controlingresos_id`)
    REFERENCES `Controlingresos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ropaextra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ropaextra` ;

CREATE TABLE IF NOT EXISTS `Ropaextra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ropaextra` VARCHAR(255) NULL,
  `precio` FLOAT NULL,
  `existencia` FLOAT NULL,
  `utilizados` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Detalleropa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Detalleropa` ;

CREATE TABLE IF NOT EXISTS `Detalleropa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `precioventa` FLOAT NULL,
  `cantidad` FLOAT NULL,
  `fechahora` DATETIME NULL,
  `Controlingresos_id` BIGINT NOT NULL,
  `Ropaextra_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_IngresosServicios_has_Ropaextra_Ropaextra1_idx` (`Ropaextra_id` ASC),
  INDEX `fk_Detalleropa_Controlingresos1_idx` (`Controlingresos_id` ASC),
  CONSTRAINT `fk_IngresosServicios_has_Ropaextra_Ropaextra1`
    FOREIGN KEY (`Ropaextra_id`)
    REFERENCES `Ropaextra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalleropa_Controlingresos1`
    FOREIGN KEY (`Controlingresos_id`)
    REFERENCES `Controlingresos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Especialidad`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `Especialidad` (`id`, `especialidad`, `habilitado`) VALUES (NULL, 'PEDIATRA', NULL);
INSERT INTO `Especialidad` (`id`, `especialidad`, `habilitado`) VALUES (NULL, 'MEDICO GENERAL', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `TipoTel`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `TipoTel` (`id`, `tipo`) VALUES (NULL, 'RESIDENCIAL');
INSERT INTO `TipoTel` (`id`, `tipo`) VALUES (NULL, 'CELULAR');
INSERT INTO `TipoTel` (`id`, `tipo`) VALUES (NULL, 'FAX');
INSERT INTO `TipoTel` (`id`, `tipo`) VALUES (NULL, 'TRABAJO');
INSERT INTO `TipoTel` (`id`, `tipo`) VALUES (NULL, 'EMERGENCIA');
INSERT INTO `TipoTel` (`id`, `tipo`) VALUES (NULL, 'RESPONSABLE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Estadocivil`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `Estadocivil` (`id`, `estadocivil`) VALUES (NULL, 'SOLTERO (A)');
INSERT INTO `Estadocivil` (`id`, `estadocivil`) VALUES (NULL, 'CASADO (A)');
INSERT INTO `Estadocivil` (`id`, `estadocivil`) VALUES (NULL, 'DIVORCIADO (A)');
INSERT INTO `Estadocivil` (`id`, `estadocivil`) VALUES (NULL, 'SEPARADO (A)');
INSERT INTO `Estadocivil` (`id`, `estadocivil`) VALUES (NULL, 'VIUDO (A)');
INSERT INTO `Estadocivil` (`id`, `estadocivil`) VALUES (NULL, 'UNIDO (A)');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Escolaridad`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `Escolaridad` (`id`, `escolaridad`, `habilitado`) VALUES (NULL, 'Ninguno', true);
INSERT INTO `Escolaridad` (`id`, `escolaridad`, `habilitado`) VALUES (NULL, 'Primaria', true);
INSERT INTO `Escolaridad` (`id`, `escolaridad`, `habilitado`) VALUES (NULL, 'Básico', true);
INSERT INTO `Escolaridad` (`id`, `escolaridad`, `habilitado`) VALUES (NULL, 'Diversificado', true);
INSERT INTO `Escolaridad` (`id`, `escolaridad`, `habilitado`) VALUES (NULL, 'Universitario', true);
INSERT INTO `Escolaridad` (`id`, `escolaridad`, `habilitado`) VALUES (NULL, 'Ignorado', true);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tipoegreso`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `Tipoegreso` (`id`, `tipoegreso`, `habilitado`) VALUES (NULL, 'VIVO', NULL);
INSERT INTO `Tipoegreso` (`id`, `tipoegreso`, `habilitado`) VALUES (NULL, 'MUERTO', NULL);
INSERT INTO `Tipoegreso` (`id`, `tipoegreso`, `habilitado`) VALUES (NULL, 'CONTRA INDICACION', NULL);
INSERT INTO `Tipoegreso` (`id`, `tipoegreso`, `habilitado`) VALUES (NULL, 'ANTES DE 48 hrs', NULL);
INSERT INTO `Tipoegreso` (`id`, `tipoegreso`, `habilitado`) VALUES (NULL, 'TRANSFERIDO A OTRA INSTITUCION', NULL);
INSERT INTO `Tipoegreso` (`id`, `tipoegreso`, `habilitado`) VALUES (NULL, 'REFERDIO A', NULL);
INSERT INTO `Tipoegreso` (`id`, `tipoegreso`, `habilitado`) VALUES (NULL, 'DESPUES DE 48 hrs', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Servicio`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `Servicio` (`id`, `servicio`, `habilitado`) VALUES (NULL, 'MEDICINA', NULL);
INSERT INTO `Servicio` (`id`, `servicio`, `habilitado`) VALUES (NULL, 'CIRUGÍA', NULL);
INSERT INTO `Servicio` (`id`, `servicio`, `habilitado`) VALUES (NULL, 'OBSTETRÍCIA', NULL);
INSERT INTO `Servicio` (`id`, `servicio`, `habilitado`) VALUES (NULL, 'PEDIATRÍA', NULL);
INSERT INTO `Servicio` (`id`, `servicio`, `habilitado`) VALUES (NULL, 'TRAUMATOLOGÍA', NULL);
INSERT INTO `Servicio` (`id`, `servicio`, `habilitado`) VALUES (NULL, 'UCI', NULL);

COMMIT;


DELIMITER $$

DROP TRIGGER IF EXISTS `InsertaFechaEgresoControl` $$





CREATE TRIGGER `InsertaFechaEgresoControl` BEFORE UPDATE ON `Controlingresos`
 FOR EACH ROW 
BEGIN 
 IF ((OLD.fechaegreso IS NULL) AND (NEW.fechaegreso IS NOT NULL)) THEN
 		SET NEW.fechaegreso=NOW();
 		END IF;
 END;
$$


DROP TRIGGER IF EXISTS `anularLote` $$
CREATE TRIGGER anularLote BEFORE UPDATE ON Lote FOR EACH ROW
BEGIN

	IF NEW.existencia <= 0  THEN
		SET NEW.terminado = 1;
	ELSE
		SET NEW.terminado = 0;
	END IF;

END

$$


DROP TRIGGER IF EXISTS `Lote_AUPD` $$
CREATE TRIGGER `Lote_AUPD` AFTER UPDATE ON `Lote` FOR EACH ROW
BEGIN
-- Actualiza las existencias del producto 

	DECLARE varExistencia FLOAT DEFAULT 0;
	DECLARE varEntrada FLOAT DEFAULT 0;
	DECLARE varSalida FLOAT DEFAULT 0;
	
	SET varExistencia = NEW.existencia - OLD.existencia;
	
	IF (NEW.existencia > OLD.existencia) THEN
		SET varEntrada= varExistencia;
	ELSE
		SET varSalida = ABS(varExistencia);
	END IF;

	UPDATE MedicamentoLugar SET existencia=existencia+varExistencia WHERE id=NEW.MedicamentoLugar_id;

	INSERT INTO MovimientoLote (cant_entrada,cant_salida,ultima_existencia,Lote_id,MovimientoMedicamento_id)
	VALUES(varEntrada,varSalida,OLD.existencia,NEW.id,(SELECT MAX(id) FROM MovimientoMedicamento));


END$$


DROP TRIGGER IF EXISTS `Lote_AINS` $$
CREATE TRIGGER `Lote_AINS` AFTER INSERT ON `Lote` FOR EACH ROW
BEGIN

	UPDATE MedicamentoLugar
	SET existencia = CASE WHEN existencia=0 THEN NEW.existencia ELSE existencia + NEW.existencia END
	WHERE id=NEW.MedicamentoLugar_id;
	
 	INSERT MovimientoLote(cant_entrada,cant_salida,ultima_existencia,Lote_id,MovimientoMedicamento_id)
 	VALUES (NEW.existencia,0,0,NEW.id,(SELECT MAX(id) FROM MovimientoMedicamento));
END$$


DROP TRIGGER IF EXISTS `Compra_AUPD` $$
CREATE TRIGGER `Compra_AUPD` AFTER UPDATE ON `Compra` FOR EACH ROW
BEGIN
	DECLARE CONT INT DEFAULT 0;
	DECLARE varId BIGINT DEFAULT 0;
	DECLARE varCantidad FLOAT DEFAULT 0;

	DECLARE CursorDetalles CURSOR FOR SELECT id,cantidad FROM DetalleCompra WHERE Compra_id=NEW.id;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET CONT = 1;

	IF (NEW.anulada=1) THEN
		OPEN CursorDetalles;

		FETCH CursorDetalles INTO varId,varCantidad;

		WHILE NOT CONT DO
			UPDATE DetalleCompra SET anulada=1, cant_devuelta=varCantidad WHERE id=varId;
			FETCH CursorDetalles INTO varId,varCantidad;
		END WHILE;

		CLOSE CursorDetalles;
	END IF;




END$$


DROP TRIGGER IF EXISTS `DetalleCompra_AINS` $$
CREATE TRIGGER `DetalleCompra_AINS` AFTER INSERT ON `DetalleCompra` FOR EACH ROW
BEGIN
	DECLARE varExistencia FLOAT DEFAULT 0;
	
	SELECT existencia INTO varExistencia FROM MedicamentoLugar WHERE id=NEW.MedicamentoLugar_id;

	INSERT INTO MovimientoMedicamento (cant_entrada,cant_salida,ultima_existencia,fechahora,usuario_id,host,
	motivo,costo,DetalleCompra_id,MedicamentoLugar_id) VALUES (NEW.cantidad,0,varExistencia,NOW(),NULL,NULL,'Compra'
	,NEW.costo,NEW.id,NEW.MedicamentoLugar_id);
	
END$$


DROP TRIGGER IF EXISTS `DetalleCompra_AUPD` $$
CREATE TRIGGER `DetalleCompra_AUPD` AFTER UPDATE ON `DetalleCompra` FOR EACH ROW
BEGIN

	DECLARE varExistencia FLOAT DEFAULT 0;
	
	SELECT existencia INTO varExistencia FROM MedicamentoLugar WHERE id=NEW.MedicamentoLugar_id;

	IF((NEW.anulada=1) AND (OLD.anulada=1)) THEN
		INSERT INTO MovimientoMedicamento (cant_entrada,cant_salida,ultima_existencia,fechahora,usuario_id,host,
		motivo,costo,DetalleCompra_id,MedicamentoLugar_id) VALUES (0,(NEW.cantidad-OLD.cant_devuelta),varExistencia, NOW(),NULL,NULL,'Dev_Compra'
		,NEW.costo,NEW.id,NEW.MedicamentoLugar_id);
	ELSEIF (NEW.cant_devuelta>0) THEN
		INSERT INTO MovimientoMedicamento (cant_entrada,cant_salida,ultima_existencia,fechahora,usuario_id,host,
		motivo,costo,DetalleCompra_id,MedicamentoLugar_id) VALUES (0,(NEW.cant_devuelta-OLD.cant_devuelta),varExistencia, NOW(),NULL,NULL,'Dev_Compra'
		,NEW.costo,NEW.id,NEW.MedicamentoLugar_id);
	END IF;
END$$


DROP TRIGGER IF EXISTS `anularRequisicion` $$
CREATE TRIGGER anularRequisicion AFTER UPDATE ON Requisicion FOR EACH ROW
BEGIN

DECLARE msg VARCHAR(32) DEFAULT "";
DECLARE _restante FLOAT DEFAULT 0;
DECLARE _terminado BOOLEAN DEFAULT 0;
DECLARE _entregada FLOAT DEFAULT 0;
DECLARE _cant_suministrada FLOAT DEFAULT 0;
DECLARE _cant_devuelta FLOAT DEFAULT 0;
DECLARE _id_detalle BIGINT DEFAULT 0;
DECLARE _id_medlugar BIGINT DEFAULT 0;
DECLARE _existencia FLOAT DEFAULT 0;
DECLARE ID_usuario INT DEFAULT 0;
DECLARE host_actual VARCHAR(45);
DECLARE _factor FLOAT DEFAULT 1;

-- otras variables
DECLARE id_mservicio BIGINT DEFAULT 0;
DECLARE _cant_entrada FLOAT DEFAULT 0;
DECLARE id_detreq BIGINT DEFAULT 0;
DECLARE movmed_a BIGINT DEFAULT 0;
DECLARE movmed_b BIGINT DEFAULT 0;

DECLARE id_movmed_a BIGINT DEFAULT 0;
DECLARE id_movmed_b BIGINT DEFAULT 0;
DECLARE existencia_actual FLOAT DEFAULT 0;


DECLARE cursor_detreq CURSOR FOR 
SELECT dr.id, dr.cantidad_entregada, IFNULL(dr.cantidad_suministrada,0), IFNULL(dr.cantidad_devuelta,0), ml.id, ml.existencia, d.factorconversion 
FROM DetalleRequisicion dr  
INNER JOIN  MedicamentoLugar ml ON dr.MedicamentoLugar_id = ml.id 
INNER JOIN  derivado d ON dr.derivado_id = d.id
WHERE dr.Requisicion_id = NEW.id;

DECLARE cursor_mservicios CURSOR FOR 
SELECT ms.id, ms.cant_entrada, ms.DetalleRequisicion_id, ms.MovimientoMedicamento_id_a_, ms.MovimientoMedicamento_id_b_ 
FROM MovimientoServicio ms 
INNER JOIN DetalleRequisicion dr ON ms.DetalleRequisicion_id = dr.id AND dr.Requisicion_id = OLD.id ;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET _terminado = 1;

SELECT SUBSTRING_INDEX(USER(), '@', -1) INTO host_actual;
SELECT u.idUsuario INTO ID_usuario FROM Usuario u WHERE u.Usuario LIKE SUBSTRING_INDEX( SUBSTRING_INDEX(USER(), '@', 1 ),'_',-1);

IF NEW.anulada = 1  AND NEW.parapaciente=true THEN
	-- anulación de requisición de pacientes
	
	-- se actualizan todos los detalles de esta forma debido al funcionamiento interno del trigger de actualizacion de detalle de requisicion.
	UPDATE DetalleRequisicion SET anulado = 1, cantidad_entregada_real = -1, cantidad_devuelta_real = -1, cantidad_suministrada_real = -1  WHERE Requisicion_id = OLD.id;

	OPEN cursor_detreq;
	FETCH cursor_detreq INTO _id_detalle, _entregada, _cant_suministrada, _cant_devuelta, _id_medlugar, _existencia, _factor;
	WHILE NOT _terminado DO
		
		-- insertar los movimientos de medicamento para devolver medicamentos
		IF (_cant_suministrada = 0) THEN
			SET _restante = _entregada - (_cant_suministrada + _cant_devuelta);

			IF ((_restante > 0) AND (_cant_devuelta = 0)) THEN -- se inserta un movimiento medicamento solo si la cantidad que puede ser devuelta es mayor a cero y si no se han hecho devoluciones para el medicamento
				INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id)
				VALUES (_restante, 0, _existencia, NOW(), ID_usuario, host_actual,'Anular_Req_Paciente', NULL, _id_detalle, _id_medlugar);
				
			ELSEIF ((_restante > 0) AND (_cant_devuelta <> 0)) THEN -- si ya se hicieron devoluciones, hacer la anulación por medio de una devolución de lo restante			
				UPDATE DetalleRequisicion SET anulado = 1, cantidad_entregada_real = -1, cantidad_devuelta_real = _restante * _factor, cantidad_devuelta = _restante, cantidad_suministrada_real = -1  WHERE id = _id_detalle;
			END IF;		
		-- ELSE
			-- LANZAR ERROR DE QUE YA SE SUMINISTRO MEDICAMENTO AL PACIENTE
			-- set msg = 'Error: No se puede realizar la devolución. Ya se hicieron entregas de medicamento al paciente.';
       	-- signal sqlstate '45000' set message_text = msg;
		END IF;
		
		FETCH cursor_detreq INTO _id_detalle, _entregada, _cant_suministrada, _cant_devuelta, _id_medlugar, _existencia,  _factor;		
		
	END WHILE; 	
	CLOSE cursor_detreq;

ELSEIF NEW.anulada = 1  AND NEW.parapaciente=false THEN
	-- Anulación de requisición de servicio 
	
	-- se actualizan todos los detalles de esta forma debido al funcionamiento interno del trigger de actualizacion de detalle de requisicion.
	UPDATE DetalleRequisicion SET anulado = 1, cantidad_entregada_real = -1, cantidad_devuelta_real = -1, cantidad_suministrada_real = -1  WHERE Requisicion_id = OLD.id;	
	
	OPEN cursor_mservicios;
	FETCH cursor_mservicios INTO id_mservicio, _cant_entrada, id_detreq, movmed_a, movmed_b;
	WHILE NOT _terminado DO
		UPDATE MovimientoServicio SET anulado = 1  WHERE id = id_mservicio;
		
		-- seleccionar la existencia actual del medicamentolugar de destino de la requisicion original
		SELECT ml.id , ml.existencia INTO _id_medlugar, existencia_actual FROM MedicamentoLugar ml 
		INNER JOIN MovimientoMedicamento mm ON mm.MedicamentoLugar_id = ml.id AND mm.id = movmed_b 
		GROUP BY ml.id;
		
		-- insertar un movimientoMedicamento para registrar que se quitó cierta cantidad del medicamento destino
		INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id)
		VALUES (0, _cant_entrada, existencia_actual, NOW(), ID_usuario, host_actual, 'Anular_Req_Servicio_Salida', NULL, id_detreq, _id_medlugar); 		
		
		SELECT LAST_INSERT_ID() INTO id_movmed_a;
	
		-- seleccionar la existencia actual del medicamentolugar de origen de la requisicion original
		SELECT ml.id, ml.existencia INTO _id_medlugar, existencia_actual FROM MedicamentoLugar ml 
		INNER JOIN MovimientoMedicamento mm ON mm.MedicamentoLugar_id = ml.id AND mm.id = movmed_a 
		GROUP BY ml.id;
	
		-- insertar un movimientoMedicamento para registrar que se sumó de nuevo a la existencia del origen 
		INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id)
		VALUES (_cant_entrada, 0, existencia_actual, NOW(), ID_usuario, host_actual, 'Anular_Req_Servicio_Entrada', NULL, id_detreq, _id_medlugar);
		
		SELECT LAST_INSERT_ID() INTO id_movmed_b;
		
		INSERT INTO MovimientoServicio (cant_entrada, entregado, anulado, DetalleRequisicion_id, MovimientoMedicamento_id_a_, MovimientoMedicamento_id_b_)
	  	VALUES (_cant_entrada, 1, 0, id_detreq, id_movmed_a, id_movmed_b);
			
		FETCH cursor_mservicios INTO id_mservicio, _cant_entrada, id_detreq, movmed_a, movmed_b;
	END WHILE;
	CLOSE cursor_mservicios;
		
END IF;

END
$$


DROP TRIGGER IF EXISTS `DetalleRequisicion_BUPD` $$
CREATE TRIGGER `DetalleRequisicion_BUPD` BEFORE UPDATE ON `DetalleRequisicion` FOR EACH ROW
BEGIN

	DECLARE existencia_actual FLOAT DEFAULT 0;
	DECLARE ID_usuario INT DEFAULT 0;
	DECLARE host_actual VARCHAR(45);
	DECLARE tipo_requisicion INT DEFAULT 0;
	DECLARE existencia_destino FLOAT DEFAULT 0;
	DECLARE id_med_lugar_destino BIGINT DEFAULT 0;
	DECLARE id_servicio_destino INT DEFAULT 0;
	DECLARE id_medicamento BIGINT DEFAULT 0;
	DECLARE id_movservicio_a BIGINT DEFAULT 0;
	DECLARE id_movservicio_b BIGINT DEFAULT 0;

 -- obtener el ID de usuario
	SELECT SUBSTRING_INDEX(USER(), '@', -1) INTO host_actual;
	SELECT u.idUsuario INTO ID_usuario FROM Usuario u WHERE u.Usuario LIKE SUBSTRING_INDEX( SUBSTRING_INDEX(USER(), '@', 1 ),'_',-1);

 -- obtener la existencia del medicamento, antes de ejecutar el movimiento
	SELECT ml.existencia, ml.Medicamento_id INTO existencia_actual, id_medicamento FROM MedicamentoLugar ml WHERE ml.id = OLD.MedicamentoLugar_id;
	
	-- obtener el tipo de requisicion (1=requisicion de servicio; 0=requisicion de pacientes)
	SELECT COUNT(id) INTO tipo_requisicion FROM Requisicion WHERE id = OLD.Requisicion_id AND Servicio_id IS NOT NULL AND Controlingresos_id IS NULL;
	
	-- en caso de entrega
	IF NEW.cantidad_entregada_real > 0  THEN
		IF tipo_requisicion = 0  THEN
			-- insertar los movimientos para una requisicion de pacientes
			INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id) 
			VALUES (0,	NEW.cantidad_entregada,existencia_actual,NOW(),ID_usuario,host_actual,'Req_Paciente_Salida',NULL,OLD.id,OLD.MedicamentoLugar_id);
				
		ELSE
			-- obtener el ID del servicio de destino del medicamento
			SELECT r.Servicio_id INTO id_servicio_destino FROM Requisicion r WHERE r.id = OLD.Requisicion_id ;
		
			-- obtener el ID y la existencia del registro en MedicamentoLugar para el servicio de destino y el medicamento seleccionado
			SELECT ml.id, ml.existencia INTO id_med_lugar_destino, existencia_destino FROM MedicamentoLugar ml 
			WHERE ml.Servicio_id = id_servicio_destino AND ml.Medicamento_id = id_medicamento;	
	
			-- insertar los movimientos para una requisicion de servicios:
		
			-- movimiento medicamento de salida (desde origen)
			INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id) 
			VALUES (0,	NEW.cantidad_entregada,existencia_actual,NOW(),ID_usuario,host_actual,'Req_Servicio_Salida',NULL,OLD.id,OLD.MedicamentoLugar_id);
			SELECT LAST_INSERT_ID() INTO id_movservicio_a;		
			
			-- movimiento medicamento de entrada (hacia destino)
			INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id) 
			VALUES (NEW.cantidad_entregada,0,existencia_destino,NOW(),ID_usuario,host_actual,'Req_Servicio_Entrada', NULL ,OLD.id,id_med_lugar_destino);
			SELECT LAST_INSERT_ID() INTO id_movservicio_b;
			
			-- registrar el movimiento de servicio
			INSERT INTO MovimientoServicio (cant_entrada, entregado, anulado, DetalleRequisicion_id, MovimientoMedicamento_id_a_, MovimientoMedicamento_id_b_)
			VALUES (NEW.cantidad_entregada, 1, 0, OLD.id, id_movservicio_a, id_movservicio_b);
		END IF;
	
		SET NEW.cantidad_entregada = NEW.cantidad_entregada + OLD.cantidad_entregada,
			NEW.cantidad_entregada_real = NEW.cantidad_entregada_real + OLD.cantidad_entregada_real,
			NEW.cantidad_devuelta_real = OLD.cantidad_devuelta_real,
			NEW.cantidad_suministrada_real = OLD.cantidad_suministrada_real;	
	
	ELSEIF NEW.cantidad_devuelta_real > 0  AND NEW.devolver = 1  THEN
		-- marcar la devolucion para que farmacia la confirme	
		SET NEW.cantidad_entregada_real = OLD.cantidad_entregada_real, 
			NEW.cantidad_suministrada_real = OLD.cantidad_suministrada_real;
	
	ELSEIF NEW.cantidad_devuelta_real > 0  AND NEW.devolver = 0  THEN
		-- farmacia confirma la devolución

		SET NEW.cantidad_entregada_real = OLD.cantidad_entregada_real,
				NEW.cantidad_suministrada_real = OLD.cantidad_suministrada_real,				
				NEW.cantidad_devuelta_real = 0;	
		
		IF tipo_requisicion = 0  THEN
			-- devolucion de medicamento de requisicion de paciente
			INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id) 
			VALUES (NEW.cantidad_devuelta, 0 ,existencia_actual,NOW(),ID_usuario,host_actual,'Devolucion_Req_Paciente',NULL,OLD.id,OLD.MedicamentoLugar_id);
		ELSE
			-- devolucion de medicamento de requisicion de servicio
			
			-- obtener el ID del servicio de origen del medicamento (del que se quiere descontar para retornar)
			SELECT r.Servicio_id INTO id_servicio_destino FROM Requisicion r WHERE r.id = OLD.Requisicion_id ;
		
			-- obtener el ID y la existencia del MedicamentoLugar del que se va descontar (origen)
			SELECT ml.id, ml.existencia INTO id_med_lugar_destino, existencia_actual FROM MedicamentoLugar ml WHERE ml.Servicio_id = id_servicio_destino AND ml.Medicamento_id = id_medicamento;
			
			-- obtener la ultima existencia del medicamento al que se le va a retornar medicamento (destino)
			SELECT ml.existencia INTO existencia_destino FROM MedicamentoLugar ml WHERE ml.id = OLD.MedicamentoLugar_id	;
	
			-- insertar los movimientos para hacer la devolución de medicamentos en una requisicion de servicios:
		
			-- movimiento medicamento de salida (desde origen)
			INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id) 
			VALUES (0,	NEW.cantidad_devuelta,existencia_actual,NOW(),ID_usuario,host_actual,'Devolucion_Req_Servicio_Salida',NULL,OLD.id,id_med_lugar_destino);
			SELECT LAST_INSERT_ID() INTO id_movservicio_a;		
						
			-- movimiento medicamento de entrada (hacia destino)
			INSERT INTO MovimientoMedicamento (cant_entrada, cant_salida, ultima_existencia, fechahora, usuario_id, host, motivo, DetalleCompra_id, DetalleRequisicion_id, MedicamentoLugar_id) 
			VALUES (NEW.cantidad_devuelta, 0 ,existencia_destino,NOW(),ID_usuario,host_actual,'Devolucion_Req_Servicio_Entrada',NULL,OLD.id,OLD.MedicamentoLugar_id);
			SELECT LAST_INSERT_ID() INTO id_movservicio_b;

			-- registrar el movimiento de servicio
			INSERT INTO MovimientoServicio (cant_entrada, entregado, anulado, DetalleRequisicion_id, MovimientoMedicamento_id_a_, MovimientoMedicamento_id_b_)
			VALUES (NEW.cantidad_devuelta, 1, 0, OLD.id, id_movservicio_a, id_movservicio_b);
		END IF;
		
		SET NEW.cantidad_devuelta = IFNULL(OLD.cantidad_devuelta,0)  + NEW.cantidad_devuelta;
		
	ELSEIF NEW.cantidad_suministrada_real > 0  THEN
	
		SET NEW.cantidad_entregada_real = OLD.cantidad_entregada_real,
			NEW.cantidad_devuelta_real = OLD.cantidad_devuelta_real,
			NEW.cantidad_suministrada_real = OLD.cantidad_suministrada_real + NEW.cantidad_suministrada_real, 
			NEW.cantidad_suministrada = OLD.cantidad_suministrada + NEW.cantidad_suministrada;
			
	ELSEIF NEW.anulado = 1  THEN			
		SET NEW.cantidad_entregada_real = OLD.cantidad_entregada_real, 
			NEW.cantidad_devuelta_real = OLD.cantidad_devuelta_real,
			NEW.cantidad_suministrada_real = OLD.cantidad_suministrada_real;	
	END IF;	
	 
END$$


DROP TRIGGER IF EXISTS `actualizaExistenciaMedicamentoLugar` $$
CREATE TRIGGER actualizaExistenciaMedicamentoLugar AFTER INSERT ON MovimientoMedicamento
FOR EACH ROW
BEGIN

DECLARE _terminado BOOLEAN DEFAULT 0;
DECLARE id_lote BIGINT DEFAULT 0;
DECLARE acumulado FLOAT DEFAULT 0;
DECLARE lote_existencia FLOAT DEFAULT 0;
DECLARE varIdMov BIGINT DEFAULT 0;
DECLARE varIdLote BIGINT DEFAULT 0;
DECLARE _cant_salida FLOAT DEFAULT 0;
DECLARE _costo_lote FLOAT DEFAULT 0;

DECLARE msg VARCHAR(32) DEFAULT "";

-- CURSOR QUE SE UTILIZA PARA RECORRER LOS LOTES DE LOS QUE SE EFECTUÓ UNA SALIDA PARA UNA REQUISICION DE SERVICIO
DECLARE cursor_salida_lotes CURSOR FOR 
			SELECT ml.cant_salida, l.costo FROM MovimientoLote ml 
			INNER JOIN Lote l ON ml.Lote_id = l.id 
			WHERE ml.MovimientoMedicamento_id = (SELECT MAX(mm.id) FROM MovimientoMedicamento mm WHERE mm.Motivo = 'Req_Servicio_Salida' 
			AND mm.DetalleRequisicion_id = NEW.DetalleRequisicion_id);

DECLARE cursor_lotes CURSOR FOR SELECT id, existencia FROM Lote 
WHERE terminado = 0  
AND  MedicamentoLugar_id = NEW.MedicamentoLugar_id 
ORDER BY fechaingreso ASC;

-- CURSOR QUE LISTA LOS MOVIMIENTOS DE SALIDA PARA EL MOVIMIENTO DE MEDICAMENTO QUE SE ANULA 
-- (SE USA PARA HACER LAS DEVOLUCIONES A LOS LOTES CORRESPONDIENTES, EN LAS DEVOLUCIONES O ANULACIONES DE REQUISICIONES)
DECLARE cursor_movlotes CURSOR FOR SELECT ml.cant_salida, ml.Lote_id FROM MovimientoLote ml 
INNER JOIN MovimientoMedicamento mm ON ml.MovimientoMedicamento_id = mm.id 
AND mm.DetalleRequisicion_id = NEW.DetalleRequisicion_id 
AND mm.MedicamentoLugar_id = NEW.MedicamentoLugar_id 
AND (mm.Motivo ='Req_Paciente_Salida' OR mm.Motivo='Req_Servicio_Salida') 
AND mm.cant_salida <> 0  
AND mm.id <> NEW.id;

-- CURSOR QUE LISTA LOS MOVIMIENTOS DE ENTRADA PARA EL MOVIMIENTO DE MEDICAMENTO ANULADO 
-- (SE USA PARA QUITAR LA CANTIDAD ASIGNADA, A LOS LOTES A LOS QUE SE AGREGÓ DICHA CANTIDAD)
-- EN LA ANULACIÓN DE REQUISICIONES DE SERVICIO
DECLARE c_devolucion CURSOR FOR SELECT ml.cant_entrada, ml.Lote_id FROM MovimientoLote ml 
INNER JOIN MovimientoMedicamento mm ON ml.MovimientoMedicamento_id = mm.id 
AND mm.DetalleRequisicion_id = NEW.DetalleRequisicion_id 
AND mm.MedicamentoLugar_id = NEW.MedicamentoLugar_id
AND mm.cant_entrada <> 0  
AND mm.id <> NEW.id;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET _terminado = 1;

	-- IF ((NEW.cant_salida IS NOT NULL) AND (NEW.cant_salida <> 0)) THEN	
		
			IF (NEW.motivo ='Anular_Req_Servicio_Salida') THEN
			-- SI ES UN RETIRO POR DEVOLUCIÓN, SE DEBEN RETIRAR LAS UNIDADES DEL LOTE A DONDE SE ASIGNARON
			OPEN c_devolucion;
			FETCH c_devolucion INTO acumulado, id_lote;
			WHILE NOT _terminado DO
			
				SELECT existencia INTO lote_existencia FROM Lote WHERE id = id_lote;
				
				IF lote_existencia = acumulado THEN -- VERIFICAR QUE LA EXISTENCIA ACTUAL DEL LOTE SEA LA MISMA QUE LA CANTIDAD QUE SE LE INGRESÓ

				
					UPDATE Lote SET existencia = existencia - acumulado  WHERE id = id_lote;
				
				-- ELSE
					-- LANZAR ERROR DE CANTIDAD INSUFICIENTE
					-- set msg = 'Error: No se puede realizar la devolución. El lote de origen no tiene la cantidad originalmente asignada.';
        			-- signal sqlstate '45000' set message_text = msg;
				END IF;
								
				FETCH c_devolucion INTO acumulado, id_lote;
			END WHILE;
			CLOSE c_devolucion;
		END IF;
			
			-- movimiento de salida para entregar producto o para devolución de producto
		-- ELSEIF (NEW.DetalleCompra_id IS NULL AND NEW.DetalleRequisicion_id IS NOT NULL) THEN
		IF (((NEW.motivo='Req_Paciente_Salida') OR (NEW.motivo='Req_Servicio_Salida')) OR (NEW.motivo = 'Devolucion_Req_Servicio_Salida')) THEN
			-- operación con cursor para actualizar el movimiento de lotes (para una salida normal)
			SET acumulado = NEW.cant_salida;
			OPEN cursor_lotes;
			
			-- obtener el ID y la existencia de cada lote
			FETCH cursor_lotes INTO id_lote,lote_existencia;
			
			WHILE NOT _terminado DO 
				IF (lote_existencia >= acumulado) THEN
					-- si la existencia en el lote actual es mayor a la cantidad solicitada, se actualiza la cantidad y se detiene el ciclo
					-- INSERT INTO MovimientoLote (cant_entrada, cant_salida, ultima_existencia, Lote_id, MovimientoMedicamento_id) VALUES (0,acumulado,lote_existencia,id_lote,NEW.id);								
					UPDATE Lote SET existencia = existencia - acumulado WHERE id = id_lote;
					SET _terminado = 1;
				ELSE
					-- si la existencia en el lote actual es menor a la cantidad solicitada, se actualiza la existencia (se deja a cero), se marca como terminado el lote y se decrementa el acumulado del producto entregado
					-- INSERT INTO MovimientoLote (cant_entrada, cant_salida, ultima_existencia, Lote_id, MovimientoMedicamento_id) VALUES (0,lote_existencia,lote_existencia,id_lote,NEW.id);
					UPDATE Lote SET existencia = 0  WHERE id = id_lote;
					SET acumulado = acumulado - lote_existencia;
				END IF;
				FETCH cursor_lotes INTO id_lote,lote_existencia;				
			END WHILE;
			CLOSE cursor_lotes;
		END IF;
			
		-- UPDATE MedicamentoLugar SET existencia = existencia - NEW.cant_salida WHERE id = NEW.MedicamentoLugar_id;
		
IF (NEW.motivo='Req_Servicio_Entrada') THEN  -- Si el movimiento de medicamento es para ingreso de los lotes de medicamento provenientes de otro servicio
		    		
			OPEN cursor_salida_lotes;
			FETCH cursor_salida_lotes INTO _cant_salida, _costo_lote;
			WHILE NOT _terminado DO 

				INSERT INTO Lote(existencia,costo,fechaingreso,terminado,lotetotal,MedicamentoLugar_id)
				VALUES (_cant_salida, _costo_lote, NOW(), 0, _cant_salida, NEW.MedicamentoLugar_id);
				
			FETCH cursor_salida_lotes INTO _cant_salida, _costo_lote;
			END WHILE;
			CLOSE cursor_salida_lotes;
   		
       	
 END IF;
		-- devolucion

	IF ((NEW.motivo ='Anular_Req_Servicio_Entrada') OR (NEW.motivo ='Anular_Req_Paciente')) THEN
				-- devolución de requisición
				OPEN cursor_movlotes;
				FETCH cursor_movlotes INTO  acumulado, id_lote;
				WHILE NOT _terminado DO				
					-- INSERT INTO MovimientoLote (cant_entrada, cant_salida, ultima_existencia, Lote_id, MovimientoMedicamento_id) VALUES (acumulado,0, (SELECT existencia FROM Lote WHERE id = id_lote) , id_lote, NEW.id);
					UPDATE Lote SET existencia = existencia + acumulado, terminado = 0  WHERE id = id_lote;
					FETCH cursor_movlotes INTO  acumulado, id_lote; 
				END WHILE;
				CLOSE cursor_movlotes;
	END IF;	  
-- END IF; 

-- En caso de ser una devolución de medicamento (no anulación)
IF ((NEW.motivo = 'Devolucion_Req_Paciente') OR (NEW.motivo = 'Devolucion_Req_Servicio_Entrada')) THEN

			SET lote_existencia = NEW.cant_entrada; -- poner en lote existencia, la cantidad que se está retornando
			OPEN cursor_movlotes;
			FETCH cursor_movlotes INTO  acumulado, id_lote;
				WHILE NOT _terminado DO
					IF (acumulado >= lote_existencia) THEN -- si la cantidad que salió del lote es mayor a lo que se está devolviendo, solo se actualiza el lote con la cantidad a devolver
						UPDATE Lote SET existencia = existencia + lote_existencia, terminado = 0  WHERE id = id_lote;
						SET _terminado = 1;
					ELSE
						UPDATE Lote SET existencia = existencia + acumulado, terminado = 0  WHERE id = id_lote;
						SET lote_existencia = lote_existencia - acumulado;
					END IF;
					FETCH cursor_movlotes INTO  acumulado, id_lote; 
				END WHILE;
			CLOSE cursor_movlotes;
END IF;

	-- IF ((NEW.motivo='Primer_ingreso') OR (NEW.motivo='Compra')) THEN
	-- 	INSERT INTO Lote (existencia,costo,fechaingreso,terminado,lotetotal,MedicamentoLugar_id) VALUES
	-- 	(NEW.cant_entrada,NEW.costo,NOW(),0,NEW.cant_entrada,NEW.MedicamentoLugar_id);
	-- END IF;
	
	IF(NEW.motivo='Dev_Compra') THEN
		SELECT id INTO varIdMov FROM MovimientoMedicamento WHERE DetalleCompra_id=NEW.DetalleCompra_id
		AND cant_entrada>0 AND cant_salida<=0;

		SELECT Lote_id INTO varIdLote FROM MovimientoLote WHERE MovimientoMedicamento_id=varIdMov;

		UPDATE Lote SET existencia=existencia-NEW.cant_salida WHERE id=VarIdLote;

	END IF;
	
END$$


DROP TRIGGER IF EXISTS `MovimientoLote_BINS` $$
CREATE TRIGGER `MovimientoLote_BINS` BEFORE INSERT ON `MovimientoLote` FOR EACH ROW
BEGIN

	DECLARE varExistencia FLOAT DEFAULT 0;
	SELECT l.existencia INTO varExistencia FROM Lote l WHERE id=NEW.Lote_id;
	
	-- SET NEW.ultima_existencia=varExistencia;
	
END$$


DELIMITER ;
