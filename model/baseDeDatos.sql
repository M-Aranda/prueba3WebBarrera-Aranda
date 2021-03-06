CREATE DATABASE mundial2018;-- DROP DATABASE mundial2018

USE mundial2018;

CREATE TABLE grupo(
    id INT AUTO_INCREMENT,
    nombre_grupo VARCHAR (45),
    PRIMARY KEY(id)

    
);

INSERT INTO grupo VALUES (NULL,'No Grupo'),(NULL,'Grupo A'),(NULL,'Grupo B'),(NULL,'Grupo C'),(NULL,'Grupo D'),(NULL,'Grupo E'),(NULL,'Grupo F'),(NULL,'Grupo G'),(NULL,'Grupo H');
-- DELETE FROM partido WHERE tipo_partido_id = 5;

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

-- SELECT e.id,e.nombre,e.insignia FROM equipo e WHERE nombre = (SELECT ganador FROM partido WHERE tipo_partido_id = 5 LIMIT 0,1)

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
);-- SELECT * FROM equipo_visita

CREATE TABLE equipo_local(
	id INT AUTO_INCREMENT,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES equipo (id),
    PRIMARY KEY(id)
);-- SELECT * FROM equipo_local
-- SELECT * FROM equipo WHERE id = 1

CREATE TABLE partido(
    id INT AUTO_INCREMENT,
    fecha DATE,
	equipo_visita_fk INT,
	equipo_local_fk INT,
    tipo_partido_id INT,
    ganador VARCHAR (20),
    FOREIGN KEY (equipo_visita_fk) REFERENCES equipo_visita (id),
    FOREIGN KEY (equipo_local_fk) REFERENCES equipo_local (id),
    FOREIGN KEY (tipo_partido_id) REFERENCES tipo_partido (id),
    PRIMARY KEY(id)
);

CREATE VIEW octavos_de_final AS -- DROP VIEW octavos_de_final
SELECT p.id,
(SELECT nombre FROM equipo WHERE id = p.equipo_visita_fk),
(SELECT insignia FROM equipo WHERE id = p.equipo_visita_fk),
(SELECT nombre FROM equipo WHERE id = p.equipo_local_fk),
(SELECT insignia FROM equipo WHERE id = p.equipo_local_fk),
tipo_partido_id,
p.equipo_local_fk,
p.equipo_visita_fk
FROM partido p WHERE p.tipo_partido_id = 2 ; -- SELECT * FROM octavos_de_final

CREATE VIEW cuartos_de_final AS -- DROP VIEW octavos_de_final
SELECT p.id,(SELECT nombre FROM equipo WHERE id = p.equipo_visita_fk),
(SELECT insignia FROM equipo WHERE id = p.equipo_visita_fk),
(SELECT nombre FROM equipo WHERE id = p.equipo_local_fk),
(SELECT insignia FROM equipo WHERE id = p.equipo_local_fk),
tipo_partido_id,
p.equipo_local_fk,
p.equipo_visita_fk
FROM partido p WHERE p.tipo_partido_id = 3 ;

CREATE VIEW semi_final AS -- DROP VIEW octavos_de_final

SELECT p.id,(SELECT nombre FROM equipo WHERE id = p.equipo_visita_fk),
(SELECT insignia FROM equipo WHERE id = p.equipo_visita_fk),
(SELECT nombre FROM equipo WHERE id = p.equipo_local_fk),
(SELECT insignia FROM equipo WHERE id = p.equipo_local_fk),
tipo_partido_id,
p.equipo_local_fk,
p.equipo_visita_fk
FROM partido p WHERE p.tipo_partido_id = 4 ;

CREATE VIEW final AS -- DROP VIEW octavos_de_final

SELECT p.id,(SELECT nombre FROM equipo WHERE id = p.equipo_visita_fk),
(SELECT insignia FROM equipo WHERE id = p.equipo_visita_fk),
(SELECT nombre FROM equipo WHERE id = p.equipo_local_fk),
(SELECT insignia FROM equipo WHERE id = p.equipo_local_fk),
tipo_partido_id,
p.equipo_local_fk,
p.equipo_visita_fk
FROM partido p WHERE p.tipo_partido_id = 5 ;

