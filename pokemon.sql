DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;


CREATE TABLE REGIONES(
COD_REG INT NOT NULL AUTO_INCREMENT,
NOMBRE VARCHAR(25),
NUM_CIUDADES VARCHAR(5),
NUM_PUEBLOS VARCHAR(5),
NUM_BOSQUES VARCHAR(5),
NUM_CUEVAS VARCHAR(5),
PRIMARY KEY(COD_REG)
);

CREATE TABLE POKEDEX(
COD_DEX INT NOT NULL AUTO_INCREMENT,
NOMBRE VARCHAR(25),
DESCRIPCION VARCHAR(500),
ALTURA FLOAT,
PESO FLOAT,
ENTORNO VARCHAR(50),
PRIMARY KEY(COD_DEX)
);

CREATE TABLE LIDERES_GIMNASIO(
COD_GIM INT NOT NULL AUTO_INCREMENT,
NOMBRE VARCHAR(25),
ESPECIALIDAD VARCHAR(25),
NIVEL VARCHAR(5),
PRIMARY KEY(COD_GIM)
);

CREATE TABLE ALTOS_MANDOS(
COD_AM INT NOT NULL AUTO_INCREMENT,
NOMBRE VARCHAR(25),
ESPECIALIDAD VARCHAR(25),
NIVEL VARCHAR(5),
PRIMARY KEY(COD_AM)
);

CREATE TABLE ENTRENADORES(
COD_ENT INT NOT NULL AUTO_INCREMENT,
COD_REG INT NOT NULL,
NOMBRE VARCHAR(25),
GENERO VARCHAR(10),
FICHA VARCHAR(250),
PRIMARY KEY(COD_ENT)
);

CREATE TABLE MOCHILAS(
COD_MO INT NOT NULL AUTO_INCREMENT,
COD_ENT INT NOT NULL,
OBJETOS_CLAVE VARCHAR(5),
POKEBALLS VARCHAR(5),
MEDICINAS VARCHAR(5),
BAYAS VARCHAR(5),
MAQUINAS VARCHAR(5),
PRIMARY KEY(COD_MO)
);

CREATE TABLE POKEMON(
COD_POKE INT NOT NULL AUTO_INCREMENT,
COD_ENT INT NOT NULL,
NOMBRE VARCHAR(25),
NIVEL VARCHAR(5),
TIPO VARCHAR(25),
NATURALEZA VARCHAR(25),
HABILIDAD VARCHAR(100),
PRIMARY KEY(COD_POKE)
);

CREATE TABLE TIPO(
COD_POKE INT NOT NULL AUTO_INCREMENT,
TIPO_POKEMON VARCHAR(25) NOT NULL,
PRIMARY KEY(COD_POKE)
);

CREATE TABLE EVOLUCIONES(
COD_EVO INT NOT NULL AUTO_INCREMENT,
COD_POKE INT NOT NULL,
MODO_EVO VARCHAR(25),
PRIMARY KEY(COD_EVO)
);

CREATE TABLE MODO_EVO(
COD_EVO INT NOT NULL AUTO_INCREMENT,
MODO_EVOLUCION VARCHAR(25) NOT NULL,
PRIMARY KEY(COD_EVO)
);

CREATE TABLE MEDALLAS(
COD_MED INT NOT NULL AUTO_INCREMENT,
COD_GIM INT NOT NULL,
NOMBRE VARCHAR(25),
GIMNASIO VARCHAR(25),
PRIMARY KEY(COD_MED)
);

CREATE TABLE REGISTRAN(
COD_POKE INT NOT NULL,
COD_DEX INT NOT NULL,
PRIMARY KEY(COD_POKE,COD_DEX)
);

CREATE TABLE RETAN(
COD_ENT INT NOT NULL,
COD_GIM INT NOT NULL,
PRIMARY KEY(COD_ENT,COD_GIM)
);

CREATE TABLE COMPITEN_CONTRA(
COD_ENT INT NOT NULL,
COD_AM INT NOT NULL,
PRIMARY KEY(COD_ENT,COD_AM)
);


ALTER TABLE ENTRENADORES
ADD CONSTRAINT FK1 FOREIGN KEY(COD_REG) REFERENCES REGIONES(COD_REG)
ON UPDATE CASCADE;

ALTER TABLE MOCHILAS
ADD CONSTRAINT FK2 FOREIGN KEY(COD_ENT) REFERENCES ENTRENADORES(COD_ENT)
ON UPDATE CASCADE;

ALTER TABLE POKEMON
ADD CONSTRAINT FK3 FOREIGN KEY(COD_ENT) REFERENCES ENTRENADORES(COD_ENT)
ON UPDATE CASCADE;

