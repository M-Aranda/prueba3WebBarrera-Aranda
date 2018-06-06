CREATE DATABASE mundial2018;-- DROP DATABASE mundial2018

USE mundial2018;


CREATE TABLE grupo(
    id INT AUTO_INCREMENT,
    nombre_grupo VARCHAR (45),
    PRIMARY KEY(id)

    
);

INSERT INTO grupo VALUES (NULL,'No Grupo'),(NULL,'Grupo A'),(NULL,'Grupo B'),(NULL,'Grupo C'),(NULL,'Grupo D'),(NULL,'Grupo E'),(NULL,'Grupo F'),(NULL,'Grupo G'),(NULL,'Grupo H');


CREATE TABLE equipo(
    id INT AUTO_INCREMENT,
    nombre VARCHAR (20),
    insignia VARCHAR (2000), /*Debiese ser un varchar que diga donde esta la ruta*/
    puntaje INT,
    nGolesAFavor INT,
    nGolesEnContra INT,
    diferenciaDeGoles INT,
    grupo_id INT,
    FOREIGN KEY (grupo_id) REFERENCES grupo(id),
    PRIMARY KEY(id)

);


INSERT INTO equipo VALUES (NULL, 'Egipto','../imagenes/Egipto.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Marruecos','../imagenes/Marruecos.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Nigeria','../imagenes/Nigeria.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Senegal','../imagenes/Senegal.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Tunez','../imagenes/Tunez.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Arabia Saudi','../imagenes/ArabiaSaudi.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Australia','../imagenes/Australia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Japon','../imagenes/Japon.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Republica de Corea','../imagenes/Corea.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Iran','../imagenes/Iran.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Alemania','../imagenes/Alemania.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Belgica','../imagenes/Belgica.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Croacia','../imagenes/Croacia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Dinamarca','../imagenes/Dinamarca.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Espania','../imagenes/Espania.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Francia','../imagenes/Francia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Inglaterra','../imagenes/Inglaterra.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Islandia','../imagenes/Islandia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Polonia','../imagenes/Polonia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Portugal','../imagenes/Portugal.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Rusia','../imagenes/Rusia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Serbia','../imagenes/Serbia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Suecia','../imagenes/Suecia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Suiza','../imagenes/Suiza.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Costa Rica','../imagenes/CostaRica.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Mexico','../imagenes/Mexico.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Panama','../imagenes/Panama.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Argentina','../imagenes/Argentina.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Brasil','../imagenes/Brasil.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Colombia','../imagenes/Colombia.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Peru','../imagenes/Peru.png',0,0,0,0,1);
INSERT INTO equipo VALUES (NULL, 'Uruguay','../imagenes/Uruguay.png',0,0,0,0,1);


CREATE TABLE tipo_partido(
    id INT AUTO_INCREMENT,
    relevancia VARCHAR (45),
    PRIMARY KEY(id)
);


CREATE TABLE partido(
    id INT AUTO_INCREMENT,
    fecha DATE,
    equipo_visita INT,
    equipo_local INT,
    tipo_partido_id INT,
    FOREIGN KEY (equipo_visita) REFERENCES equipo (id),
    FOREIGN KEY (equipo_local) REFERENCES equipo (id),
    FOREIGN KEY (tipo_partido_id) REFERENCES tipo_partido (id),
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
    duracion INT,
    stats VARCHAR(45),
    FOREIGN KEY (fk_partido) REFERENCES partido(id),
    FOREIGN KEY (fk_tipoResultado) REFERENCES tipoResultado(id),
    PRIMARY KEY(id)

);

DELIMITER $$
CREATE PROCEDURE sortear_equipos ()-- DROP PROCEDURE sortear_equipos
BEGIN
	DECLARE cont INT;
    DECLARE grupo_fk INT;
    SET cont = 0;
    
	CREATE TEMPORARY TABLE tmp_sort(
		id INT AUTO_INCREMENT DEFAULT NULL,
        id_equipo INT,
        PRIMARY KEY(id)
    );
    
    INSERT INTO tmp_sort(id_equipo) SELECT e.id FROM equipo e ORDER BY RAND();
    
    WHILE cont < 32 DO   
		SET cont = (cont +1);        
       case  
           when cont <= 4 then SET grupo_fk = 2;
           when cont <= 8 then SET grupo_fk = 3;
           when cont <= 12 then SET grupo_fk = 4;
           when cont <= 16 then SET grupo_fk = 5;
           when cont <= 20 then SET grupo_fk = 6;
           when cont <= 24 then SET grupo_fk = 7;
           when cont <= 28 then SET grupo_fk = 8;
           when cont <= 32 then SET grupo_fk = 9;
        end case;      
		
		UPDATE equipo SET grupo_id = grupo_fk WHERE id = (SELECT id_equipo FROM tmp_sort WHERE id = cont);
        
    END WHILE;
    DROP TABLE tmp_sort;
    
 END$$
DELIMITER ;

CALL sortear_equipos;
select * from equipo ORDER BY grupo_id;

-- DROP DATABASE mundial2018;

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





