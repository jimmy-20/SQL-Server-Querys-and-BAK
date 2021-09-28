CREATE DATABASE TorneoAjedrez
USE TorneoAjedrez

CREATE TABLE Jugadores(
IdJugador int identity(1,1) primary key not null,
PrimerNombre varchar(50),
SegundoNombre varchar(50),
PrimerApellido varchar(50),
SegundoApellido varchar(50),
IdPais int foreign key references Pais(IdPais),
FechaNacimiento datetime not null,
CantidadTorneos int,
NivelJuego int
)

INSERT INTO Jugadores VALUES('Jimmy','Alexander','Soza','Ortiz',1,'27/07/2002','1',8)
INSERT INTO Jugadores VALUES ('Massiel','Alejandra','Fonseca','Sandino',1,'22/04/2003','0',7)
INSERT INTO Jugadores VALUES ('Jeison','Jose','Suarez','Jimenez',2,'16/02/2003','3',6)
INSERT INTO Jugadores VALUES ('Patricia','Rosa','Alvarez','Chana',3,'08/03/2006',4,9)
INSERT INTO Jugadores VALUES ('Allan','Alberto','Arcia','Acuña',2,'07/08/2003',8,7)
INSERT INTO Jugadores VALUES ('Maria','Jose','Ramirez','Rodriguez',4,'07/11/2005',18,9)
INSERT INTO Jugadores VALUES ('Johan','Alexis','Banda','',3,'01/09/2000',15,7)
INSERT INTO Jugadores VALUES ('Leonor','Isabel','Casaya','',4,'20/04/2003',0,5)
SELECT * FROM Jugadores

CREATE TABLE Arbitro(
IdArbitro int identity(1,1) primary key not null,
PrimerNombre varchar(50),
SegundoNombre varchar(50),
PrimerApellido varchar(50),
SegundoApellido varchar(50),
IdPais int foreign key references Pais(IdPais),
Antiguedad int,
CantidadPartidos int,
Rango varchar(30)
)

INSERT INTO Arbitro VALUES('Flor','de Maria','Ortiz','',1,2,20,'1er Arbitro')
INSERT INTO Arbitro VALUES ('Jimmy', 'del Carmen','Soza','Aguirre',1,5,25,'2do Arbitro')
INSERT INTO Arbitro VALUES('Carlos','','Triana','',3,1,5,'1er Arbitro')
INSERT INTO ARBITRO VALUES('Maria','de la Paz','Pereira','',6,1,14,'2do Arbitro')
INSERT INTO Arbitro VALUES ('Jeremy','Kalef','Soza','Aguirre',1,4,7,'1er Arbitro')
SELECT * FROM Arbitro

CREATE TABLE Pais(
IdPais int primary key not null,
Nombre varchar(50),
CantidadClub int
)

SELECT * FROM Pais
INSERT INTO Pais VALUES(1,'Nicaragua',5)
INSERT INTO Pais VALUES (2,'Costa Rica',8)
INSERT INTO Pais VALUES (3, 'El Salvador',13)
INSERT INTO PAIS VALUES(4,'Honduras',9)
INSERT INTO PAIS VALUES (5,'Guatemala',6)
INSERT INTO PAIS VALUES (6,'Belice',12)

