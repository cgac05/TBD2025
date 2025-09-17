-- PRACTICA 2 
/*
	Unidad: 1
	Autor: Christian Guillermo Avila Camberos
	Fecha: 02/09/2025
	Descripción: Base de datos de gestion de un restaurante
*/
CREATE DATABASE PANAMA 
ON PRIMARY(
	NAME = 'PANAMA_DATA',
	FILENAME = 'C:\TBD2025\PANAMA.mdf',
	MAXSIZE = UNLIMITED
)
LOG ON(
	NAME = 'PANAMA_LOG',
	FILENAME = 'C:\TBD2025\PANAMA.ldf',
	MAXSIZE = UNLIMITED
)go

-- 2. Poner en uso la BD
USE PANAMA
go

-- 3. Verificar como fue creada
-- EXECUTE o 
EXECUTE sp_helpdb PANAMA
GO

-- 4. Crear tablas
-- 4.1 Crear tabla ciudades
CREATE TABLE CIUDAD (
	idCiudad		int not null identity(1,1),
	nombreCiudad	varchar (100)
);
-- 4.2 Crear tabla cliente
CREATE TABLE CLIENTE(
	idCliente		int not null identity (10,1),
	nombreCliente	varchar (100),
	fechaNacimiento	date,
	idCiudad		int, -- FK
	telefono		varchar (15) not null,
	email			varchar (100)
);
-- 4.3 Crear tabla tipo restaurante
CREATE TABLE TIPO_RESTAURANT(
	idTipo			char(4) not null,
	modelo			varchar(30),
	descripcion		varchar(400),
	mesas			tinyint
);
-- 4.4 Crear tabla restaurant
CREATE TABLE RESTAURANT (
	idRestaurant		int not null identity (1,1),
	idTipo				char(4), --FK
	IdCiudad			int,
	nombreRestaurant	varchar(100)
);
-- 4.5 Crear tabla reservas
CREATE TABLE RESERVACION(
	idReserva			INT NOT NULL IDENTITY(1,1),
	idCliente			INT, -- Llave foranea
	idRestaurant		INT, -- Llave foranea
	mesa				TINYINT,
	clase				VARCHAR(20),
	fecha				DATE,
	hora				TIME,
	numeroComensales 	TINYINT
);
-- 4.6 Crear tabla cobro
CREATE TABLE COBRO (
	idCobro			int not null identity (1,1),
	idReserva		int, --FK Reservacion
	subtotal		money,
	descuento		money,
	impuesto		money,
	total			money,
	fecha			datetime,
	cajero			varchar (10)
);

-- 5. Verificar la tabla cliente
EXEC sp_help cliente ;

-- 6. eliminar una tabla
-- 6.1 Crear una tabla datos
create table datos (
	id int identity (1,1),
	nombre varchar (100)
);
-- 6.2 eliminar la tabla 
drop table datos;

-- 7. Crear las PK a todas las tablas
alter table ciudad 
add constraint PK_Ciudad
primary key (idCiudad)
go

alter table cliente
add constraint PK_Cliente
primary key (idCliente)
go

alter table TIPO_RESTAURANT 
add constraint PK_Tipo_Restaurant
primary key (idTipo)
go

alter table restaurant
add constraint PK_Restaurant
primary key (idRestaurant);

alter table reservacion
add constraint PK_Reservacion
primary key (idReserva);

alter table cobro 
add primary key (idCobro);

-- 8. Eliminar un constraint PK 
alter table cliente 
drop constraint PK_Cliente;

-- 9. Volver a crear
alter table cliente
add constraint PK_Cliente
primary key (idCliente)
go

-- 10. Borrar PK Cobro
alter table cobro
drop constraint PK_Cobro;

-- 11. Crear de nuevo
alter table cobro
add constraint PK_Cobro
primary key (idCobro);

-- 12. Crear FK
alter table restaurant
drop constraint fk_restaurant_tipores;

alter table restaurant add constraint fk_restaurant_tipores
foreign key (idTipo) references tipo_restaurant(idTipo);

alter table restaurant add constraint fk_restaurant_ciudad
foreign key (idCiudad) references ciudad (idCiudad);

alter table reservacion add constraint fk_reserva_cliente
foreign key (idCliente) references cliente (idCliente);

alter table reservacion add constraint fk_reserva_restaurant
foreign key (idRestaurant) references Restaurant(idRestaurant);

alter table cobro add constraint fk_cobre_reserva
foreign key (idReserva) references reservacion (idReserva);

-- correcciòn de errores creacion de diagrama de base de datos
drop table Articulo;
drop table DetalleVenta;
drop table Usuario;
drop table Ventas;