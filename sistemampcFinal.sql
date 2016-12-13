/*
Navicat MariaDB Data Transfer

Source Server         : mpc
Source Server Version : 100119
Source Host           : localhost:3306
Source Database       : sistemampc

Target Server Type    : MariaDB
Target Server Version : 100119
File Encoding         : 65001

Date: 2016-12-12 20:04:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cambios_realizados
-- ----------------------------
DROP TABLE IF EXISTS `cambios_realizados`;
CREATE TABLE `cambios_realizados` (
  `id_cambio_realizado` int(11) NOT NULL AUTO_INCREMENT,
  `id_mantenimiento_cambio` int(11) NOT NULL,
  `id_proveedor_cambio` int(11) NOT NULL,
  `id_componente_vehiculo_cambio` int(11) NOT NULL,
  `precio_componente` double NOT NULL,
  PRIMARY KEY (`id_cambio_realizado`),
  KEY `fk_mantenimiento_cambio` (`id_mantenimiento_cambio`),
  KEY `fk_proveedor_cambio` (`id_proveedor_cambio`),
  KEY `fk_componente_vehiculo_componente` (`id_componente_vehiculo_cambio`),
  CONSTRAINT `fk_componente_vehiculo_componente` FOREIGN KEY (`id_componente_vehiculo_cambio`) REFERENCES `componentes_vehiculos` (`id_componente_vehiculo`),
  CONSTRAINT `fk_mantenimiento_cambio` FOREIGN KEY (`id_mantenimiento_cambio`) REFERENCES `mantenimientos` (`id_mantenimiento`),
  CONSTRAINT `fk_proveedor_cambio` FOREIGN KEY (`id_proveedor_cambio`) REFERENCES `proveedores` (`id_provedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cambios_realizados
-- ----------------------------
INSERT INTO `cambios_realizados` VALUES ('3', '3', '1', '2', '123123');
INSERT INTO `cambios_realizados` VALUES ('4', '3', '1', '3', '12312311');
INSERT INTO `cambios_realizados` VALUES ('5', '5', '2', '10', '1231231');

-- ----------------------------
-- Table structure for categoria_licencias
-- ----------------------------
DROP TABLE IF EXISTS `categoria_licencias`;
CREATE TABLE `categoria_licencias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_vehiculo` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `fk_tipo_vehiculo_categoria` (`id_tipo_vehiculo`),
  CONSTRAINT `fk_tipo_vehiculo_categoria` FOREIGN KEY (`id_tipo_vehiculo`) REFERENCES `tipos_vehiculos` (`id_tipo_vehiculos`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of categoria_licencias
-- ----------------------------
INSERT INTO `categoria_licencias` VALUES ('1', '7', 'C2 Público');
INSERT INTO `categoria_licencias` VALUES ('2', '7', 'B2 Particular');
INSERT INTO `categoria_licencias` VALUES ('3', '8', 'B1 Particular');
INSERT INTO `categoria_licencias` VALUES ('4', '9', 'B3 Particular');
INSERT INTO `categoria_licencias` VALUES ('5', '8', 'C1 Público');
INSERT INTO `categoria_licencias` VALUES ('6', '9', 'C3 Público');
INSERT INTO `categoria_licencias` VALUES ('7', '3', 'A1 Hasta 125 c.c');
INSERT INTO `categoria_licencias` VALUES ('8', '3', 'A2 Mayor a 125 c.c');

-- ----------------------------
-- Table structure for ciudades
-- ----------------------------
DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(33) NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  UNIQUE KEY `unique_ciudad` (`nombre_ciudad`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ciudades
-- ----------------------------
INSERT INTO `ciudades` VALUES ('1', 'Bogotá');
INSERT INTO `ciudades` VALUES ('4', 'Bucaramanga');
INSERT INTO `ciudades` VALUES ('2', 'Calí');
INSERT INTO `ciudades` VALUES ('3', 'Medellín');

-- ----------------------------
-- Table structure for combustible
-- ----------------------------
DROP TABLE IF EXISTS `combustible`;
CREATE TABLE `combustible` (
  `id_tipo_combustible` tinyint(1) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_combustible` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_combustible`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of combustible
-- ----------------------------
INSERT INTO `combustible` VALUES ('1', 'Gasolina');
INSERT INTO `combustible` VALUES ('2', 'Diesel');
INSERT INTO `combustible` VALUES ('3', 'Gas natural');
INSERT INTO `combustible` VALUES ('4', 'Eléctrico');

-- ----------------------------
-- Table structure for componentes
-- ----------------------------
DROP TABLE IF EXISTS `componentes`;
CREATE TABLE `componentes` (
  `id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria_componente_componente` int(11) NOT NULL,
  `nombre_componente` varchar(50) NOT NULL,
  `vida_util` int(11) NOT NULL,
  PRIMARY KEY (`id_componente`),
  UNIQUE KEY `unique_nombre_componente` (`nombre_componente`),
  KEY `fk_categoria_componente` (`id_categoria_componente_componente`),
  CONSTRAINT `fk_categoria_componente` FOREIGN KEY (`id_categoria_componente_componente`) REFERENCES `sistemas_vehiculos` (`id_categoria_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of componentes
-- ----------------------------
INSERT INTO `componentes` VALUES ('34', '9', 'Neumáticos Radiales', '2');
INSERT INTO `componentes` VALUES ('35', '9', 'Mecanismos de soporte', '4');
INSERT INTO `componentes` VALUES ('36', '9', 'Amortiguadores', '5');
INSERT INTO `componentes` VALUES ('37', '9', 'Barras estabilizadoras', '3');
INSERT INTO `componentes` VALUES ('38', '9', 'Asientos de conductor y pasajeros', '8');
INSERT INTO `componentes` VALUES ('39', '9', 'Neumáticos Diagonales', '9');
INSERT INTO `componentes` VALUES ('40', '9', 'Bolsas de aire', '2');
INSERT INTO `componentes` VALUES ('41', '9', 'Resortes espirales', '3');
INSERT INTO `componentes` VALUES ('42', '9', 'Resortes elásticos', '3');
INSERT INTO `componentes` VALUES ('43', '10', 'Bomba hidráulica', '5');
INSERT INTO `componentes` VALUES ('44', '10', 'Deposito', '4');
INSERT INTO `componentes` VALUES ('45', '10', 'Cremallera', '5');
INSERT INTO `componentes` VALUES ('46', '10', 'Guardapolvo', '8');
INSERT INTO `componentes` VALUES ('47', '10', 'Válvula distribuidora rotativa', '9');
INSERT INTO `componentes` VALUES ('48', '10', 'Rotula de dirección', '10');
INSERT INTO `componentes` VALUES ('49', '10', 'Bieleta de mando', '10');
INSERT INTO `componentes` VALUES ('50', '11', 'Freno de servicio', '3');
INSERT INTO `componentes` VALUES ('51', '11', 'Freno de estacionamiento', '3');
INSERT INTO `componentes` VALUES ('52', '11', 'Freno de tambor', '3');
INSERT INTO `componentes` VALUES ('53', '11', 'Freno de disco', '3');
INSERT INTO `componentes` VALUES ('54', '12', 'Motor', '3');
INSERT INTO `componentes` VALUES ('55', '12', 'Carburador', '3');
INSERT INTO `componentes` VALUES ('56', '12', 'Inyector', '5');
INSERT INTO `componentes` VALUES ('57', '8', 'Bateria', '2');
INSERT INTO `componentes` VALUES ('58', '8', 'Alternador', '3');
INSERT INTO `componentes` VALUES ('59', '8', 'Motor de arranque', '2');
INSERT INTO `componentes` VALUES ('61', '13', 'Paredes de cilindro y pistón', '5');
INSERT INTO `componentes` VALUES ('62', '13', 'Bancadas del cigüeñal', '6');
INSERT INTO `componentes` VALUES ('63', '13', 'Pies de biela', '4');
INSERT INTO `componentes` VALUES ('64', '13', 'Árbol de levas', '4');
INSERT INTO `componentes` VALUES ('65', '13', 'Eje de balancines', '4');
INSERT INTO `componentes` VALUES ('66', '13', 'Engranajes de la distribución', '3');
INSERT INTO `componentes` VALUES ('67', '14', 'Radiador', '10');
INSERT INTO `componentes` VALUES ('68', '14', 'Válvula control de temperatura', '3');
INSERT INTO `componentes` VALUES ('69', '14', 'Bomba de agua', '5');

-- ----------------------------
-- Table structure for componentes_vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `componentes_vehiculos`;
CREATE TABLE `componentes_vehiculos` (
  `id_componente_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `id_vehiculo` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `id_estado_componente` int(11) NOT NULL,
  `ultima_fecha_cambio` date NOT NULL,
  PRIMARY KEY (`id_componente_vehiculo`),
  KEY `id_componente` (`id_componente`),
  KEY `fk_vehiculo_componente` (`id_vehiculo`),
  KEY `fk_estado_componente` (`id_estado_componente`),
  CONSTRAINT `fk_componente_vehiculo` FOREIGN KEY (`id_componente`) REFERENCES `componentes` (`id_componente`),
  CONSTRAINT `fk_estado_componente` FOREIGN KEY (`id_estado_componente`) REFERENCES `estados_componentes` (`id_estado_componente`),
  CONSTRAINT `fk_vehiculo_componente` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of componentes_vehiculos
-- ----------------------------
INSERT INTO `componentes_vehiculos` VALUES ('1', '5', '34', '2', '2016-07-21');
INSERT INTO `componentes_vehiculos` VALUES ('2', '5', '35', '2', '2016-12-22');
INSERT INTO `componentes_vehiculos` VALUES ('3', '5', '38', '4', '2009-01-13');
INSERT INTO `componentes_vehiculos` VALUES ('4', '3', '39', '1', '2017-01-18');
INSERT INTO `componentes_vehiculos` VALUES ('5', '6', '40', '4', '2016-12-15');
INSERT INTO `componentes_vehiculos` VALUES ('7', '6', '57', '4', '2016-12-23');
INSERT INTO `componentes_vehiculos` VALUES ('8', '6', '53', '4', '2016-12-15');
INSERT INTO `componentes_vehiculos` VALUES ('9', '6', '46', '2', '2016-12-14');
INSERT INTO `componentes_vehiculos` VALUES ('10', '6', '55', '3', '2016-12-17');

-- ----------------------------
-- Table structure for conductores
-- ----------------------------
DROP TABLE IF EXISTS `conductores`;
CREATE TABLE `conductores` (
  `id_usuario_conductor` int(11) NOT NULL,
  `id_categoria_licencia` int(11) NOT NULL,
  `numero_licencia` varchar(33) NOT NULL,
  `fecha_venicimiento_licencia` date NOT NULL,
  PRIMARY KEY (`id_usuario_conductor`),
  KEY `fk_categoria_licencia` (`id_categoria_licencia`),
  CONSTRAINT `fk_categoria_licencia` FOREIGN KEY (`id_categoria_licencia`) REFERENCES `categoria_licencias` (`id_categoria`),
  CONSTRAINT `fk_usuario_conductor` FOREIGN KEY (`id_usuario_conductor`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of conductores
-- ----------------------------
INSERT INTO `conductores` VALUES ('12', '1', '86129817319', '2019-07-17');

-- ----------------------------
-- Table structure for conductores_vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `conductores_vehiculos`;
CREATE TABLE `conductores_vehiculos` (
  `id_conductor` int(11) NOT NULL,
  `id_vehiculo_conductor` int(11) NOT NULL,
  KEY `fk_conductor_vehiculo` (`id_conductor`),
  KEY `fk_vehiculo_conductor` (`id_vehiculo_conductor`),
  CONSTRAINT `fk_conductor_vehiculo` FOREIGN KEY (`id_conductor`) REFERENCES `conductores` (`id_usuario_conductor`),
  CONSTRAINT `fk_vehiculo_conductor` FOREIGN KEY (`id_vehiculo_conductor`) REFERENCES `vehiculos` (`id_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of conductores_vehiculos
-- ----------------------------
INSERT INTO `conductores_vehiculos` VALUES ('12', '5');

-- ----------------------------
-- Table structure for documentos_vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `documentos_vehiculos`;
CREATE TABLE `documentos_vehiculos` (
  `id_documento_vehiculo` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `id_estado_documento` int(11) NOT NULL,
  `nombre_documento` varchar(50) NOT NULL,
  `fecha_adquisicion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `documento_adjunto` mediumblob NOT NULL,
  PRIMARY KEY (`id_documento_vehiculo`),
  KEY `fk_documento_vehiculo` (`id_vehiculo`),
  KEY `fk_tipo_documento_documento` (`id_tipo_documento`),
  KEY `fk_estado_docuemnto_docuemnto` (`id_estado_documento`),
  CONSTRAINT `fk_documento_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  CONSTRAINT `fk_estado_docuemnto_docuemnto` FOREIGN KEY (`id_estado_documento`) REFERENCES `estados_documentos` (`id_estados_documentos`),
  CONSTRAINT `fk_tipo_documento_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipos_documentos` (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of documentos_vehiculos
-- ----------------------------

-- ----------------------------
-- Table structure for estados_componentes
-- ----------------------------
DROP TABLE IF EXISTS `estados_componentes`;
CREATE TABLE `estados_componentes` (
  `id_estado_componente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_componente` varchar(40) NOT NULL,
  PRIMARY KEY (`id_estado_componente`),
  UNIQUE KEY `unique_nombre_estado_componenete` (`nombre_estado_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of estados_componentes
-- ----------------------------
INSERT INTO `estados_componentes` VALUES ('3', 'En desgaste');
INSERT INTO `estados_componentes` VALUES ('2', 'En uso');
INSERT INTO `estados_componentes` VALUES ('1', 'Nuevo');
INSERT INTO `estados_componentes` VALUES ('4', 'Por cambiar');

-- ----------------------------
-- Table structure for estados_documentos
-- ----------------------------
DROP TABLE IF EXISTS `estados_documentos`;
CREATE TABLE `estados_documentos` (
  `id_estados_documentos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_documento` varchar(40) NOT NULL,
  PRIMARY KEY (`id_estados_documentos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of estados_documentos
-- ----------------------------
INSERT INTO `estados_documentos` VALUES ('1', 'Vigente');
INSERT INTO `estados_documentos` VALUES ('2', 'En vencimiento');
INSERT INTO `estados_documentos` VALUES ('3', 'Vencido');

-- ----------------------------
-- Table structure for estados_ordenes
-- ----------------------------
DROP TABLE IF EXISTS `estados_ordenes`;
CREATE TABLE `estados_ordenes` (
  `id_estado_orden` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_orden` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of estados_ordenes
-- ----------------------------
INSERT INTO `estados_ordenes` VALUES ('5', 'Pendiente');
INSERT INTO `estados_ordenes` VALUES ('6', 'Activa');
INSERT INTO `estados_ordenes` VALUES ('7', 'Finalizada');
INSERT INTO `estados_ordenes` VALUES ('8', 'Cancelada');

-- ----------------------------
-- Table structure for estados_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `estados_usuarios`;
CREATE TABLE `estados_usuarios` (
  `id_estado_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_usuario` varchar(30) NOT NULL,
  `descripcion_estado_usuario` text NOT NULL,
  PRIMARY KEY (`id_estado_usuario`),
  UNIQUE KEY `unique_Estado` (`nombre_estado_usuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of estados_usuarios
-- ----------------------------
INSERT INTO `estados_usuarios` VALUES ('8', 'Activo', 'Podra interactuar y ingresar al sistema.');
INSERT INTO `estados_usuarios` VALUES ('9', 'Inactivo', 'No tiene permiso de ingreso y manipulación en el sistema.');

-- ----------------------------
-- Table structure for estados_vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `estados_vehiculos`;
CREATE TABLE `estados_vehiculos` (
  `id_estado_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_vehiuclo` varchar(40) NOT NULL,
  PRIMARY KEY (`id_estado_vehiculo`),
  UNIQUE KEY `unique_estado_vehiuclo` (`nombre_estado_vehiuclo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estados_vehiculos
-- ----------------------------
INSERT INTO `estados_vehiculos` VALUES ('4', 'Desgastado');
INSERT INTO `estados_vehiculos` VALUES ('1', 'Disponible');
INSERT INTO `estados_vehiculos` VALUES ('3', 'En mantenimiento');
INSERT INTO `estados_vehiculos` VALUES ('2', 'En revisión');
INSERT INTO `estados_vehiculos` VALUES ('6', 'Pendiente a Mantenimiento');
INSERT INTO `estados_vehiculos` VALUES ('5', 'Pendiente a revisón');

-- ----------------------------
-- Table structure for fallas_vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `fallas_vehiculos`;
CREATE TABLE `fallas_vehiculos` (
  `id_falla_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `id_conductor_falla` int(11) NOT NULL,
  `id_vehiculo_falla` int(11) NOT NULL,
  `id_tipo_falla` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id_falla_vehiculo`),
  KEY `fk_conductor_falla` (`id_conductor_falla`),
  KEY `fk_vehiculo_falla` (`id_vehiculo_falla`),
  KEY `fk_tipo_falla_falla` (`id_tipo_falla`),
  CONSTRAINT `fk_conductor_falla` FOREIGN KEY (`id_conductor_falla`) REFERENCES `conductores` (`id_usuario_conductor`),
  CONSTRAINT `fk_tipo_falla_falla` FOREIGN KEY (`id_tipo_falla`) REFERENCES `tipos_fallas` (`id_tipo_falla`),
  CONSTRAINT `fk_vehiculo_falla` FOREIGN KEY (`id_vehiculo_falla`) REFERENCES `vehiculos` (`id_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fallas_vehiculos
-- ----------------------------

-- ----------------------------
-- Table structure for listas_precios
-- ----------------------------
DROP TABLE IF EXISTS `listas_precios`;
CREATE TABLE `listas_precios` (
  `id_lista_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `precio` double(11,0) DEFAULT NULL,
  PRIMARY KEY (`id_lista_precio`),
  KEY `fk_proveedor_componente` (`id_proveedor`),
  KEY `fk_componente_proveedor` (`id_componente`),
  CONSTRAINT `fk_componente_proveedor` FOREIGN KEY (`id_componente`) REFERENCES `componentes` (`id_componente`),
  CONSTRAINT `fk_proveedor_componente` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_provedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of listas_precios
-- ----------------------------
INSERT INTO `listas_precios` VALUES ('1', '1', '38', '131231');
INSERT INTO `listas_precios` VALUES ('2', '1', '39', '12312');
INSERT INTO `listas_precios` VALUES ('3', '1', '40', '131231');
INSERT INTO `listas_precios` VALUES ('4', '1', '41', '1231231');
INSERT INTO `listas_precios` VALUES ('5', '2', '41', '1231231');
INSERT INTO `listas_precios` VALUES ('6', '1', '34', '250000');
INSERT INTO `listas_precios` VALUES ('7', '1', '35', '200000');

-- ----------------------------
-- Table structure for mantenimientos
-- ----------------------------
DROP TABLE IF EXISTS `mantenimientos`;
CREATE TABLE `mantenimientos` (
  `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_entrega_mantenimiento` date NOT NULL,
  `costo_mantenimiento` double NOT NULL,
  `descripcion_mantenimiento` text NOT NULL,
  `documento_adjunto` mediumblob,
  `factura` mediumblob NOT NULL,
  PRIMARY KEY (`id_mantenimiento`),
  CONSTRAINT `fk_orden_mantenimiento` FOREIGN KEY (`id_mantenimiento`) REFERENCES `ordenes` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mantenimientos
-- ----------------------------
INSERT INTO `mantenimientos` VALUES ('3', '2017-01-03', '312312', 'Se han echo cambios en la suspención', null, '');
INSERT INTO `mantenimientos` VALUES ('5', '2017-01-20', '3123121', 'Se reparo una falla grave en el carburador.', null, '');

-- ----------------------------
-- Table structure for motivos_ordenes
-- ----------------------------
DROP TABLE IF EXISTS `motivos_ordenes`;
CREATE TABLE `motivos_ordenes` (
  `id_motivo` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(33) NOT NULL,
  PRIMARY KEY (`id_motivo`),
  UNIQUE KEY `unique_motivo` (`motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of motivos_ordenes
-- ----------------------------
INSERT INTO `motivos_ordenes` VALUES ('6', 'Falla en sistema de dirección');
INSERT INTO `motivos_ordenes` VALUES ('1', 'Falla en sistema de inyección');
INSERT INTO `motivos_ordenes` VALUES ('4', 'Falla en sistema de lubircación');
INSERT INTO `motivos_ordenes` VALUES ('5', 'Falla en sistema de refrigeración');
INSERT INTO `motivos_ordenes` VALUES ('3', 'Falla en sistema de suspención');
INSERT INTO `motivos_ordenes` VALUES ('2', 'Falla en sistema eléctrico');
INSERT INTO `motivos_ordenes` VALUES ('8', 'Mantenimiento de emergencia');
INSERT INTO `motivos_ordenes` VALUES ('9', 'Mantenimiento programado');
INSERT INTO `motivos_ordenes` VALUES ('7', 'Revisión rutinaria');

-- ----------------------------
-- Table structure for ordenes
-- ----------------------------
DROP TABLE IF EXISTS `ordenes`;
CREATE TABLE `ordenes` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado_orden` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_tipo_orden` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_motivo` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `plazo_maximo` date NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `fk_estado_orden` (`id_estado_orden`),
  KEY `fk_tipo_orden_orden` (`id_tipo_orden`),
  KEY `fk_vehiculo_orden` (`id_vehiculo`),
  KEY `fk_motivo_orden` (`id_motivo`),
  KEY `fk_usuario_orden` (`id_usuario`),
  CONSTRAINT `fk_estado_orden` FOREIGN KEY (`id_estado_orden`) REFERENCES `estados_ordenes` (`id_estado_orden`),
  CONSTRAINT `fk_motivo_orden` FOREIGN KEY (`id_motivo`) REFERENCES `motivos_ordenes` (`id_motivo`),
  CONSTRAINT `fk_tipo_orden_orden` FOREIGN KEY (`id_tipo_orden`) REFERENCES `tipos_ordenes` (`id_tipo_orden`),
  CONSTRAINT `fk_usuario_orden` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_vehiculo_orden` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ordenes
-- ----------------------------
INSERT INTO `ordenes` VALUES ('2', '6', '2', '4', '14', '2', '2016-11-18', '2017-03-17');
INSERT INTO `ordenes` VALUES ('3', '5', '5', '3', '14', '3', '2016-12-22', '2017-02-03');
INSERT INTO `ordenes` VALUES ('4', '6', '3', '3', '14', '5', '2016-12-16', '2017-01-25');
INSERT INTO `ordenes` VALUES ('5', '6', '6', '3', '14', '8', '2016-12-15', '2017-03-21');
INSERT INTO `ordenes` VALUES ('6', '6', '7', '3', '14', '7', '2016-12-08', '2016-12-24');

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_permiso` varchar(100) DEFAULT NULL,
  `tipo` enum('S','I') DEFAULT 'I',
  `subitem` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `icono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`),
  KEY `fk_menu` (`subitem`) USING BTREE,
  CONSTRAINT `fk_submenu` FOREIGN KEY (`subitem`) REFERENCES `permisos` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO `permisos` VALUES ('1', 'Consultar componentes', 'I', null, '1', 'protegido/componentes/lista_componentes.xhtml', 'mpc-down');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id_provedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_ciudad` int(11) NOT NULL,
  `nombre_proveedor` varchar(30) NOT NULL,
  `telefono` varchar(33) NOT NULL,
  `direccion` text NOT NULL,
  PRIMARY KEY (`id_provedor`),
  UNIQUE KEY `unique_proveedor` (`nombre_proveedor`) USING BTREE,
  KEY `fk_ciudad_proveedor` (`id_ciudad`),
  CONSTRAINT `fk_ciudad_proveedor` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES ('1', '1', 'EGOSELLO S.A', '19871928', 'CR 78 K 19 C 75');
INSERT INTO `proveedores` VALUES ('2', '1', 'TECMIC SERVICIOS S.A', '1273918', 'CR 18 # 87 D 75');
INSERT INTO `proveedores` VALUES ('3', '1', 'Delphi Delco Electronics S.A', '12312311', 'TRANS 78 N 08 - 75 sur');

-- ----------------------------
-- Table structure for revisiones
-- ----------------------------
DROP TABLE IF EXISTS `revisiones`;
CREATE TABLE `revisiones` (
  `id_revision` int(11) NOT NULL AUTO_INCREMENT,
  `anomalia` text NOT NULL,
  `fecha_entrega` date NOT NULL,
  `documento_adjunto_revision` mediumblob,
  PRIMARY KEY (`id_revision`),
  CONSTRAINT `fk_orden_revision` FOREIGN KEY (`id_revision`) REFERENCES `ordenes` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of revisiones
-- ----------------------------
INSERT INTO `revisiones` VALUES ('2', 'Se encontro una flla electrica en la bateria se sugire hacer cambio.', '2016-12-23', null);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion_rol` text NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `unique_rol` (`nombre_rol`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('13', 'Gerente de área', 'Permite consultar reportes generados apartir de los componentes, proveedores y ordenes a vehículos.');
INSERT INTO `roles` VALUES ('14', 'Recursos humanos', 'Encargado de la administración a usuarios.');
INSERT INTO `roles` VALUES ('15', 'Jefe de mantenimiento', 'Encargado del los manteniminetos, revisiones, componentes de vehíuclo y vehículos en general.');
INSERT INTO `roles` VALUES ('16', 'Supervidor de vehículo', 'Asigna vehículo a conductor,Registra la documentación del vehiculo, consulta vehículos, componentes, lista de proveedores, precios de componentes, genera ordenes de revisión y mantenimiento.');
INSERT INTO `roles` VALUES ('17', 'Conductor', 'Reporta fallas a lo vehículos.');

-- ----------------------------
-- Table structure for roles_permisos
-- ----------------------------
DROP TABLE IF EXISTS `roles_permisos`;
CREATE TABLE `roles_permisos` (
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  KEY `fk_rol_permiso` (`id_rol`),
  KEY `fk_permiso_rol` (`id_permiso`),
  CONSTRAINT `fk_permiso_rol` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`),
  CONSTRAINT `fk_rol_permiso` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of roles_permisos
-- ----------------------------
INSERT INTO `roles_permisos` VALUES ('15', '1');

-- ----------------------------
-- Table structure for sistemas_vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `sistemas_vehiculos`;
CREATE TABLE `sistemas_vehiculos` (
  `id_categoria_componente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria_componente` varchar(60) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_categoria_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sistemas_vehiculos
-- ----------------------------
INSERT INTO `sistemas_vehiculos` VALUES ('8', 'Sistema eléctrico', 'Encargado de hacer partir el motor de arranque, dar energía al sistema de chispa y activar las luces, bocina, aire acondicionado y otros accesorios. Por ello, su importancia es fundamental y necesaria para un buen desempeño. En ese sentido, la prevención y diagnóstico de fallos es vital.');
INSERT INTO `sistemas_vehiculos` VALUES ('9', 'Sistema de suspensión', 'Un sistema de suspensión en buen estado aumenta la adherencia y disminuye la distancia de frenado.');
INSERT INTO `sistemas_vehiculos` VALUES ('10', 'Sistema de dirección', 'La dirección es el conjunto de mecanismos, mediante los cuales pueden orientarse las ruedas directrices de un vehículo a voluntad del conductor.');
INSERT INTO `sistemas_vehiculos` VALUES ('11', 'Sistema de frenos', 'Su principal función es la de disminuir progresivamente la velocidad del vehículo, o mantenerlo inmovilizado cuando está detenido.');
INSERT INTO `sistemas_vehiculos` VALUES ('12', 'Sistema de inyección', 'Es el encargado de dosificar y dar presión al combustible para que llegue a los cilindros.');
INSERT INTO `sistemas_vehiculos` VALUES ('13', 'Sistema de lubricación', 'Su función principal es evitarel desgaste de los elementos del motor debido a su continuo rozamiento');
INSERT INTO `sistemas_vehiculos` VALUES ('14', 'Sistema de refrigeración', 'Cumple la función de eliminar el calor generado en el motor y por otro lado mantenerlo a la temperatura ideal para que los lubricantes no pierdan sus características.');

-- ----------------------------
-- Table structure for tipos_documentos
-- ----------------------------
DROP TABLE IF EXISTS `tipos_documentos`;
CREATE TABLE `tipos_documentos` (
  `id_tipo_documento` int(11) NOT NULL,
  `nombre_tipo_documento` varchar(50) NOT NULL,
  `descripcion_tipo_documento` text NOT NULL,
  PRIMARY KEY (`id_tipo_documento`),
  UNIQUE KEY `unique_documento` (`nombre_tipo_documento`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tipos_documentos
-- ----------------------------

-- ----------------------------
-- Table structure for tipos_fallas
-- ----------------------------
DROP TABLE IF EXISTS `tipos_fallas`;
CREATE TABLE `tipos_fallas` (
  `id_tipo_falla` int(11) NOT NULL,
  `nombre_tipo_falla` varchar(33) NOT NULL,
  `descripcion_text` text NOT NULL,
  PRIMARY KEY (`id_tipo_falla`),
  UNIQUE KEY `unique_fall` (`nombre_tipo_falla`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tipos_fallas
-- ----------------------------

-- ----------------------------
-- Table structure for tipos_ordenes
-- ----------------------------
DROP TABLE IF EXISTS `tipos_ordenes`;
CREATE TABLE `tipos_ordenes` (
  `id_tipo_orden` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_orden` varchar(40) NOT NULL,
  PRIMARY KEY (`id_tipo_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tipos_ordenes
-- ----------------------------
INSERT INTO `tipos_ordenes` VALUES ('3', 'Mantenimiento');
INSERT INTO `tipos_ordenes` VALUES ('4', 'Revisión');

-- ----------------------------
-- Table structure for tipos_vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `tipos_vehiculos`;
CREATE TABLE `tipos_vehiculos` (
  `id_tipo_vehiculos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_vehiculo` varchar(33) NOT NULL,
  PRIMARY KEY (`id_tipo_vehiculos`),
  UNIQUE KEY `unique_tipo_vehiculo` (`nombre_tipo_vehiculo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tipos_vehiculos
-- ----------------------------
INSERT INTO `tipos_vehiculos` VALUES ('8', 'Automóvil');
INSERT INTO `tipos_vehiculos` VALUES ('7', 'Camion');
INSERT INTO `tipos_vehiculos` VALUES ('10', 'Generico');
INSERT INTO `tipos_vehiculos` VALUES ('3', 'Motocicleta');
INSERT INTO `tipos_vehiculos` VALUES ('9', 'Vehículo articulado');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_ciudad` int(11) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `id_estado_usuario` int(11) NOT NULL,
  `numero_cedula` varchar(30) NOT NULL,
  `clave` varchar(180) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  `foto_perfil` mediumblob,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `unique_cedula` (`numero_cedula`) USING BTREE,
  UNIQUE KEY `unique_correo` (`correo_electronico`) USING BTREE,
  KEY `fk_ciudad_usuario` (`id_ciudad`),
  KEY `fk_rol_ciudad` (`id_rol`),
  KEY `fk_estado_usuario` (`id_estado_usuario`),
  CONSTRAINT `fk_ciudad_usuario` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`),
  CONSTRAINT `fk_estado_usuario` FOREIGN KEY (`id_estado_usuario`) REFERENCES `estados_usuarios` (`id_estado_usuario`),
  CONSTRAINT `fk_rol_ciudad` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('12', '1', '17', '8', '1012422434', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Pablo Andres', 'Ramirez Diaz', '5754085', '1995-06-06', 'paramirez434@misena.edu.co', null);
INSERT INTO `usuarios` VALUES ('13', '1', '14', '8', '1081261687', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Alverto', 'Rodrigez Amador', '7918291', '1994-11-16', 'alvertoro1289@gmail.com', null);
INSERT INTO `usuarios` VALUES ('14', '1', '16', '8', '1012397898', '1234', 'Sofia', 'Aranda Ramirez', '1830910', '1990-06-20', 'sofia12@gmail.com', null);
INSERT INTO `usuarios` VALUES ('15', '1', '15', '8', '1091273918', '1234', 'Fabia Andres', 'Alvarada Diaz', '1231299', '1995-12-10', 'fabia@bdkq.com', null);

-- ----------------------------
-- Table structure for vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE `vehiculos` (
  `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_vehiculo` int(11) NOT NULL,
  `id_estado_vehiculo` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `combustible` tinyint(1) NOT NULL,
  `matricula` varchar(7) NOT NULL,
  `numero_chasis` varchar(30) NOT NULL,
  `cilindraje` varchar(10) NOT NULL,
  `tonelaje_max` int(11) NOT NULL,
  `kilometraje` int(11) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `color` varchar(10) NOT NULL,
  `foto_vehiculo` mediumblob,
  PRIMARY KEY (`id_vehiculo`),
  UNIQUE KEY `unique_maticula` (`matricula`),
  UNIQUE KEY `unique_n_chasis` (`numero_chasis`),
  KEY `fk_tipo_vehiculo_vehiculo` (`id_tipo_vehiculo`),
  KEY `fk_ciudad_vehiculo` (`id_ciudad`),
  KEY `fk_estado_vehiculo` (`id_estado_vehiculo`),
  KEY `fk_combustible` (`combustible`),
  CONSTRAINT `fk_ciudad_vehiculo` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`),
  CONSTRAINT `fk_combustible` FOREIGN KEY (`combustible`) REFERENCES `combustible` (`id_tipo_combustible`),
  CONSTRAINT `fk_estado_vehiculo` FOREIGN KEY (`id_estado_vehiculo`) REFERENCES `estados_vehiculos` (`id_estado_vehiculo`),
  CONSTRAINT `fk_tipo_vehiculo_vehiculo` FOREIGN KEY (`id_tipo_vehiculo`) REFERENCES `tipos_vehiculos` (`id_tipo_vehiculos`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vehiculos
-- ----------------------------
INSERT INTO `vehiculos` VALUES ('2', '7', '2', '1', '1', 'CTF-891', 'DQWBKDQWJB1KJ23UI', '1500 c', '2', '18791', '2015', 'Ford', 'negro', null);
INSERT INTO `vehiculos` VALUES ('3', '7', '3', '2', '1', 'DTF-987', 'QDBKWDQB18923918QN', '1000 c.c', '3', '1231231', '2012', 'Mazda', 'negro', null);
INSERT INTO `vehiculos` VALUES ('4', '7', '1', '2', '2', 'UHY-123', 'DQNWKBDQNWJ19281987', '1000 CC', '4', '1231231', '2011', 'Chevrolet', 'Blanco', null);
INSERT INTO `vehiculos` VALUES ('5', '8', '6', '1', '1', 'IUB-123', 'DMQLKWDNQW8912987198', '250 CC', '1', '13131231', '2010', 'Mazda', 'Blanco', null);
INSERT INTO `vehiculos` VALUES ('6', '7', '3', '1', '2', 'NDQ-123', 'DQWBDKQWB827918', '2200', '5', '213123123', '2009', 'Ford', 'Azul', null);
INSERT INTO `vehiculos` VALUES ('7', '8', '2', '2', '1', 'UBD-123', 'DKQWBDKJQWNDK', '2000', '3', '12312311', '2015', 'Ford', 'Negro', null);

-- ----------------------------
-- Procedure structure for sumarDiasPlazoMaximo
-- ----------------------------
DROP PROCEDURE IF EXISTS `sumarDiasPlazoMaximo`;
DELIMITER ;;
CREATE DEFINER=`mpc`@`localhost` PROCEDURE `sumarDiasPlazoMaximo`(IN dias INT(11),IN ciudad INT(11))
BEGIN
		UPDATE ordenes SET ordenes.plazo_maximo = DATE_ADD(ordenes.plazo_maximo, INTERVAL dias DAY)
		WHERE id_vehiculo IN (SELECT vehiculos.id_vehiculo FROM vehiculos WHERE vehiculos.id_ciudad = ciudad);
		
		SELECT * FROM ordenes 
		WHERE id_vehiculo IN (SELECT vehiculos.id_vehiculo FROM vehiculos WHERE vehiculos.id_ciudad = ciudad);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sumarSemana
-- ----------------------------
DROP PROCEDURE IF EXISTS `sumarSemana`;
DELIMITER ;;

;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
