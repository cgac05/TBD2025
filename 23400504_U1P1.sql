
-- PRACTICA 1 UNIDAD 1 
-- Autor: Christian Guillermo Avila Camberos
-- Fecha: 1/09/25
/* 
	Descripción: Es la practica para realizar la primera base de datos
*/

-- 1. CREAR EL CONTENEDOR PRINCIPAL
-- Crear la base de datos
CREATE DATABASE Ventas
ON PRIMARY (
	NAME = 'Ventas_data',
	FILENAME='C:\TBD2025\Ventas.mdf',
	SIZE=12MB,
	MAXSIZE = UNLIMITED
)
LOG ON (
	NAME = 'Ventas_log',
	FILENAME='C:\TBD2025\Ventas.ldf',
	SIZE=12MB,
	MAXSIZE = UNLIMITED
)

-- 2. Crear tablas
-- Tabla Rol
CREATE TABLE Rol (
    idRol       INT NOT NULL,
    nombreRol   VARCHAR(50) NOT NULL,
);
GO

-- Tabla Usuario
CREATE TABLE Usuario (
    idUsuario       INT NOT NULL,
    nombre          VARCHAR(50) NOT NULL,
    email           VARCHAR(100) NOT NULL,
    telefono        VARCHAR(15),
    fechaNacimiento DATE,
    fechaRegistro   DATE NOT NULL,
    idRol           INT NOT NULL, 
);
GO

-- Tabla Articulo
CREATE TABLE Articulo (
    idArticulo      INT NOT NULL,
    nombreArticulo  VARCHAR(50) NOT NULL,
    estatus         BIT NOT NULL,
    imagenArticulo  VARCHAR(50),
    inventario      INT NOT NULL,
    precio          MONEY NOT NULL,
   
);
GO

-- Tabla Ventas
CREATE TABLE Ventas (
    idVenta     INT NOT NULL,
    idCliente   INT NOT NULL,   -- FK
    idVendedor  INT NOT NULL,  -- FK
    fechaVenta  DATE NOT NULL,
    impuesto    MONEY NOT NULL,
    total       MONEY NOT NULL,
    
);
GO

-- Tabla DetalleVenta
CREATE TABLE DetalleVenta (
    idDetalleVenta  INT NOT NULL,
    idArticulo      INT NOT NULL,  -- FK
    idVenta         INT NOT NULL,     -- FK
    cantidad        INT NOT NULL,
    precio          MONEY NOT NULL,
    descuento       MONEY NOT NULL,
    
);
GO

-- 3 Generar las PK
alter table rol
add constraint PK_Rol
primary key (idRol);

alter table usuario
add constraint PK_Usuario
primary key (idUsuario);

alter table articulo
add constraint PK_Articulo
primary key (idArticulo);

alter table ventas
add constraint PK_Ventas
primary key (idVenta);

alter table DetalleVenta
add constraint PK_DetalleVenta
primary key (idDetalleVenta);