DELIMITER $$
CREATE PROCEDURE eliminacion_directa (goles_local INT,goles_visita INT, id_partido INT) -- DROP Procedure eliminacion_directa
BEGIN

	DECLARE vencedor VARCHAR (20);
    DECLARE id_aux INT;
    
    IF( goles_local > goles_visita ) THEN
	 SET vencedor = (SELECT nombre from equipo WHERE id = (SELECT equipo_visita_fk FROM partido WHERE id = id_partido));
     SET id_aux = (SELECT equipo_visita_fk FROM partido WHERE id = id_partido);
	ELSE
     SET vencedor = (SELECT nombre from equipo WHERE id = (SELECT equipo_local_fk FROM partido WHERE id = id_partido));
     SET id_aux = (SELECT equipo_local_fk FROM partido WHERE id = id_partido);
	END IF;
    
    UPDATE partido SET ganador = vencedor WHERE id = id_partido;
    
    #RETURN id;
   
 END$$
DELIMITER ;

/*

CREATE TABLE tipoResultado(
    id INT AUTO_INCREMENT,
    nombre VARCHAR (30),
    PRIMARY KEY(id)

);SELECT * FROM octavos_de_final

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

*/
DELIMITER //
CREATE FUNCTION determinarQuienAvanza (idPrimerEquipo INT, idSegundoEquipo INT, fase INT) RETURNS INT-- DROP FUNCTION determinarQuienAvanza
	BEGIN
		DECLARE puntajeEquipo1 INT;
        DECLARE puntajeEquipo2 INT;
		DECLARE difGolesEquipo1 INT;
        DECLARE difGolesEquipo2 INT;
		DECLARE golesMarcadosEquipo1 INT;
        DECLARE golesMarcadosEquipo2 INT;
        DECLARE idEquipo1 INT;
        DECLARE idEquipo2 INT;
        DECLARE idGanador INT;
        DECLARE numeroRandom INT;
        DECLARE id_partido INT;-- SELECT * FROM partido
			-- (SELECT id FROM partido WHERE ((equipo_local_fk = 12) OR (equipo_visita_fk = idSegundoEquipo)) AND tipo_partido_id = fase)
        
        
		SET idEquipo1=(SELECT id FROM equipo WHERE id=idPrimerEquipo);
		SET idEquipo2=(SELECT id FROM equipo WHERE id=idSegundoEquipo);  
		SET puntajeEquipo1=(SELECT puntaje FROM equipo WHERE id=idEquipo1);
		SET puntajeEquipo2=(SELECT puntaje FROM equipo WHERE id=idEquipo2);
		SET difGolesEquipo1=(SELECT diferenciaDeGoles FROM equipo WHERE id=idEquipo1);
		SET difGolesEquipo2=(SELECT diferenciaDeGoles FROM equipo WHERE id=idEquipo2);
		SET golesMarcadosEquipo1=(SELECT nGolesAFavor FROM equipo WHERE id=idEquipo1);
		SET golesMarcadosEquipo2=(SELECT nGolesAFavor FROM equipo WHERE id=idEquipo2);
        
        IF fase=1 THEN
        
			IF puntajeEquipo1>puntajeEquipo2 THEN
				SET idGanador=idEquipo1;
			ELSEIF puntajeEquipo1<puntajeEquipo2 THEN
				SET idGanador=idEquipo2;
			ELSEIF puntajeEquipo1=puntajeEquipo2 THEN
				IF difGolesEquipo1>difGolesEquipo2 THEN
					SET idGanador=idEquipo1;
				ELSEIF difGolesEquipo1<difGolesEquipo2 THEN
					SET idGanador=idEquipo2;
				ELSEIF difGolesEquipo1=difGolesEquipo2 THEN
					IF golesMarcadosEquipo1>golesMarcadosEquipo2 THEN
						SET idGanador=idEquipo1;
					ELSEIF golesMarcadosEquipo1<golesMarcadosEquipo2 THEN
						SET idGanador=idEquipo2;
					ELSEIF golesMarcadosEquipo1=golesMarcadosEquipo2 THEN
						SET numeroRandom=FLOOR( 1 + RAND( ) *2); -- Crea un numero random del 1 al 2
							IF numeroRandom=1 THEN
								SET idGanador=idEquipo1;
							ELSEIF numeroRandom=2 THEN
								SET idGanador=idEquipo2;		
							END IF;	
					END IF;        
            END IF;		
			END IF;
		ELSEIF fase>1 THEN
			SET id_partido = (SELECT id FROM partido WHERE ((equipo_local_fk = idPrimerEquipo) OR (idPrimerEquipo = equipo_visita_fk)) AND tipo_partido_id = fase);
			SET idGanador = (SELECT e.id FROM equipo e WHERE e.nombre = (SELECT ganador FROM partido WHERE id = id_partido));
		END IF;
        
       RETURN idGanador;
    END //