CREATE TABLE Hotel(
IdHotel int primary key not null,
Nombre varchar(50),
Direccion varchar(50),
Telefono varchar(8) check (Telefono like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

INSERT INTO Hotel VALUES (1,'Holiday INN Express','900 metros de Galerias Santo Domingo','22553399')
INSERT INTO Hotel VALUES (2,'Mozonte','Al lado del parque Las Madres','78990264')
INSERT INTO Hotel VALUES (3,'Real Continental','Frente al centro comercial Metrocentro','26908076')

CREATE TABLE Salon(
IdSalon int primary key not null,
IdHotel int foreign key references Hotel(IdHotel),
Nombre varchar(50),
Capacidad int
)

INSERT INTO Salon VALUES(1,1,'Sala de Convenciones I',45)
INSERT INTO Salon VALUES (2,1,'Sala de Convenciones II',40)
INSERT INTO Salon VALUES(3,2,'Salon de Eventos',70)
INSERT INTO Salon VALUES (4,3,'Lugar de Convenciones',65)
SELECT * FROM Salon

CREATE TABLE Jornada(
IdJornada int primary key not null,
IdHotel int foreign key references Hotel(IdHotel),
Fecha datetime not null,
Estado varchar(20),
HoraInicio datetime,
HoraCierre datetime,
CostoEntrada float,
Modalidad varchar (10)
)

INSERT INTO Jornada VALUES(1,3,'12/09/2020','En espera','12/09/2020 13:30:00','17:00:00',70,'Vespertina')
UPDATE Jornada SET HoraCierre = '12/09/2020 17:00:00'
INSERT INTO Jornada VALUES (2,1,'12/09/2020','En espera', '12/09/2020 13:00:00','12/09/2020 17:00:00',80,'Vespertina')
INSERT INTO Jornada VALUES (3,2,'20/09/2020', 'En espera', '20/09/2020 08:00:00', '20/09/2020 12:00:00', 65, 'Matutino')
SELECT * FROM Jornada

CREATE TABLE Partida(
IdPartida int identity(1,1) primary key not null,
IdJornada int foreign key references Jornada(IdJornada),
IdSalon int foreign key references Salon(IdSalon),
IdArbitro int foreign key references Arbitro(IdArbitro),
HoraInicio time(0),
HoraFinal time(0),
Duracion time(0),
)
DROP TABLE Partida

INSERT INTO Partida VALUES(1,4,1, '14:00:00','14:40:00','00:30:00');
INSERT INTO Partida VALUES (1,4,2, '14:00:00','14:40:00','00:38:00')
INSERT INTO Partida VALUES (1,4,4, '14:00:00', '15:00:00', '00:45:07')
INSERT INTO Partida VALUES (2,2,3, '14:00:00', '15:00:00', '00:28:00')
INSERT INTO Partida VALUES (2,2,5, '14:15:00', '15:00:00', '00:43:28')
SELECT * FROM Partida


DECLARE @timeFrom time(4) = '23:00:00';  
DECLARE @timeTo time(3) = @timeFrom;  

SELECT @timeTo AS 'time(3)', @timeFrom AS 'time(4)'; 

CREATE TABLE DetalleJugador(
IdJugador int not null,
IdPartida int not null,
Color varchar(20),
Resultado varchar(15)
primary key (IdJugador,IdPartida)
)

DROP TABLE DetalleJugador

INSERT INTO DetalleJugador VALUES(1,1,'Blancas','Ganador')
INSERT INTO DetalleJugador VALUES (2,1,'Negras','Perdedor')

INSERT INTO DetalleJugador VALUES(3,2,'Blancas','Perdedor')
INSERT INTO DetalleJugador VALUES(4,2,'Negras','Ganador')

INSERT INTO DetalleJugador VALUES (4,3,'Blancas','Ganador')
INSERT INTO DetalleJugador VALUES (1,3,'Negras','Perdedor')

INSERT INTO DetalleJugador VALUES (5,4, 'Blancas','Perdedor')
INSERT INTO DetalleJugador VALUES (6,4, 'Negras' , 'Ganador')

INSERT INTO DetalleJugador VALUES (7,5,'Blancas', 'Ganador')
INSERT INTO DetalleJugador VALUES (8,5,'Negras', 'Perdedor')
SELECT * FROM DetalleJugador

CREATE TABLE HotelJugador(
IdHotelJugador int primary key not null,
IdHotel int foreign key references Hotel(IdHotel),
IdJugador int foreign key references Jugadores(IdJugador),
FechaEntrada date,
FechaSalida date
)

INSERT INTO HotelJugador VALUES (1,3,1,'10/09/2020','13/09/2020')
INSERT INTO HotelJugador VALUES (2,3,2,'10/09/2020','15/09/2020')
INSERT INTO HotelJugador VALUES (3,3,3,'07/09/2020','15/09/2020')
INSERT INTO HotelJugador VALUES (4,3,4,'08/09/2020','14/09/2020')
INSERT INTO HotelJugador VALUES (5,1,5,'10/09/2020','13/09/2020')
INSERT INTO HotelJugador VALUES (6,1,6,'07/09/2020','13/09/2020')
INSERT INTO HotelJugador VALUES (7,1,7,'11/09/2020','13/09/2020')
INSERT INTO HotelJugador VALUES (8,1,8,'10/09/2020','16/09/2020')

SELECT * FROM HotelJugador

CREATE TABLE VentaBoletos(
IdVentaBoletos int identity (1,1) primary key not null,
IdJornada int foreign key references Jornada(IdJornada),
Precio float ,
Cantidad int
)

DROP TABLE VentaBoletos

INSERT INTO VentaBoletos VALUES(1,70,5)
INSERT INTO VentaBoletos VALUES(1,70,3)
INSERT INTO VentaBoletos VALUES(2,80,1)
INSERT INTO VentaBoletos VALUES(2,80,7)

SELECT * FROM VentaBoletos

Backup database TorneoAjedrez
to disk = 'C:\Users\Pc\Desktop\Torneo.bak'