ALTER TABLE TIPO
ADD CONSTRAINT FK4 FOREIGN KEY(COD_POKE) REFERENCES POKEMON(COD_POKE)
ON UPDATE CASCADE; 

ALTER TABLE EVOLUCIONES
ADD CONSTRAINT FK5 FOREIGN KEY(COD_POKE) REFERENCES POKEMON(COD_POKE)
ON UPDATE CASCADE;

ALTER TABLE MODO_EVO
ADD CONSTRAINT FK6 FOREIGN KEY(COD_EVO) REFERENCES EVOLUCIONES(COD_EVO)
ON UPDATE CASCADE;

ALTER TABLE MEDALLAS
ADD CONSTRAINT FK7 FOREIGN KEY(COD_GIM) REFERENCES LIDERES_GIMNASIO(COD_GIM)
ON UPDATE CASCADE;

ALTER TABLE REGISTRAN
ADD CONSTRAINT FK8 FOREIGN KEY(COD_DEX) REFERENCES POKEDEX(COD_DEX)
ON UPDATE CASCADE,
ADD CONSTRAINT FK9 FOREIGN KEY(COD_POKE) REFERENCES POKEMON(COD_POKE)
ON UPDATE CASCADE;

ALTER TABLE RETAN
ADD CONSTRAINT FK10 FOREIGN KEY(COD_GIM) REFERENCES LIDERES_GIMNASIO(COD_GIM)
ON UPDATE CASCADE,
ADD CONSTRAINT FK11 FOREIGN KEY(COD_ENT) REFERENCES ENTRENADORES(COD_ENT)
ON UPDATE CASCADE;

ALTER TABLE COMPITEN_CONTRA
ADD CONSTRAINT FK12 FOREIGN KEY(COD_AM) REFERENCES ALTOS_MANDOS(COD_AM)
ON UPDATE CASCADE,
ADD CONSTRAINT FK13 FOREIGN KEY(COD_ENT) REFERENCES ENTRENADORES(COD_ENT)
ON UPDATE CASCADE;


INSERT INTO REGIONES VALUE(1, 'KANTO', '10', '20', '30', '40');
INSERT INTO REGIONES VALUE(2, 'JOHTO', '10', '20', '30', '40');
INSERT INTO REGIONES VALUE(3, 'HOENN', '10', '20', '30', '40');
INSERT INTO REGIONES VALUE(4, 'SHINNOH', '10', '20', '30', '40');
INSERT INTO REGIONES VALUE(5, 'TESELIA', '10', '20', '30', '40');

INSERT INTO POKEDEX VALUE(1, 'PIKACHU', 'POKEMON DE TIPO ELÉCTRICO', 1.50, 50, 'PRADO');
INSERT INTO POKEDEX VALUE(2, 'BULBASUR', 'POKEMON DE TIPO PLANTA', 1.60, 60, 'HIERBA');
INSERT INTO POKEDEX VALUE(3, 'CHARMANDER', 'POKEMON DE TIPO FUEGO', 1.70, 70, 'VOLCAN');
INSERT INTO POKEDEX VALUE(4, 'EVEE', 'POKEMON DE TIPO NORMAL', 1.80, 80, 'CIUDAD');
INSERT INTO POKEDEX VALUE(5, 'MEWTWO', 'POKEMON DE TIPO PSQUICO', 1.90, 90, 'CUEVA');

INSERT INTO LIDERES_GIMNASIO VALUE(1, 'GIOVANNI', 'TIERRA', '40-50');
INSERT INTO LIDERES_GIMNASIO VALUE(2, 'DÉBORA', 'DRAGÓN', '35-40');
INSERT INTO LIDERES_GIMNASIO VALUE(3, 'GALANO', 'AGUA', '40-45');
INSERT INTO LIDERES_GIMNASIO VALUE(4, 'LECTRO', 'ELÉCTRICO', '45-50');
INSERT INTO LIDERES_GIMNASIO VALUE(5, 'IRIS', 'DRAGÓN', '40-45');

INSERT INTO ALTOS_MANDOS VALUE(1, 'LANCE', 'DRAGÓN', '55-60');
INSERT INTO ALTOS_MANDOS VALUE(2, 'KAREN', 'SINIESTRO', '40-50');
INSERT INTO ALTOS_MANDOS VALUE(3, 'DRACÓN', 'DRAGÓN', '50-55');
INSERT INTO ALTOS_MANDOS VALUE(4, 'DELOS', 'PSÍQUICO', '55-65');
INSERT INTO ALTOS_MANDOS VALUE(5, 'CATLEYA','PSÍQUICO', '45-50');