DELIMITER ;-- SELECT * FROM partido WHERE tipo_partido_id = 2
-- (SELECT id FROM partido WHERE ((equipo_local_fk = 18) OR (1 = equipo_visita_fk)) AND tipo_partido_id = 3)
-- SELECT e.id FROM equipo e WHERE e.nombre = (SELECT ganador FROM partido WHERE id = (SELECT id FROM partido WHERE ((equipo_local_fk = 18) OR (1 = equipo_visita_fk)) AND tipo_partido_id = 3))

DELIMITER $$
CREATE PROCEDURE generar_octavos ()-- DROP PROCEDURE generar_octavos;  
BEGIN
	DECLARE cont INT;
    DECLARE equipo1 INT;
    DECLARE equipo2 INT;
    DECLARE equipo3 INT;
    DECLARE equipo4 INT;
    DECLARE candidato INT;
    DECLARE primero INT;
    DECLARE segundo INT;
    
    SET cont = 0;
    
    CREATE TABLE IF NOT EXISTS ganadores_octavos(
		id INT AUTO_INCREMENT DEFAULT NULL,
        id_equipo1 INT,
        id_equipo2 INT,
        PRIMARY KEY(id)
    );-- DROP TABLE ganadores_octavos;
    
    WHILE cont < 8 DO   
		SET cont = (cont +1);        
       case  
           when cont <= 1 then BEGIN
			SET equipo1 = (SELECT id FROM equipo WHERE grupo_id = 2 LIMIT 0,1);
			SET equipo2 = (SELECT id FROM equipo WHERE grupo_id = 2 LIMIT 1,1);
			SET equipo3 = (SELECT id FROM equipo WHERE grupo_id = 2 LIMIT 2,1);
			SET equipo4 = (SELECT id FROM equipo WHERE grupo_id = 2 LIMIT 3,1);
            END;
           when cont <= 2 then BEGIN
            SET equipo1 = (SELECT id FROM equipo WHERE grupo_id = 3 LIMIT 0,1);
			SET equipo2 = (SELECT id FROM equipo WHERE grupo_id = 3 LIMIT 1,1);
			SET equipo3 = (SELECT id FROM equipo WHERE grupo_id = 3 LIMIT 2,1);
			SET equipo4 = (SELECT id FROM equipo WHERE grupo_id = 3 LIMIT 3,1);
            END;
           when cont <= 3 then BEGIN
            SET equipo1 = (SELECT id FROM equipo WHERE grupo_id = 4 LIMIT 0,1);
			SET equipo2 = (SELECT id FROM equipo WHERE grupo_id = 4 LIMIT 1,1);
			SET equipo3 = (SELECT id FROM equipo WHERE grupo_id = 4 LIMIT 2,1);
			SET equipo4 = (SELECT id FROM equipo WHERE grupo_id = 4 LIMIT 3,1);
            END;
           when cont <= 4 then BEGIN
           SET equipo1 = (SELECT id FROM equipo WHERE grupo_id = 5 LIMIT 0,1);
			SET equipo2 = (SELECT id FROM equipo WHERE grupo_id = 5 LIMIT 1,1);
			SET equipo3 = (SELECT id FROM equipo WHERE grupo_id = 5 LIMIT 2,1);
			SET equipo4 = (SELECT id FROM equipo WHERE grupo_id = 5 LIMIT 3,1);
            END;
           when cont <= 5 then BEGIN
            SET equipo1 = (SELECT id FROM equipo WHERE grupo_id = 6 LIMIT 0,1);
			SET equipo2 = (SELECT id FROM equipo WHERE grupo_id = 6 LIMIT 1,1);
			SET equipo3 = (SELECT id FROM equipo WHERE grupo_id = 6 LIMIT 2,1);
			SET equipo4 = (SELECT id FROM equipo WHERE grupo_id = 6 LIMIT 3,1);
            END;
           when cont <= 6 then BEGIN
            SET equipo1 = (SELECT id FROM equipo WHERE grupo_id = 7 LIMIT 0,1);
			SET equipo2 = (SELECT id FROM equipo WHERE grupo_id = 7 LIMIT 1,1);
			SET equipo3 = (SELECT id FROM equipo WHERE grupo_id = 7 LIMIT 2,1);
			SET equipo4 = (SELECT id FROM equipo WHERE grupo_id = 7 LIMIT 3,1);
            END;
           when cont <= 7 then BEGIN
            SET equipo1 = (SELECT id FROM equipo WHERE grupo_id = 8 LIMIT 0,1);
			SET equipo2 = (SELECT id FROM equipo WHERE grupo_id = 8 LIMIT 1,1);
			SET equipo3 = (SELECT id FROM equipo WHERE grupo_id = 8 LIMIT 2,1);
			SET equipo4 = (SELECT id FROM equipo WHERE grupo_id = 8 LIMIT 3,1);
            END;
           when cont <= 8 then BEGIN
            SET equipo1 = (SELECT id FROM equipo WHERE grupo_id = 9 LIMIT 0,1);
			SET equipo2 = (SELECT id FROM equipo WHERE grupo_id = 9 LIMIT 1,1);
			SET equipo3 = (SELECT id FROM equipo WHERE grupo_id = 9 LIMIT 2,1);
			SET equipo4 = (SELECT id FROM equipo WHERE grupo_id = 9 LIMIT 3,1);
            END;
        end case;
        
        SET candidato = (SELECT determinarQuienAvanza (equipo1, equipo2,1));
        
        IF( candidato != (SELECT determinarQuienAvanza (candidato, equipo3,1))) THEN BEGIN
			SET segundo = candidato;
            SET candidato = equipo3;
        END;
        END IF;  
        
        IF( candidato != (SELECT determinarQuienAvanza (candidato, equipo4,1))) THEN 
			SET segundo = candidato;
			SET primero = equipo4;
        ELSE 
			SET primero = candidato;
            SET segundo = equipo4;
        END IF;        
        
        
        SET candidato =  (SELECT determinarQuienAvanza (segundo, equipo1,1));
        
        IF( candidato != primero ) THEN BEGIN
            SET segundo = candidato;
        END;
        END IF;  
        
        SET candidato =  (SELECT determinarQuienAvanza (segundo, equipo2,1));
        
        IF( candidato != primero ) THEN BEGIN
            SET segundo = candidato;
        END;
        END IF;  
        
        SET candidato =  (SELECT determinarQuienAvanza (segundo, equipo3,1));
        
        IF( candidato != primero ) THEN BEGIN
            SET segundo = candidato;
        END;
        END IF;  
        
        SET candidato =  (SELECT determinarQuienAvanza (segundo, equipo4,1));
        
        IF( candidato != primero ) THEN BEGIN
            SET segundo = candidato;
        END;
        END IF;  
        
         INSERT INTO ganadores_octavos(id_equipo1,id_equipo2) VALUES (primero,segundo);
        
    END WHILE;
    
	INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo2 FROM ganadores_octavos WHERE id = 2),(SELECT id_equipo1 FROM ganadores_octavos WHERE id = 1),2,'POR DEFINIR');    
    INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo2 FROM ganadores_octavos WHERE id = 4),(SELECT id_equipo1 FROM ganadores_octavos WHERE id = 3),2,'POR DEFINIR');    
    INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo2 FROM ganadores_octavos WHERE id = 6),(SELECT id_equipo1 FROM ganadores_octavos WHERE id = 5),2,'POR DEFINIR');
    INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo2 FROM ganadores_octavos WHERE id = 8),(SELECT id_equipo1 FROM ganadores_octavos WHERE id = 7),2,'POR DEFINIR');
    INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo2 FROM ganadores_octavos WHERE id = 1),(SELECT id_equipo1 FROM ganadores_octavos WHERE id = 2),2,'POR DEFINIR');
    INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo2 FROM ganadores_octavos WHERE id = 3),(SELECT id_equipo1 FROM ganadores_octavos WHERE id = 4),2,'POR DEFINIR');
    INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo2 FROM ganadores_octavos WHERE id = 5),(SELECT id_equipo1 FROM ganadores_octavos WHERE id = 6),2,'POR DEFINIR');
    INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo2 FROM ganadores_octavos WHERE id = 7),(SELECT id_equipo1 FROM ganadores_octavos WHERE id = 8),2,'POR DEFINIR');
    
    
    TRUNCATE ganadores_octavos;-- SELECT * FROM partido WHERE tipo_partido_id=3
								-- DELETE FROM partido WHERE tipo_partido_id > 1
    
 END$$
