CREATE DATABASE Asegurados
GO
USE Asegurados
GO

CREATE TABLE Poliza(
IdPoliza int primary key not null,
TipoPoliza varchar(30),
Descripcion varchar(50),
Costo float,
CostoExtension float,
ValorCobertura float
)

GO

CREATE TABLE Vendedor(
IdVendedor int identity (1,1) primary key not null,
Nombres varchar(50),
Apellidos varchar(50),
Direccion varchar(50),
Correo varchar(50),
Telefono varchar(50)
)

GO

CREATE TABLE Familiar(
IdFamiliar int primary key not null,
IdPoliza int foreign key references Poliza(IdPoliza),
Nombre varchar(50),
Apellidoo varchar(50),
Edad int,
FechaNac date,
Direccion varchar (50)
)

GO

CREATE TABLE Poliza_Asegurado(
IdContrato int primary key not null,
IdPoliza int foreign key references Poliza(IdPoliza),
IdVendedor int foreign key references Vendedor(IdVendedor),
IdAsegurado int foreign key references Asegurado(IdAsegurado),
FechaContratacion date,
FechaInicial date,
FechaFinal date
)

GO

--------Hospitalizacion

CREATE TABLE Hospital(
IdHospital int primary key not null,
Nombre varchar(50),
Direccion varchar(50),
Telefono varchar(8) check (Telefono like '[2|6|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Especialidad varchar(20)
)

GO

CREATE TABLE Doctor(
IdDoctor int primary key not null,
Nombre varchar(50),
Apellido varchar(50),
Cedula varchar(14) check (Cedula like '[0-9][0-9][0-9][0-3][0-9][0|1][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]')  
)

GO

CREATE TABLE Gastos (
IdGasto int primary key not null,
Descripcion varchar(30),
Costo float
)

GO

CREATE TABLE Hospitalizacion(
IdHospitalizacion int primary key not null,
IdAsegurado int foreign key references Asegurado(IdAsegurado),
IdHospital int foreign key references Hospital(IdHospital)
)

GO

CREATE TABLE Detalle_Hospitalizacion(
IdDetalleHospitalizacion int primary key not null,
IdHospitalizacion int foreign key references Hospitalizacion(IdHospitalizacion),
IdDoctor int foreign key references Doctor(IdDoctor),
FechaEntrada date,
FechaSalida date,
IdGastos int foreign key references Monto(IdMonto)
)

GO

CREATE TABLE Monto(
IdMonto int primary key not null,
IdGasto int foreign key references Gastos(IdGasto),
Descripcion varchar(30),
MontoTotal float,
)









CREATE TABLE Asegurado(
IdAsegurado int identity primary key not null,
Nombre varchar (50),
Apellido varchar (50),
Direccion varchar (50),
Correo varchar (50),
Telefono varchar (50)
)