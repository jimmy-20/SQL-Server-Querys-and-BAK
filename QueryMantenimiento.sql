CREATE DATABASE MantenimientoVehiculo
USE MantenimientoVehiculo

CREATE TABLE Cliente(
IdCliente int primary key not null,
PrimerNombre varchar(50),
SegundoNombre varchar(50),
PrimerApellido varchar(50),
SegundoApellido varchar(50)
)

DROP TABLE Cliente
DROP TABLE Vehiculo
DROP TABLE Mantenimiento

CREATE TABLE Vehiculo(
IdVehiculo int primary key not null,
IdCliente int foreign key references Cliente(IdCliente),
Marca varchar(20),
Modelo varchar(20),
Año DATE 
)

CREATE TABLE Mantenimiento(
IdMantenimiento int identity(1,1) primary key not null,
IdVehiculo int foreign key references Vehiculo(IdVehiculo),
FechaIngreso date,
FechaSalida date,
Estado varchar(15)
)

CREATE TABLE Servicio(
IdServicio int primary key not null,
Descripciom varchar(50),
Precio float,
TipoMantenimeinto varchar(15)
)

CREATE TABLE Mecanico(
IdMecanico int primary key not null,
PrimerNombre varchar(50),
PrimerApellido varchar(50)
)

CREATE TABLE Repuesto(
IdRepuesto int primary key not null,
Marca varchar (30) not null,
Model varchar (30),
Cantidad int
)

CREATE TABLE Detalle_Repuestos(
IdDetalleMantenimiento int,
IdRepuesto int,
Precio float,
Cantidad int
primary key(IdDetalleMantenimiento,IdRepuesto)
)

CREATE TABLE Detalle_Mantenimiento(
IdDetalleMantenimiento int identity(1,1) primary key not null,
IdMantenimiento int foreign key references Mantenimiento(IdMantenimiento),
IdMecanico int foreign key references Mecanico(IdMecanico),
IdServicio int foreign key references Servicio(IdServicio),
Precio float
)

--Insercion de registros

INSERT INTO Cliente VALUES('1','Jimmy','Alexander','Soza','Ortiz')
INSERT INTO Cliente VALUES('2','Massiel','Alejandra','Fonseca','Sandino')
INSERT INTO Cliente VALUES('3','Jeison','Jose','Suarez','Jimenez')
INSERT INTO Cliente VALUES('4','Patricia','Eugenia','Chana','')
INSERT INTO Cliente VALUES('5','Jairo','','Aburto','')

SELECT * FROM Cliente

INSERT INTO Vehiculo VALUES(1,1,'Yamaha','Rayzr','11/6/2010')
INSERT INTO Vehiculo VALUES(2,2,'Yamaha','Crypton','11/1/2010')
INSERT INTO Vehiculo VALUES(3,3,'Toyota','Agya','01/7/2015')
INSERT INTO Vehiculo VALUES(4,4,'Toyota','Yaris','05/3/2014')
INSERT INTO Vehiculo VALUES(5,5,'Suzuki','Celerio','03/3/2011')

SELECT * FROM Vehiculo

INSERT INTO Servicio VALUES(1,'Cambio de Bandas del Motor',80,'Extraordinario')
INSERT INTO Servicio VALUES(2,'Mantenimiento 10,000 km',1800,'Ordinario')
INSERT INTO Servicio VALUES(3,'Mantenimiento 5,000 km',1500,'Ordinario')
INSERT INTO Servicio VALUES(4,'Revision del Sistema Electronico',400,'Extraordinario')
INSERT INTO Servicio VALUES(5,'Reparación de aire acondicionado',2000,'Extraordinario')
INSERT INTO Servicio VALUES(6,'Mantenimiento 25,000 km',2100,'Ordinario')

SELECT * FROM Servicio

INSERT INTO Mecanico VALUES (1,'Fabiola','Ramirez')
INSERT INTO Mecanico VALUES (2, 'Maria,', 'Soza')
INSERT INTO Mecanico VALUES (3, 'Kevin','López')
SELECT * FROM Mecanico

INSERT INTO Repuesto VALUES (1,'','',5)
INSERT INTO Repuesto VALUES (2,'','',5)
INSERT INTO Repuesto VALUES (3,'','',5)
INSERT INTO Repuesto VALUES (4,'','',5)
INSERT INTO Repuesto VALUES (5,'','',5)

SELECT * FROM Repuesto

INSERT INTO Mantenimiento VALUES(1,'01/05/2020','03/05/2020','Finalizado')
INSERT INTO Mantenimiento VALUES(2,'05/05/2020','06/05/2020','En proceso')
INSERT INTO Mantenimiento VALUES(3,'05/05/2020','06/05/2020','En proceso')
INSERT INTO Mantenimiento VALUES(4,'07/05/2020','08/05/2020','En Cola')
INSERT INTO Mantenimiento VALUES(5,'12/05/2020','15/05/2020','En Proceso')

SELECT * FROM Mantenimiento

INSERT INTO Detalle_Mantenimiento VALUES(1,3,1,80)
INSERT INTO Detalle_Mantenimiento VALUES(2,1,2,1800)
INSERT INTO Detalle_Mantenimiento VALUES(3,2,3,1500)
INSERT INTO Detalle_Mantenimiento VALUES(4,3,6,80)
INSERT INTO Detalle_Mantenimiento VALUES(5,2,1,80)

SELECT * FROM Mecanico
SELECT * FROM Detalle_Mantenimiento

SELECT YEAR(2015), MONTH(12), DAY(30);  
SELECT YEAR('2010-04-30T01:01:01.1234567-07:00');
SELECT YEAR(2020)

BACKUP DATABASE MantenimientoVehiculo to 
disk = 'C:\Users\Pc\Desktop\JASO\UNI\Carrera Ingeniera de Sistemas\IV Semestre\Base de Datos\Walger\Tareas\Respaldos'