DELIMITER ;

-- CALL generar_octavos() CALL generar_cuartos()

DELIMITER $$
CREATE PROCEDURE generar_cuartos ()-- DROP PROCEDURE generar_cuartos 
BEGIN
	DECLARE equipo_aux INT;
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_sort(
		id INT AUTO_INCREMENT DEFAULT NULL,
        id_equipo INT,
        PRIMARY KEY(id)
    );
    
    INSERT INTO tmp_sort(id_equipo) SELECT determinarQuienAvanza (equipo_visita_fk, equipo_local_fk,2) FROM octavos_de_final ORDER BY id ASC;
    
    SET equipo_aux = (SELECT id_equipo FROM tmp_sort WHERE id = 1);
	INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo FROM tmp_sort WHERE id = 2),equipo_aux,3,'POR DEFINIR');
    SET equipo_aux = (SELECT id_equipo FROM tmp_sort WHERE id = 3);
	INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo FROM tmp_sort WHERE id = 4),equipo_aux,3,'POR DEFINIR');
    SET equipo_aux = (SELECT id_equipo FROM tmp_sort WHERE id = 5);
	INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo FROM tmp_sort WHERE id = 6),equipo_aux,3,'POR DEFINIR');
    SET equipo_aux = (SELECT id_equipo FROM tmp_sort WHERE id = 7);
	INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo FROM tmp_sort WHERE id = 8),equipo_aux,3,'POR DEFINIR');
    
    TRUNCATE tmp_sort;
   
 END$$