INSERT INTO ENTRENADORES VALUE(1, 1, 'RED', 'CHICO', 'ENTRENADOR POKEMON DE LA REGIÓN DE KANTO');
INSERT INTO ENTRENADORES VALUE(2, 2, 'SILVER', 'CHICA', 'ENTRENADORA POKEMON DE LA REGIÓN DE JOHTO');
INSERT INTO ENTRENADORES VALUE(3, 3, 'MAXIMO', 'CHICO', 'ENTRENADOR POKEMON DE LA REGIÓN DE HOENN');
INSERT INTO ENTRENADORES VALUE(4, 4, 'DAWN', 'CHICA', 'ENTRENADORA POKEMON DE LA REGIÓN DE SHINNOH');
INSERT INTO ENTRENADORES VALUE(5, 5, 'MILLO', 'CHICO', 'ENTRENADOR POKEMON DE LA REGIÓN DE TESELIA');

INSERT INTO MOCHILAS VALUE(1, 1, '10', '20', '30', '40', '50');
INSERT INTO MOCHILAS VALUE(2, 2, '10', '20', '30', '40', '50');
INSERT INTO MOCHILAS VALUE(3, 3, '10', '20', '30', '40', '50');
INSERT INTO MOCHILAS VALUE(4, 4, '10', '20', '30', '40', '50');
INSERT INTO MOCHILAS VALUE(5, 5, '10', '20', '30', '40', '50');

INSERT INTO POKEMON VALUE(1, 1, 'PIKACHU', '50', 'ELÉCTRICO', 'AMABLE', 'PARÁLISIS');
INSERT INTO POKEMON VALUE(2, 2, 'BULBASUR', '60', 'PLANTA', 'URAÑA', 'ENVENENAR');
INSERT INTO POKEMON VALUE(3, 3, 'CHARMANDER', '70', 'FUEGO', 'FIRME', 'QUEMAR');
INSERT INTO POKEMON VALUE(4, 4, 'EVEE', '80', 'NORMAL', 'ROBUSTA', 'AMEDRENTAR');
INSERT INTO POKEMON VALUE(5, 5, 'MEWTWO', '90', 'PSÍQUICO', 'SERIA', 'PRESIÓN');

INSERT INTO TIPO VALUE(1, 'ELÉCTRICO');
INSERT INTO TIPO VALUE(2, 'PLANTA');
INSERT INTO TIPO VALUE(3, 'FUEGO');
INSERT INTO TIPO VALUE(4, 'NORMAL');
INSERT INTO TIPO VALUE(5, 'PSÍQUICO');

INSERT INTO EVOLUCIONES VALUE(1, 1, 'PIEDRA');
INSERT INTO EVOLUCIONES VALUE(2, 2, 'NIVEL');
INSERT INTO EVOLUCIONES VALUE(3, 3, 'NIVEL');
INSERT INTO EVOLUCIONES VALUE(4, 4, 'PIEDRA');
INSERT INTO EVOLUCIONES VALUE(5, 5, 'INTERCAMBIO');

INSERT INTO MODO_EVO VALUE(1, 'PIEDRA');
INSERT INTO MODO_EVO VALUE(2, 'NIVEL');
INSERT INTO MODO_EVO VALUE(3, 'NIVEL');
INSERT INTO MODO_EVO VALUE(4, 'PIEDRA');
INSERT INTO MODO_EVO VALUE(5, 'INTERCAMBIO');

INSERT INTO MEDALLAS VALUE(1, 1, 'TERRA', 'CIUDAD VERDE');
INSERT INTO MEDALLAS VALUE(2, 2, 'DRACO', 'CIUDAD DRACONIA');
INSERT INTO MEDALLAS VALUE(3, 3, 'LLUVIA', 'CIUDAD ARRECÍPOLIS');
INSERT INTO MEDALLAS VALUE(4, 4, 'CHISPA', 'CIUDAD LUMINARIA ');
INSERT INTO MEDALLAS VALUE(5, 5, 'FURIA', 'CIUDAD CAELIS');

INSERT INTO REGISTRAN VALUE(1, 1);
INSERT INTO REGISTRAN VALUE(2, 2);
INSERT INTO REGISTRAN VALUE(3, 3);
INSERT INTO REGISTRAN VALUE(4, 4);
INSERT INTO REGISTRAN VALUE(5, 5);

INSERT INTO RETAN VALUE(1, 1);
INSERT INTO RETAN VALUE(2, 2);
INSERT INTO RETAN VALUE(3, 3);
INSERT INTO RETAN VALUE(4, 4);
INSERT INTO RETAN VALUE(5, 5);

INSERT INTO COMPITEN_CONTRA VALUE(1, 1);
INSERT INTO COMPITEN_CONTRA VALUE(2, 2);
INSERT INTO COMPITEN_CONTRA VALUE(3, 3);
INSERT INTO COMPITEN_CONTRA VALUE(4, 4);
INSERT INTO COMPITEN_CONTRA VALUE(5, 5);