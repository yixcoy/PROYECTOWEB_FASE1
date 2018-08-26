-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: profinalweb
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cod_cliente` varchar(30) NOT NULL,
  `nom_cliente` varchar(40) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `NIT` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `cod_compra` varchar(30) NOT NULL,
  `No_factura_compra` varchar(45) DEFAULT NULL,
  `cod_pro2` varchar(30) DEFAULT NULL,
  `nom_prod` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `valor_uni` decimal(10,0) DEFAULT NULL,
  `iva_cobrar` decimal(10,0) DEFAULT NULL,
  `total_compra` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cod_compra`),
  KEY `COMPRAS_PRODUCTO_idx` (`cod_pro2`),
  CONSTRAINT `COMPRAS_PRODUCTO` FOREIGN KEY (`cod_pro2`) REFERENCES `producto` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entradas` (
  `No_entrada` int(11) NOT NULL,
  `cod_compra1` varchar(30) NOT NULL,
  `No_factura_compra` int(11) NOT NULL,
  `fecha_fac` datetime NOT NULL,
  `cod_pro1` varchar(30) NOT NULL,
  `nom_pro` varchar(30) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`No_entrada`),
  KEY `ENTRADAS_COMPRAS_idx` (`cod_compra1`),
  CONSTRAINT `ENTRADAS_COMPRAS` FOREIGN KEY (`cod_compra1`) REFERENCES `compras` (`cod_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `No_factura` int(11) NOT NULL,
  `Fecha_fac` datetime NOT NULL,
  `cod_cliente1` varchar(45) NOT NULL,
  `nom_cliente` varchar(40) NOT NULL,
  `cod_pro3` varchar(30) NOT NULL,
  `nom_pro` varchar(45) NOT NULL,
  `precio_uni` decimal(10,0) NOT NULL,
  `cant` int(11) NOT NULL,
  `total` varchar(45) NOT NULL,
  `iva` decimal(10,0) NOT NULL,
  `pago_total` varchar(45) NOT NULL,
  PRIMARY KEY (`No_factura`),
  KEY `CLIENTE_COMPRA_idx` (`cod_cliente1`),
  KEY `FACTURA_PRODUCTO_idx` (`cod_pro3`),
  CONSTRAINT `CLIENTE_COMPRA` FOREIGN KEY (`cod_cliente1`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FACTURA_PRODUCTO` FOREIGN KEY (`cod_pro3`) REFERENCES `producto` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_inventario`
--

DROP TABLE IF EXISTS `gestion_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_inventario` (
  `cod_pro4` varchar(30) NOT NULL,
  `nom_prod` varchar(45) NOT NULL,
  `precio_uni` decimal(10,0) NOT NULL,
  `cod_sald_inicial1` int(11) DEFAULT NULL,
  `existencias_ini` varchar(45) NOT NULL,
  `No_entrada1` int(11) DEFAULT NULL,
  `No_salida1` int(11) DEFAULT NULL,
  `cant_entradas` int(11) NOT NULL,
  `cant_salidas` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  KEY `SALDO_INICIAL_INVENTARIO_idx` (`cod_sald_inicial1`),
  KEY `ENTRADA_INVENTARIO_idx` (`No_entrada1`),
  KEY `SALIDA_INVENTARIO_idx` (`No_salida1`),
  KEY `INVETARIO_PRODUCTOS` (`cod_pro4`),
  CONSTRAINT `ENTRADA_INVENTARIO` FOREIGN KEY (`No_entrada1`) REFERENCES `entradas` (`No_entrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `INVETARIO_PRODUCTOS` FOREIGN KEY (`cod_pro4`) REFERENCES `producto` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SALDO_INICIAL_INVENTARIO` FOREIGN KEY (`cod_sald_inicial1`) REFERENCES `saldos_inicales` (`cod_sald_inicial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SALIDA_INVENTARIO` FOREIGN KEY (`No_salida1`) REFERENCES `salidas` (`No_salida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_inventario`
--

LOCK TABLES `gestion_inventario` WRITE;
/*!40000 ALTER TABLE `gestion_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `cod_pro` varchar(30) NOT NULL,
  `nom_prod` varchar(30) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saldos_inicales`
--

DROP TABLE IF EXISTS `saldos_inicales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saldos_inicales` (
  `cod_sald_inicial` int(11) NOT NULL,
  `cod_prod3` varchar(30) NOT NULL,
  `nom_prod` varchar(40) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `cant_agregar` int(11) NOT NULL,
  `valor_unitario` decimal(10,0) NOT NULL,
  `valor_total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`cod_sald_inicial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldos_inicales`
--

LOCK TABLES `saldos_inicales` WRITE;
/*!40000 ALTER TABLE `saldos_inicales` DISABLE KEYS */;
/*!40000 ALTER TABLE `saldos_inicales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidas`
--

DROP TABLE IF EXISTS `salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salidas` (
  `No_salida` int(11) NOT NULL,
  `No_factura1` int(11) NOT NULL,
  `Fecha_fac` varchar(45) NOT NULL,
  `cod_pro1` varchar(30) NOT NULL,
  `nom_prod` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`No_salida`),
  KEY `SALIDAS_FACTURA_idx` (`No_factura1`),
  KEY `salidas_producto_idx` (`cod_pro1`),
  CONSTRAINT `SALIDAS_FACTURA` FOREIGN KEY (`No_factura1`) REFERENCES `factura` (`No_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `salidas_producto` FOREIGN KEY (`cod_pro1`) REFERENCES `producto` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidas`
--

LOCK TABLES `salidas` WRITE;
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `cod_venta` decimal(10,0) NOT NULL,
  `No_factura1` int(11) DEFAULT NULL,
  `cod_cliente1` varchar(45) DEFAULT NULL,
  `cod_producto` varchar(30) DEFAULT NULL,
  `cant_uni` int(11) DEFAULT NULL,
  `iva_pagar` decimal(10,0) DEFAULT NULL,
  `total_venta` decimal(10,0) DEFAULT NULL,
  `nom_pro` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_venta`),
  KEY `VENTAS_FACTURA_idx` (`No_factura1`),
  KEY `VENTAS_CLIENTE_idx` (`cod_cliente1`),
  KEY `VENTAS_PRODUCTO_idx` (`cod_producto`),
  CONSTRAINT `VENTAS_CLIENTE` FOREIGN KEY (`cod_cliente1`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VENTAS_FACTURA` FOREIGN KEY (`No_factura1`) REFERENCES `factura` (`No_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VENTAS_PRODUCTO` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-25  3:45:52
