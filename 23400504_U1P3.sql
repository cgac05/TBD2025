-- PRACTICA 3 UNIDAD 1 
-- Autor: Avila Camberos Christian Guillermo
-- Fecha: 4/09/25
/* 
	Descripción: Base de datos gestion spotify
*/

-- 1. CREAR EL CONTENEDOR PRINCIPAL
-- Crear la base de datos
DROP DATABASE BDSpotify;

CREATE DATABASE BDSpotify
ON PRIMARY (
	NAME = 'BDSpotify_data',
	FILENAME='C:\TBD2025\BDSpotify.mdf',
	MAXSIZE = UNLIMITED
)
LOG ON (
	NAME = 'BDSpotify_log',
	FILENAME='C:\TBD2025\BDSpotify.ldf',
	MAXSIZE = UNLIMITED
);

-- 2. PONER EN USO LA BASE DE DATOS
USE BDSpotify;

-- 3. VERIFICAR COMO FUE CREADO
EXECUTE sp_helpdb BDSpotify;

-- 4. CREAR LAS TABLAS DE LA BASE DE DATOS
-- 4.1. CREAR TABLA	Canciones
CREATE TABLE Usuarios(
	UsuarioID INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_usuario PRIMARY KEY,
	NombreUsuario VARCHAR(150),
	Correo VARCHAR(100),
	Contraseña VARCHAR(100),
	FechaRegistro DATE, 
	TipoCuenta INT -- FK Artista
	--CONSTRAINT PK_usuario PRIMARY KEY (UsuarioID)
);

CREATE TABLE Playlists(
	PlaylistID INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PlayList PRIMARY KEY,
	UsuarioID INT, -- Llave foranea Usuario
	NombrePlaylist VARCHAR(100),
	Descripcion VARCHAR(100),
	FechaCreacion DATETIME
	-- CONSTRAINT PK_PlayList PRIMARY KEY (PlaylistID)
);

CREATE TABLE PlaylistCanciones(
	PlaylistCancionID INT NOT NULL IDENTITY(1,1),
	PlaylistID INT, -- Llave foranea Usuario
	CancionID INT, -- Llave foranea Cancion
	FechaAgregado DATETIME
	CONSTRAINT PK_PlayListCanciones PRIMARY KEY (PlaylistCancionID)
);

CREATE TABLE Canciones(
	CancionID INT NOT NULL IDENTITY(1,1),
	Titulo VARCHAR(100),
	DuracionMinutos TIME,
	AlbumID INT, -- Llave foranea Album
	ArtistaID INT, -- Llave foranea Artista
	FechaLanzamiento DATETIME,
	Reproducciones BIGINT
	CONSTRAINT PK_Canciones PRIMARY KEY (CancionID)
);

CREATE TABLE Artistas(
	ArtistaID INT NOT NULL IDENTITY(1,1),
	NombreArtista VARCHAR(150),
	PaisOrigen VARCHAR(100),
	GeneroMusical VARCHAR(100),
	CONSTRAINT PK_Canciones PRIMARY KEY (ArtistaID)
);