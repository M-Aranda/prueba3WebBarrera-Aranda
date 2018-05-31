CREATE DATABASE mundial2018;

USE mundial2018;

CREATE TABLE equipo(
    id INT AUTO_INCREMENT,
    nombre VARCHAR (20),
    insignia VARCHAR (50),
    PRIMARY KEY(id)

);

CREATE TABLE grupo(
    id INT AUTO_INCREMENT,
    nombreGrupo VARCHAR(50),
    primerEquipoId INT,
    segundoEquipoId INT,
    tercerEquipoId INT,
    cuartoEquipoId INT,
    FOREIGN KEY primerEquipoId REFERENCES equipo(id), 
    FOREIGN KEY segundoEquipoId REFERENCES equipo(id), 
    FOREIGN KEY tercerEquipoId REFERENCES equipo(id), 
    FOREIGN KEY cuartoEquipoId REFERENCES equipo(id), 
    PRIMARY KEY(id)



);

