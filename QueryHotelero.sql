CREATE DATABASE Hotel
USE Hotel

CREATE TABLE Cliente(
NoCliente int identity (1,1) primary key not null,
Nombres nvarchar(50),
Apellidos nvarchar(50),
Direccion nvarchar(50),
Telefono nvarchar(50),
Correo nvarchar(50)
)
SELECT * FROM Cliente

CREATE TABLE Empleado(
IdEmpleado int identity (1,1) primary key not null,
Nombres nvarchar(50),
Apellidos nvarchar(50),
Direccion nvarchar(50),
Salario float
)

SELECT * FROM Empleado

CREATE TABLE Reserva(
IdReserva int identity (1,1) primary key not null,
Fecha datetime,
IdEmpleado int foreign key references Empleado(IdEmpleado),
NoCliente int foreign key references Cliente(NoCliente),
Estado varchar(50),
Pago varchar(50),
Pais varchar(50),
Moneda varchar(50),
)

SELECT * FROM Reserva

--Creacion del detalle de Reserva

CREATE TABLE TipoHabitacion(
CodigoTipo int primary key not null,
Descripcion varchar(50),
Precio float
)

SELECT * FROM TipoHabitacion

CREATE TABLE Habitacion(
NoHabitacion int primary key not null,
Descripcion varchar(50),
Capacidad int,
CodigoTipo int foreign key references TipoHabitacion(CodigoTipo),
Estado varchar(50)
)

SELECT * FROM Habitacion

SELECT * FROM Reserva_Habitacion

CREATE TABLE Reserva_Habitacion(
IdReservaHabit int identity (1,1) primary key not null,
FechaEntrada datetime,
FechaSalida datetime,
NoHabitacion int,
IdReserva int foreign key references Reserva(IdReserva),
Precio float
)

INSERT INTO Reserva_Habitacion VALUES ('30/09/2021','05/10/2021',3,2,200)

Alter table Reserva_Habitacion
add foreign key (NoHabitacion) references Habitacion(NoHabitacion)

DELETE Reserva_Habitacion WHERE IdReservaHabit = 2
SELECT * FROM Reserva_Habitacion
-- Creacion de las tablas referentes a servicios de habitacion

CREATE TABLE Servicio(
NoServicio int primary key not null,
Descripcion varchar(50),
Precio float
)

SELECT * FROM Servicio

CREATE TABLE ReservaHab_Servicio(
IdReservaHabit int foreign key references Reserva_Habitacion(IdReservaHabit),
NoServicio int foreign key references Servicio(NoServicio),
Cantidad int,
Precio float
)

SELECT * FROM ReservaHab_Servicio

--Creacion de las tablas references a los huesped de cada habitacion

CREATE TABLE Huesped(
IdHuesped int primary key not null,
Nombres varchar (50),
Apellidos varchar(50),
Direccion varchar(50),
Telefono varchar(50),
Correo varchar(50)
)

INSERT INTO Huesped VALUES(2, 'Patricia Rosa Eugenia','Alvarez Chana', 'Semaforos de Linda 2c abajo','7944-6644','alyssaneva@gmail.com')
SELECT * FROM Huesped

CREATE TABLE ReservaHab_Huesped(
IdHuesped int foreign key references Huesped(IdHuesped),
IdReservaHabit int foreign key references Reserva_Habitacion(IdReservaHabit)
)

INSERT INTO ReservaHab_Huesped VALUES (2,1002)

SELECT * FROM ReservaHab_Huesped

-- Inserccion de datos

INSERT INTO TipoHabitacion VALUES(1,'Basica',150)
INSERT INTO TipoHabitacion VALUES (2,'Ejecutiva', 200)
INSERT INTO TipoHabitacion VALUES (3,'Presidencial',500)

SELECT * FROM TipoHabitacion

BACKUP DATABASE Hotel TO DISK =  'C:\Users\Pc\Desktop\Torneo.bak'