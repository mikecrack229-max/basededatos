
-- Crea una base de datos
CREATE DATABASE	universidad;
GO

-- utiliza la base de datos
USE universidad;
GO

-- crea una una tabla
CREATE TABLE alumno(
alumno_id INT,
nombre VARCHAR (100),
edad INT
);
GO

CREATE TABLE alumno_2(
	alumno_id INT,
	nombre VARCHAR (100),
	apellido_paterno VARCHAR (50),
	apellido_materno VARCHAR (50),
	fecha_nacimiento DATE,
	correo VARCHAR (45)
);
GO

-- Restricciones

CREATE TABLE alumno_3(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR (100),
	correo VARCHAR (40)
);
GO


CREATE TABLE alumno_4(
	alumno_id INT NOT NULL,
	nombre VARCHAR (100),
	correo VARCHAR (40),
	CONSTRAINT pk_alumno_4
	PRIMARY KEY (alumno_id)
);

GO

INSERT INTO alumno_4
VALUES (1, 'PANFILO','correo@correo.com');

INSERT INTO alumno_4
VALUES (2, 'Monico','correo@correo.com');

-- Primary Key con indentity

CREATE TABLE profesor (
	profesor_id INT NOT NULL IDENTITY (1, 1),
	nombre VARCHAR (50),
	edad INT 
	CONSTRAINT pk_profesor
	PRIMARY KEY (profesor_id)
);
GO

INSERT INTO profesor
VALUES ('German', 29),
	   ('Maria ', 19);

GO

SELECT *
FROM profesor;

-- restriccion UNIQUE

CREATE TABLE materia (
	materia_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	correo VARCHAR (50) NOT NULL UNIQUE
);

CREATE TABLE materia_2 (
	materia_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	correo VARCHAR (50) NOT NULL,
		CONSTRAINT pk_materia_2
		PRIMARY KEY (materia_id),
		CONSTRAINT uq_materia2_correo
		UNIQUE (correo)
);
GO

INSERT INTO materia_2
VALUES ('correo')

INSERT INTO materia_2
VALUES ('correo2')