DELIMITER ;-- CALL generar_cuartos SELECT * FROM partido where id = 3

DELIMITER $$
CREATE PROCEDURE generar_semi ()-- DROP PROCEDURE generar_semi
BEGIN
    DECLARE equipo_aux INT;
    
	CREATE TABLE IF NOT EXISTS ganadores(
		id INT AUTO_INCREMENT DEFAULT NULL,
        id_equipo INT,
        PRIMARY KEY(id)
    );
    
    INSERT INTO ganadores(id_equipo) SELECT determinarQuienAvanza (equipo_visita_fk, equipo_local_fk,3) FROM cuartos_de_final ORDER BY id ASC;
    
    SET equipo_aux = (SELECT id_equipo FROM ganadores WHERE id = 1);
	INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo FROM ganadores WHERE id = 2),equipo_aux,4,'POR DEFINIR');
    SET equipo_aux = (SELECT id_equipo FROM ganadores WHERE id = 3);
	INSERT INTO partido VALUES (NULL,CURDATE(),(SELECT id_equipo FROM ganadores WHERE id = 4),equipo_aux,4,'POR DEFINIR');
    
	TRUNCATE ganadores;
   
 END$$
DELIMITER ;-- CALL generar_semi
-- SELECT * FROM partido where tipo_partido_id = 4
-- SELECT * FROM semi_final

