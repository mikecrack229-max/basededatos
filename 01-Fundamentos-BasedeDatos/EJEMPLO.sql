USE bdejemplo;
GO

CREATE TABLE alumno (
	idalumno INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidoPaterno VARCHAR(20) NOT NULL,
	apellidoMaterno VARCHAR(20) NULL,
	fechaNaci DATE NOT NULL,
	calle VARCHAR(50) NOT NULL,
	numeroInt INT,
	numeroExt INT
);

INSERT INTO alumno
VALUES (1, 'MONSE', 'MUÑOS', NULL, '2007-07-17', 'CALLE DEL INFIERNO', NULL, 666);

INSERT INTO alumno
VALUES (2, 'IRVING', 'ANDABLO', 'ISLAS', '2007-06-16', 'CALLE DEL CIELO', NULL, NULL);

INSERT INTO alumno (idalumno, nombre, apellidoPaterno, fechaNaci, calle)
VALUES (3, 'JESUS', 'BERNARDO', '2007-01-18', 'CONOCIDA');

SELECT *
FROM alumno;

-- Razon de cardinalidad 1:N

CREATE TABLE categoria2(
	categoriaId INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	CONSTRAINT pk_Categoria2
	PRIMARY KEY (categoriaId)
);

CREATE TABLE producto2(
	productoid INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(35) NOT NULL,
	existencia INT NOT NULL,
	precio DECIMAL(10, 2) NOT NULL,
	categoriaId INT,
	CONSTRAINT fk_producto2_categoria2
	FOREIGN KEY (categoriaId)
	REFERENCES categoria2(categoriaId)
);