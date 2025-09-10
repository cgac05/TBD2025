-- PRACTICA 4 UNIDAD 1 
-- Autor: Avila Camberos Christian Guillermo
-- Fecha: 8/09/25
/* 
	Descripción: Base de datos que almacenará los datos de una guardería
llamada “Pequeñ Mundo”
*/

-- 1. CREAR EL CONTENEDOR PRINCIPAL
-- Crear la base de datos
CREATE DATABASE guarderiaPequeñoMundo
ON PRIMARY (
	NAME = 'PequeñoMundo_data',
	FILENAME='C:\TBD2025\PequenoMundo.mdf',
	MAXSIZE = UNLIMITED
)
LOG ON (
	NAME = 'PequeñoMundo_log',
	FILENAME='C:\TBD2025\PequenoMundo.ldf',
	MAXSIZE = UNLIMITED
);

-- 2. PONER EN USO LA BASE DE DATOS
USE guarderiaPequeñoMundo;

-- 3. VERIFICAR COMO FUE CREADO
EXECUTE sp_helpdb guarderiaPequeñoMundo;

-- 4. CREAR LAS TABLAS DE LA BASE DE DATOS
-- 4.1. CREAR TABLA	Canciones
CREATE TABLE Sala(
	sal_id CHAR(3) NOT NULL,
	sal_nombre VARCHAR(25),
	enc_id INT -- FK Artista

	--constraint PK_SALA primary key (sal_id,sal_caracter)
);

CREATE TABLE Encargado(
	enc_id INT NOT NULL IDENTITY(1,1),
	enc_puesto VARCHAR(15),
	enc_nombre VARCHAR(30),
	enc_direccion VARCHAR(50),
	enc_tel VARCHAR(20),
	enc_fechaing DATE
);

CREATE TABLE Alumno(
	alu_id INT NOT NULL,
	alu_nombre VARCHAR(100),
	alu_edad INT,
	alu_fechaingreso DATE,
	alu_tutor VARCHAR(100),
	sal_id CHAR(3)
);

CREATE TABLE Reporte(
	rep_id INT NOT NULL IDENTITY(1,1),
	rep_hora VARCHAR(5),
	rep_fecha DATE,
	enc_id INT,
	alu_id INT,
	rep_observaciones VARCHAR(200)
);

CREATE TABLE Entrada_Salida(
	reg_id INT NOT NULL IDENTITY(1,1),
	reg_hora TIME,
	reg_fecha DATE,
	reg_tipo CHAR(1),
	alu_id INT,
);