DELIMITER $$
CREATE PROCEDURE generar_final ()-- DROP PROCEDURE generar_final
BEGIN
    DECLARE finalista1 INT;
    DECLARE finalista2 INT;
    DECLARE tercero1 INT;
    DECLARE tercero2 INT;
    
    SET finalista1 = (SELECT determinarQuienAvanza(equipo_visita_fk, equipo_local_fk,tipo_partido_id) FROM semi_final LIMIT 0,1);
    
    IF(finalista1 != (SELECT equipo_visita_fk FROM semi_final LIMIT 0,1)) THEN
		SET tercero1 = (SELECT equipo_visita_fk FROM semi_final LIMIT 0,1);
    ELSE
		SET tercero1 = (SELECT equipo_local_fk FROM semi_final LIMIT 0,1);
    END IF;
    
	SET finalista2 = (SELECT determinarQuienAvanza(equipo_visita_fk, equipo_local_fk,tipo_partido_id) FROM semi_final LIMIT 1,1);
    
    IF(finalista2 != (SELECT equipo_visita_fk FROM semi_final LIMIT 1,1)) THEN
		SET tercero2 = (SELECT equipo_visita_fk FROM semi_final LIMIT 1,1);
    ELSE
		SET tercero2 = (SELECT equipo_local_fk FROM semi_final LIMIT 1,1);
    END IF;
    
    
	INSERT INTO partido VALUES (NULL,CURDATE(),finalista1,finalista2,5,'POR DEFINIR');
    INSERT INTO partido VALUES (NULL,CURDATE(),tercero1,tercero2,5,'POR DEFINIR');
   
 END$$
DELIMITER ;-- SELECT * From semi_final limit 0,1
-- SELECT * FROM partido WHERE tipo_partido_id = 4
-- DELETE FROM partido WHERE tipo_partido_id = 4


