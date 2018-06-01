CREATE DATABASE mundial2018;

USE mundial2018;

CREATE TABLE equipo(
    id INT AUTO_INCREMENT,
    nombre VARCHAR (20),
    insignia VARCHAR (50), /*Debiese ser un varchar que diga donde esta la ruta*/
    puntaje INT,
    nGolesAFavor INT,
    nGolesEnContra INT,
    diferenciaDeGoles INT,
    PRIMARY KEY(id)

);


INSERT INTO equipo VALUES (NULL, 'Egipto','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Marruecos','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Nigeria','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Senegal','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Tunez','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Arabia Saudi','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Australia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Japon','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Republica de Corea','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Iran','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Alemania','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Belgica','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Croacia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Dinamarca','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Espania','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Francia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Inglaterra','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Islandia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Polonia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Portugal','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Rusia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Serbia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Suecia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Suiza','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Costa Rica','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Mexico','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Panama','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Argentina','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Brasil','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Colombia','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Peru','insig',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Uruguay','insig',0,0,0,0);


CREATE TABLE partido(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);


CREATE TABLE equipo_partido(
    id INT AUTO_INCREMENT,
    partido_fk INT,
    equipo_fk INT,
    FOREIGN KEY (partido_fk) REFERENCES partido(id),
    FOREIGN KEY (equipo_fk) REFERENCES equipo(id),
    PRIMARY KEY(id)
);


CREATE TABLE tipoResultado(
    id INT AUTO_INCREMENT,
    nombre VARCHAR (30),
    PRIMARY KEY(id)

);

INSERT INTO tipoResultado VALUES (NULL, 'Hubo un ganador');
INSERT INTO tipoResultado VALUES (NULL, 'Empate');
INSERT INTO tipoResultado VALUES (NULL, 'Suspendido');

CREATE TABLE resultado(
    id INT AUTO_INCREMENT,
    fk_partido INT,
    fk_tipoResultado INT,
    ganador INT,
    perdedor INT,
    FOREIGN KEY (ganador) REFERENCES equipo(id),
    FOREIGN KEY (perdedor) REFERENCES equipo(id),
    FOREIGN KEY (fk_partido) REFERENCES partido(id),
    FOREIGN KEY (fk_tipoResultado) REFERENCES tipoResultado(id),
    PRIMARY KEY(id)

);




CREATE TABLE grupoOctavosDeFinal(
    id INT AUTO_INCREMENT,
    nombreGrupo VARCHAR(50),
    primerEquipoId INT,
    segundoEquipoId INT,
    tercerEquipoId INT,
    cuartoEquipoId INT,
    FOREIGN KEY (primerEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (segundoEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (tercerEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (cuartoEquipoId) REFERENCES equipo(id), 
    PRIMARY KEY(id)
);


CREATE TABLE grupoCuartosDeFinal(
    id INT AUTO_INCREMENT,
    nombreGrupo VARCHAR(50),
    primerEquipoId INT,
    segundoEquipoId INT,
    tercerEquipoId INT,
    cuartoEquipoId INT,
    FOREIGN KEY (primerEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (segundoEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (tercerEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (cuartoEquipoId) REFERENCES equipo(id), 
    PRIMARY KEY(id)

);

CREATE TABLE grupoSemiFinal(
    id INT AUTO_INCREMENT,
    nombreGrupo VARCHAR(50),
    primerEquipoId INT,
    segundoEquipoId INT,
    tercerEquipoId INT,
    cuartoEquipoId INT,
    FOREIGN KEY (primerEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (segundoEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (tercerEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (cuartoEquipoId) REFERENCES equipo(id), 
    PRIMARY KEY(id)

);

CREATE TABLE Final(
    id INT AUTO_INCREMENT,
    nombreGrupo VARCHAR(50),
    primerEquipoId INT,
    segundoEquipoId INT,
    FOREIGN KEY (primerEquipoId) REFERENCES equipo(id), 
    FOREIGN KEY (segundoEquipoId) REFERENCES equipo(id),
    PRIMARY KEY(id)

);

CREATE TABLE equiposSorteados(
	id INT AUTO_INCREMENT,
    fk_equipo INT,
    FOREIGN KEY (fk_equipo) REFERENCES equipo(id),
    PRIMARY KEY(id)
);

DELIMITER //
CREATE PROCEDURE sortearGrupos()
	DECLARE numeroRandom INT;
    DECLARE primerEquipo INT;
    DECLARE segundoEquipo INT;
    DECLARE tercerEquipo INT;
    DECLARE cuartoEquipo INT;
    
    BEGIN
		SET numeroRandom=(ROUND((RAND() * (32-1))+1));
        IF SELECT COUNT(*) FROM equiposSorteados==0 THEN
        
        INSERT INTO equiposSorteados VALUES(NULL, numeroRandom);
        END IF
        
    
    END


DELIMITER ;

/*
3 puntos por victoria
1 punto por empate 
0 por derrota

Si el partido se decide por penales, el ganador obtiene 2 puntos y el perdedor 1



Pasan a la siguiente ronda los dos equipos de cada grupo mejor ubicados en la tabla de posiciones final. 
El orden de clasificación se determina teniendo en cuenta los siguientes criterios, 
en orden de preferencia:

1-El mayor número de puntos obtenidos.
2-La mayor diferencia de goles (la cantidad de goles que hizo hasta ahora - la cantidad total de goles que le han hecho).
3-El mayor número de goles a favor (cuantos goles a hecho hasta ahora).


Si dos o más equipos quedan igualados según los criterios anteriores, se usarán los siguientes criterios:

1-El mayor número de puntos obtenidos en los partidos entre los equipos en cuestión.
2-La mayor diferencia de goles en esos mismos enfrentamientos.
3-El mayor número de goles anotados por cada equipo en los partidos disputados entre sí.
4-Sorteo del comité organizador de la Copa Mundial.


*/





