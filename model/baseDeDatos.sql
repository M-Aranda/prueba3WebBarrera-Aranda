CREATE DATABASE mundial2018;

USE mundial2018;

CREATE TABLE equipo(
    id INT AUTO_INCREMENT,
    nombre VARCHAR (20),
    insignia VARCHAR (2000), /*Debiese ser un varchar que diga donde esta la ruta*/
    puntaje INT,
    nGolesAFavor INT,
    nGolesEnContra INT,
    diferenciaDeGoles INT,
    PRIMARY KEY(id)

);


INSERT INTO equipo VALUES (NULL, 'Egipto','../imagenes/Egipto.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Marruecos','../imagenes/Marruecos.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Nigeria','../imagenes/Nigeria.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Senegal','../imagenes/Senegal.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Tunez','../imagenes/Tunez.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Arabia Saudi','../imagenes/ArabiaSaudi.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Australia','../imagenes/Australia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Japon','../imagenes/Japon.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Republica de Corea','../imagenes/Corea.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Iran','../imagenes/Iran.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Alemania','../imagenes/Alemania.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Belgica','../imagenes/Belgica.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Croacia','../imagenes/Croacia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Dinamarca','../imagenes/Dinamarca.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Espania','../imagenes/Espania.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Francia','../imagenes/Francia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Inglaterra','../imagenes/Inglaterra.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Islandia','../imagenes/Islandia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Polonia','../imagenes/Polonia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Portugal','../imagenes/Portugal.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Rusia','../imagenes/Rusia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Serbia','../imagenes/Serbia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Suecia','../imagenes/Suecia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Suiza','../imagenes/Suiza.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Costa Rica','../imagenes/CostaRica.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Mexico','../imagenes/Mexico.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Panama','../imagenes/Panama.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Argentina','../imagenes/Argentina.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Brasil','../imagenes/Brasil.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Colombia','../imagenes/Colombia.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Peru','../imagenes/Peru.png',0,0,0,0);
INSERT INTO equipo VALUES (NULL, 'Uruguay','../imagenes/Uruguay.png',0,0,0,0);

TRUNCATE TABLE equipo;

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

DROP DATABASE mundial2018;

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