DELIMITER $$
CREATE PROCEDURE sortear_equipos ()-- DROP PROCEDURE sortear_equipos
BEGIN
	DECLARE cont INT;
    DECLARE grupo_fk INT;
    SET cont = 0;
    
	CREATE TABLE IF NOT EXISTS tmp_sort(
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
    CALL faseDeGruposCrearPartidosParaUnGrupo(2);
	CALL faseDeGruposCrearPartidosParaUnGrupo(3);
	CALL faseDeGruposCrearPartidosParaUnGrupo(4);
	CALL faseDeGruposCrearPartidosParaUnGrupo(5);
	CALL faseDeGruposCrearPartidosParaUnGrupo(6);
	CALL faseDeGruposCrearPartidosParaUnGrupo(7);
	CALL faseDeGruposCrearPartidosParaUnGrupo(8);
	CALL faseDeGruposCrearPartidosParaUnGrupo(9);
    
 END$$
DELIMITER ;



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
    INSERT INTO partido VALUES(NULL,'2018-07-03',primeraVisita,cuartoLocal,1,'No');
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-03',segundaVisita,tercerLocal,1,'No');
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-04',primeraVisita,tercerLocal,1,'No');
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-04',segundaVisita,cuartoLocal,1,'No');
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-05',segundaVisita,primerLocal,1,'No');
    SET FOREIGN_KEY_CHECKS=1;
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO partido VALUES(NULL,'2018-07-05',terceraVisita,cuartoLocal,1,'No');
    SET FOREIGN_KEY_CHECKS=1;
    
    
    
   /* DROP TABLE tblGruposTMP;*/
	END$$
   
   
    
DELIMITER ;

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
        
        
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tblVS(
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


DELIMITER //

CREATE PROCEDURE actualizarPuntajeYGanadorDePartido (idDelPartido INT, golesVisita INT, golesLocal INT) -- DROP PROCEDURE actualizarPuntajeYGanadorDePartido;
	BEGIN
		DECLARE idVisita INT;
        DECLARE idLocal INT;
        DECLARE nombreGanador VARCHAR (20);
        
        DECLARE puntajeVisita INT;
        DECLARE putajeLocal INT;
        
        SET idVisita=(SELECT equipo.id FROM equipo, equipo_visita, partido WHERE 
			partido.equipo_visita_fk=equipo_visita.id AND equipo_visita.id=equipo.id AND partido.id=idDelPartido);
            
        SET idLocal=(SELECT equipo.id FROM equipo, equipo_local, partido WHERE 
			partido.equipo_local_fk=equipo_local.id AND equipo_local.id=equipo.id AND partido.id=idDelPartido);    
        
        SET puntajeVisita=(SELECT puntaje FROM equipo WHERE id=idVisita);
        SET putajeLocal=(SELECT puntaje FROM equipo WHERE id=idLocal);
        
        
        SET	nombreGanador='Empate';
        
        
		
        IF golesVisita=golesLocal THEN
			UPDATE partido SET ganador=nombreGanador WHERE id=idDelPartido;
			UPDATE equipo SET puntaje=puntajeVisita+1 WHERE id=idVisita;
			UPDATE equipo SET puntaje=putajeLocal+1 WHERE id=idLocal;
		ELSEIF golesVisita>golesLocal THEN
			SET nombreGanador=(SELECT nombre FROM equipo WHERE id=idVisita);
			UPDATE partido SET ganador=nombreGanador WHERE id=idDelPartido;
			UPDATE equipo SET puntaje=puntajeVisita+3 WHERE id=idVisita;
		ELSEIF golesVisita<golesLocal THEN
			SET nombreGanador=(SELECT nombre FROM equipo WHERE id=idLocal);
			UPDATE partido SET ganador=nombreGanador WHERE id=idDelPartido;
			UPDATE equipo SET puntaje=putajeLocal+3 WHERE id=idLocal;
		END IF;
        			
		
    END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE actualizarDiferenciaDeGoles (idDelEquipo INT) -- DROP PROCEDURE actualizarDiferenciaDeGoles;
	BEGIN
		DECLARE golesAFavor INT;
        DECLARE golesEnContra INT;

			SET golesAFavor=(SELECT nGolesAFavor FROM equipo WHERE id = idDelEquipo);
			SET golesEnContra=(SELECT nGolesEnContra FROM equipo WHERE id = idDelEquipo);
			
			UPDATE equipo SET diferenciaDeGoles=(golesAFavor-golesEnContra) WHERE id=idDelEquipo;

            
    END //

DELIMITER ;



-- Este procedimiento actualiza los goles del equipo visitante
DELIMITER //
CREATE PROCEDURE actualizarGolesEquipoVisita(idPartido INT, golesAFavor INT, golesEnContra INT) -- DROP PROCEDURE actualizarGolesEquipoVisita;
	BEGIN

    DECLARE golesF INT;
    DECLARE golesC INT;
    DECLARE idEquipo INT;    
    DECLARE idDELPartido INT;
    DECLARE gF INT;
    DECLARE gC INT;
    
    SET idDELPartido=idPartido;
    SET gF=golesAFavor;
    SET gC=golesEnContra;
    
    SET idEquipo=(SELECT equipo.id FROM equipo, equipo_visita, partido WHERE 
    partido.equipo_visita_fk=equipo_visita.id AND equipo_visita.id=equipo.id AND partido.id=idPartido);
    
    
    
    SET golesF=(SELECT nGolesAFavor FROM equipo WHERE id=idEquipo)+golesAFavor; 
    SET golesC=(SELECT nGolesEnContra FROM equipo WHERE id=idEquipo)+golesEnContra; 
    
    UPDATE equipo SET nGolesAFavor=golesF, nGolesEnContra=golesC
    WHERE id=idEquipo;
    
    CALL actualizarDiferenciaDeGoles(idEquipo);
    CALL actualizarPuntajeYGanadorDePartido(idDELPartido,gF,gC);

    
    END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE actualizarGolesEquipoLocal(idPartido INT, golesAFavor INT, golesEnContra INT) -- DROP PROCEDURE actualizarGolesEquipoLocal;
	BEGIN

    DECLARE golesF INT;
    DECLARE golesC INT;
    DECLARE idEquipo INT;
    
	DECLARE idDELPartido INT;
    DECLARE gF INT;
    DECLARE gC INT;
    
    SET idDELPartido=idPartido;
    SET gF=golesAFavor;
    SET gC=golesEnContra;
    
    
    SET idEquipo=(SELECT equipo.id FROM equipo, equipo_local, partido WHERE 
    partido.equipo_local_fk=equipo_local.id AND equipo_local.id=equipo.id AND partido.id=idPartido);
    
    SET golesF=(SELECT nGolesAFavor FROM equipo WHERE id=idEquipo)+golesAFavor; 
    SET golesC=(SELECT nGolesEnContra FROM equipo WHERE id=idEquipo)+golesEnContra; 
    
    UPDATE equipo SET nGolesAFavor=golesF, nGolesEnContra=golesC
    WHERE id=idEquipo;
    
	CALL actualizarDiferenciaDeGoles(idEquipo);
 -- CALL actualizarPuntajeYGanadorDePartido(idDELPartido,gF,gC);

		
    END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE determinarQuienAvanzaAOctavos(idGrupo INT) -- Tengo dudas de como determinar esto...
	BEGIN
		DECLARE idEquipo1 INT;
        DECLARE idEquipo2 INT;
        DECLARE idEquipo3 INT;
        DECLARE idEquipo4 INT;
        
        DECLARE puntajeEquipo1 INT;
        DECLARE puntajeEquipo2 INT;
        DECLARE puntajeEquipo3 INT;
        DECLARE puntajeEquipo4 INT;
        
        DECLARE difGolesEquipo1 INT;
        DECLARE difGolesEquipo2 INT;
        DECLARE difGolesEquipo3 INT;
        DECLARE difGolesEquipo4 INT;
        
        DECLARE golesMarcadosEquipo1 INT;
        DECLARE golesMarcadosEquipo2 INT;
        DECLARE golesMarcadosEquipo3 INT;
        DECLARE golesMarcadosEquipo4 INT;
        
        SET idEquipo1=(SELECT id FROM equipo WHERE grupo_id=idGrupo LIMIT 0,1);
        SET idEquipo2=(SELECT id FROM equipo WHERE grupo_id=idGrupo LIMIT 1,1);
        SET idEquipo3=(SELECT id FROM equipo WHERE grupo_id=idGrupo LIMIT 2,1);
        SET idEquipo4=(SELECT id FROM equipo WHERE grupo_id=idGrupo LIMIT 3,1);
        
        SET puntajeEquipo1=(SELECT puntaje FROM equipo WHERE id=idEquipo1);
        SET puntajeEquipo2=(SELECT puntaje FROM equipo WHERE id=idEquipo2);
        SET puntajeEquipo3=(SELECT puntaje FROM equipo WHERE id=idEquipo3);
        SET puntajeEquipo4=(SELECT puntaje FROM equipo WHERE id=idEquipo4);
        
        SET difGolesEquipo1=(SELECT diferenciaDeGoles FROM equipo WHERE id=idEquipo1);
        SET difGolesEquipo2=(SELECT diferenciaDeGoles FROM equipo WHERE id=idEquipo2);
        SET difGolesEquipo3=(SELECT diferenciaDeGoles FROM equipo WHERE id=idEquipo3);
        SET difGolesEquipo4=(SELECT diferenciaDeGoles FROM equipo WHERE id=idEquipo4);
        
		SET golesMarcadosEquipo1=(SELECT nGolesAFavor FROM equipo WHERE id=idEquipo1);
        SET golesMarcadosEquipo2=(SELECT nGolesAFavor FROM equipo WHERE id=idEquipo2);
        SET golesMarcadosEquipo3=(SELECT nGolesAFavor FROM equipo WHERE id=idEquipo3);
        SET golesMarcadosEquipo4=(SELECT nGolesAFavor FROM equipo WHERE id=idEquipo4);
        
        
		
    END //
    
DELIMITER ;
    
/* 

CALL actualizarGolesEquipoVisita(3,1,2);
CALL actualizarGolesEquipoLocal(3,2,1);

SELECT * FROM partido;

SELECT * FROM equipo;


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





