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

INSERT INTO tipo_partido VALUES(NULL, 'Fase de grupo');
INSERT INTO tipo_partido VALUES(NULL, 'Octavos de final');
INSERT INTO tipo_partido VALUES(NULL, 'Cuartos de final');
INSERT INTO tipo_partido VALUES(NULL, 'Semi final');
INSERT INTO tipo_partido VALUES(NULL, 'Final');


CREATE TABLE equipo_visita(
	id INT AUTO_INCREMENT,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES equipo (id),
    PRIMARY KEY(id)
);

CREATE TABLE equipo_local(
	id INT AUTO_INCREMENT,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES equipo (id),
    PRIMARY KEY(id)
);


CREATE TABLE partido(
    id INT AUTO_INCREMENT,
    fecha DATE,
	equipo_visita_fk INT,
	equipo_local_fk INT,
    tipo_partido_id INT,
    FOREIGN KEY (equipo_visita_fk) REFERENCES equipo_visita (id),
    FOREIGN KEY (equipo_local_fk) REFERENCES equipo_local (id),
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



DELIMITER $$
CREATE PROCEDURE faseDeGruposCrearPartidosParaUnGrupo(fk_grupo INT) -- DROP PROCEDURE faseDeGruposCrearPartidosParaUnGrupo
	BEGIN
    DECLARE fkPrimerEquipo INT;
    DECLARE fkSegundoEquipo INT;
    DECLARE fkTercerEquipo INT;
    DECLARE fkCuartoEquipo INT;
    
    DECLARE primerLocal INT;
    DECLARE segundoLocal INT;
    DECLARE tercerLocal INT;
    DECLARE cuartoLocal INT;
    
	DECLARE primeraVisita INT;
    DECLARE segundaVisita INT;
    DECLARE terceraVisita INT;
    DECLARE cuartaVisita INT;

    /*
	CREATE TEMPORARY TABLE tblGruposTMP(
	id INT AUTO_INCREMENT,
	equipo_fk INT,
	PRIMARY KEY(id)
    );
    */
    
    SET fkPrimerEquipo=(SELECT id FROM equipo WHERE grupo_id=fk_grupo LIMIT 0,1);
    SET fkSegundoEquipo=(SELECT id FROM equipo WHERE grupo_id=fk_grupo LIMIT 1,1);
    SET fkTercerEquipo=(SELECT id FROM equipo WHERE grupo_id=fk_grupo LIMIT 2,1);
    SET fkCuartoEquipo=(SELECT id FROM equipo WHERE grupo_id=fk_grupo LIMIT 3,1);
    
    /*
	INSERT INTO tblGruposTMP VALUES (NULL, fkPrimerEquipo);
    INSERT INTO tblGruposTMP VALUES (NULL, fkSegundoEquipo);
    INSERT INTO tblGruposTMP VALUES (NULL, fkTercerEquipo);
    INSERT INTO tblGruposTMP VALUES (NULL, fkCuartoEquipo);
    */

	INSERT INTO equipo_local VALUES(NULL,fkPrimerEquipo);
	INSERT INTO equipo_local VALUES(NULL,fkSegundoEquipo);
    INSERT INTO equipo_local VALUES(NULL,fkTercerEquipo);
    INSERT INTO equipo_local VALUES(NULL,fkCuartoEquipo);
    
	INSERT INTO equipo_visita VALUES(NULL,fkPrimerEquipo);
	INSERT INTO equipo_visita VALUES(NULL,fkSegundoEquipo);
    INSERT INTO equipo_visita VALUES(NULL,fkTercerEquipo);
    INSERT INTO equipo_visita VALUES(NULL,fkCuartoEquipo);

	SET primerLocal =(SELECT equipo_local.equipo_id FROM equipo_local, equipo WHERE equipo_local.equipo_id=equipo.id AND equipo.grupo_id=fk_grupo LIMIT 0,1);
	SET segundoLocal =(SELECT equipo_local.equipo_id FROM equipo_local, equipo WHERE equipo_local.equipo_id=equipo.id AND equipo.grupo_id=fk_grupo LIMIT 1,1);
    SET tercerLocal =(SELECT equipo_local.equipo_id FROM equipo_local, equipo WHERE equipo_local.equipo_id=equipo.id AND equipo.grupo_id=fk_grupo LIMIT 2,1);
    SET cuartoLocal =(SELECT equipo_local.equipo_id FROM equipo_local, equipo WHERE equipo_local.equipo_id=equipo.id AND equipo.grupo_id=fk_grupo LIMIT 3,1);
    
	SET primeraVisita =(SELECT equipo_visita.equipo_id FROM equipo_visita, equipo WHERE equipo_visita.equipo_id=equipo.id AND equipo.grupo_id=fk_grupo LIMIT 0,1);
	SET segundaVisita =(SELECT equipo_visita.equipo_id FROM equipo_visita, equipo WHERE equipo_visita.equipo_id=equipo.id AND equipo.grupo_id=fk_grupo LIMIT 1,1);
    SET terceraVisita =(SELECT equipo_visita.equipo_id FROM equipo_visita, equipo WHERE equipo_visita.equipo_id=equipo.id AND equipo.grupo_id=fk_grupo LIMIT 2,1);
    SET cuartaVisita =(SELECT equipo_visita.equipo_id FROM equipo_visita, equipo WHERE equipo_visita.equipo_id=equipo.id AND equipo.grupo_id=fk_grupo LIMIT 3,1);
    
    SET FOREIGN_KEY_CHECKS=0; -- misticidad++
    INSERT INTO partido VALUES(NULL,'2018-07-03',primeraVisita,cuartoLocal,1);
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-03',segundaVisita,tercerLocal,1);
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-04',primeraVisita,tercerLocal,1);
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-04',segundaVisita,cuartoLocal,1);
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-05',segundaVisita,primerLocal,1);
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-05',terceraVisita,cuartoLocal,1);
    SET FOREIGN_KEY_CHECKS=1;
    
    
    
   /* DROP TABLE tblGruposTMP;*/
	END$$
   
   
    
DELIMITER ;



CALL faseDeGruposCrearPartidosParaUnGrupo(2);
CALL faseDeGruposCrearPartidosParaUnGrupo(3);
CALL faseDeGruposCrearPartidosParaUnGrupo(4);
CALL faseDeGruposCrearPartidosParaUnGrupo(5);
CALL faseDeGruposCrearPartidosParaUnGrupo(6);
CALL faseDeGruposCrearPartidosParaUnGrupo(7);
CALL faseDeGruposCrearPartidosParaUnGrupo(8);
CALL faseDeGruposCrearPartidosParaUnGrupo(9);



DELIMITER //
CREATE PROCEDURE mostrarVSDeUnGrupo(idDelGrupo INT) --  DROP PROCEDURE mostrarVSDeUnGrupo;
	BEGIN
		DECLARE idPrimerPartidoDelGrupo INT;
        DECLARE idSegundoPartidoDelGrupo INT;
        DECLARE idTercerPartidoDelGrupo INT;
        DECLARE idCuartoPartidoDelGrupo INT;
        DECLARE idQuintoPartidoDelGrupo INT;
        DECLARE idSextoPartidoDelGrupo INT;
        
        DECLARE cont INT;
        
		
		DECLARE idVisita INT;
        DECLARE idLocal INT;
        DECLARE equipoVisita INT;
        DECLARE equipoLocal INT;
        
        DECLARE nomV VARCHAR (20);
        DECLARE insVisita VARCHAR (2000);
        DECLARE nomL VARCHAR (20);
        DECLARE insLocal VARCHAR (2000);
        
        
        
		CREATE TEMPORARY TABLE tblVS(
		id INT AUTO_INCREMENT,
		nomVisita VARCHAR (20),
        insigniaVisita VARCHAR (2000),
        nomLocal VARCHAR (20),
        insigniaLocal VARCHAR (2000),
		PRIMARY KEY(id)
		);
			
        IF idDelGrupo=2 THEN
			SET idPrimerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 1 AND 6 LIMIT 0,1);
			SET idSegundoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 1 AND 6 LIMIT 1,1);
			SET idTercerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 1 AND 6 LIMIT 2,1);
			SET idCuartoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 1 AND 6 LIMIT 3,1);
			SET idQuintoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 1 AND 6 LIMIT 4,1);
			SET idSextoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 1 AND 6 LIMIT 5,1);
		ELSEIF idDelGrupo=3 THEN
			SET idPrimerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 7 AND 12 LIMIT 0,1);
			SET idSegundoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 7 AND 12 LIMIT 1,1);
			SET idTercerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 7 AND 12 LIMIT 2,1);
			SET idCuartoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 7 AND 12 LIMIT 3,1);
			SET idQuintoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 7 AND 12 LIMIT 4,1);
			SET idSextoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 7 AND 12 LIMIT 5,1);
		ELSEIF idDelGrupo=4 THEN
			SET idPrimerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 13 AND 18 LIMIT 0,1);
			SET idSegundoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 13 AND 18 LIMIT 1,1);
			SET idTercerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 13 AND 18 LIMIT 2,1);
			SET idCuartoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 13 AND 18 LIMIT 3,1);
			SET idQuintoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 13 AND 18 LIMIT 4,1);
			SET idSextoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 13 AND 18 LIMIT 5,1);
		ELSEIF idDelGrupo=5 THEN
			SET idPrimerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 19 AND 24 LIMIT 0,1);
			SET idSegundoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 19 AND 24 LIMIT 1,1);
			SET idTercerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 19 AND 24 LIMIT 2,1);
			SET idCuartoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 19 AND 24 LIMIT 3,1);
			SET idQuintoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 19 AND 24 LIMIT 4,1);
			SET idSextoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 19 AND 24 LIMIT 5,1);
		ELSEIF idDelGrupo=6 THEN
			SET idPrimerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 25 AND 30 LIMIT 0,1);
			SET idSegundoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 25 AND 30 LIMIT 1,1);
			SET idTercerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 25 AND 30 LIMIT 2,1);
			SET idCuartoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 25 AND 30 LIMIT 3,1);
			SET idQuintoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 25 AND 30 LIMIT 4,1);
			SET idSextoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 25 AND 30 LIMIT 5,1);
		ELSEIF idDelGrupo=7 THEN
			SET idPrimerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 31 AND 36 LIMIT 0,1);
			SET idSegundoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 31 AND 36 LIMIT 1,1);
			SET idTercerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 31 AND 36 LIMIT 2,1);
			SET idCuartoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 31 AND 36 LIMIT 3,1);
			SET idQuintoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 31 AND 36 LIMIT 4,1);
			SET idSextoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 31 AND 36 LIMIT 5,1);
		ELSEIF idDelGrupo=8 THEN
			SET idPrimerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 37 AND 42 LIMIT 0,1);
			SET idSegundoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 37 AND 42 LIMIT 1,1);
			SET idTercerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 37 AND 42 LIMIT 2,1);
			SET idCuartoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 37 AND 42 LIMIT 3,1);
			SET idQuintoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 37 AND 42 LIMIT 4,1);
			SET idSextoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 37 AND 42 LIMIT 5,1);
		ELSEIF idDelGrupo=9 THEN
			SET idPrimerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 43 AND 48 LIMIT 0,1);
			SET idSegundoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 43 AND 48 LIMIT 1,1);
			SET idTercerPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 43 AND 48 LIMIT 2,1);
			SET idCuartoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 43 AND 48 LIMIT 3,1);
			SET idQuintoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 43 AND 48 LIMIT 4,1);
			SET idSextoPartidoDelGrupo=(SELECT id FROM partido WHERE id BETWEEN 43 AND 48 LIMIT 5,1);
		END IF;
        
        SET cont=0;
        WHILE cont<6 DO
			SET cont = (cont +1);        
		   CASE  
			   WHEN cont = 1 THEN 
					SET idVisita=(SELECT equipo_visita_fk FROM partido WHERE id=idPrimerPartidoDelGrupo);
					SET idLocal=(SELECT equipo_local_fk FROM partido WHERE id=idPrimerPartidoDelGrupo);
					SET equipoVisita=(SELECT id FROM equipo WHERE id=idVisita);
					SET equipoLocal=(SELECT id FROM equipo WHERE id=idLocal);
					SET nomV=(SELECT nombre FROM equipo WHERE id=equipoVisita);
					SET insVisita=(SELECT insignia FROM equipo WHERE id=equipoVisita);
					SET nomL=(SELECT nombre FROM equipo WHERE id=equipoLocal);
					SET insLocal=(SELECT insignia FROM equipo WHERE id=equipoLocal);
					INSERT INTO tblVS VALUES (NULL,nomV, insVisita, nomL, insLocal);                    
			   WHEN cont = 2 THEN
					SET idVisita=(SELECT equipo_visita_fk FROM partido WHERE id=idSegundoPartidoDelGrupo);
					SET idLocal=(SELECT equipo_local_fk FROM partido WHERE id=idSegundoPartidoDelGrupo);
                    SET equipoVisita=(SELECT id FROM equipo WHERE id=idVisita);
					SET equipoLocal=(SELECT id FROM equipo WHERE id=idLocal);
					SET nomV=(SELECT nombre FROM equipo WHERE id=equipoVisita);
					SET insVisita=(SELECT insignia FROM equipo WHERE id=equipoVisita);
					SET nomL=(SELECT nombre FROM equipo WHERE id=equipoLocal);
					SET insLocal=(SELECT insignia FROM equipo WHERE id=equipoLocal);
					INSERT INTO tblVS VALUES (NULL,nomV, insVisita, nomL, insLocal); 
			   WHEN cont = 3 THEN 
					SET idVisita=(SELECT equipo_visita_fk FROM partido WHERE id=idTercerPartidoDelGrupo);
					SET idLocal=(SELECT equipo_local_fk FROM partido WHERE id=idTercerPartidoDelGrupo);
                    SET equipoVisita=(SELECT id FROM equipo WHERE id=idVisita);
					SET equipoLocal=(SELECT id FROM equipo WHERE id=idLocal);
					SET nomV=(SELECT nombre FROM equipo WHERE id=equipoVisita);
					SET insVisita=(SELECT insignia FROM equipo WHERE id=equipoVisita);
					SET nomL=(SELECT nombre FROM equipo WHERE id=equipoLocal);
					SET insLocal=(SELECT insignia FROM equipo WHERE id=equipoLocal);
					INSERT INTO tblVS VALUES (NULL,nomV, insVisita, nomL, insLocal); 
			   WHEN cont = 4 THEN
					SET idVisita=(SELECT equipo_visita_fk FROM partido WHERE id=idCuartoPartidoDelGrupo);
					SET idLocal=(SELECT equipo_local_fk FROM partido WHERE id=idCuartoPartidoDelGrupo);
                    SET equipoVisita=(SELECT id FROM equipo WHERE id=idVisita);
					SET equipoLocal=(SELECT id FROM equipo WHERE id=idLocal);
					SET nomV=(SELECT nombre FROM equipo WHERE id=equipoVisita);
					SET insVisita=(SELECT insignia FROM equipo WHERE id=equipoVisita);
					SET nomL=(SELECT nombre FROM equipo WHERE id=equipoLocal);
					SET insLocal=(SELECT insignia FROM equipo WHERE id=equipoLocal);
					INSERT INTO tblVS VALUES (NULL,nomV, insVisita, nomL, insLocal); 
			   WHEN cont = 5 THEN 
					SET idVisita=(SELECT equipo_visita_fk FROM partido WHERE id=idQuintoPartidoDelGrupo);
					SET idLocal=(SELECT equipo_local_fk FROM partido WHERE id=idQuintoPartidoDelGrupo);
                    SET equipoVisita=(SELECT id FROM equipo WHERE id=idVisita);
					SET equipoLocal=(SELECT id FROM equipo WHERE id=idLocal);
					SET nomV=(SELECT nombre FROM equipo WHERE id=equipoVisita);
					SET insVisita=(SELECT insignia FROM equipo WHERE id=equipoVisita);
					SET nomL=(SELECT nombre FROM equipo WHERE id=equipoLocal);
					SET insLocal=(SELECT insignia FROM equipo WHERE id=equipoLocal);
					INSERT INTO tblVS VALUES (NULL,nomV, insVisita, nomL, insLocal); 
			   WHEN cont = 6 THEN
					SET idVisita=(SELECT equipo_visita_fk FROM partido WHERE id=idSextoPartidoDelGrupo);
					SET idLocal=(SELECT equipo_local_fk FROM partido WHERE id=idSextoPartidoDelGrupo);
                    SET equipoVisita=(SELECT id FROM equipo WHERE id=idVisita);
					SET equipoLocal=(SELECT id FROM equipo WHERE id=idLocal);
					SET nomV=(SELECT nombre FROM equipo WHERE id=equipoVisita);
					SET insVisita=(SELECT insignia FROM equipo WHERE id=equipoVisita);
					SET nomL=(SELECT nombre FROM equipo WHERE id=equipoLocal);
					SET insLocal=(SELECT insignia FROM equipo WHERE id=equipoLocal);
					INSERT INTO tblVS VALUES (NULL,nomV, insVisita, nomL, insLocal); 
			
			END CASE;
                        
            
        
        END WHILE;
   
        SELECT * FROM tblVS;
        DROP TABLE tblVS;
        
	END //
        		

DELIMITER ;

CALL mostrarVSDeUnGrupo(2);


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





