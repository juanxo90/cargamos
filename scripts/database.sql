DROP USER IF EXISTS 'cargamos'@'localhost';
CREATE USER 'cargamos'@'localhost' IDENTIFIED BY 'carga1234';

DROP SCHEMA IF EXISTS RET_db;
CREATE SCHEMA RET_db CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
GRANT SELECT, INSERT, UPDATE, DELETE, DROP, CREATE ON RET_db.* TO 'cargamos'@'localhost';

# se cargan algunas configuraciones
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE RET_db;
DROP TABLE IF EXISTS register_detail;
CREATE TABLE register_detail (
  id_paquete varchar(130) NOT NULL,
  id_monitoreo varchar(130) NULL,
  arreglo_estado varchar(24) NOT NULL,
  complemento_estado varchar(24) NOT NULL,
  fecha_creado timestamp NOT NULL, 
  PRIMARY KEY (id_paquete)
);

DROP TABLE IF EXISTS paquete_detail;
CREATE TABLE paquete_detail (
  id_paquete varchar(130) NOT NULL,
  cedis varchar(130) NULL,
  estado varchar(24) NOT NULL,
  hora_recolectado timestamp NOT NULL,
  hora_creacion timestamp NOT NULL,
  hora_entrega timestamp NOT NULL,
  hora_falla timestamp NOT NULL
  );

