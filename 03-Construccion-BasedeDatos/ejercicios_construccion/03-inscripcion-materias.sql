CREATE DATABASE inscripcion_materias;
GO

USE  inscripcion_materias;
GO

CREATE TABLE alumno(
	numero_alumno INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_alumno
	PRIMARY KEY,

	nombre VARCHAR(50) NOT NULL,

	apellido_paterno VARCHAR (50) NOT NULL,

	apellido_materno VARCHAR (50) NOT NULL,

	semestre INT NOT NULL,
	CONSTRAINT ck_alumno_semestre
	CHECK (semestre BETWEEN 1 AND 12)

);
GO

CREATE TABLE materia(
	clave_materia  INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_materia
	PRIMARY KEY,

	nombre VARCHAR (50) NOT NULL,
	CONSTRAINT uq_materia_nombre
	UNIQUE (nombre),

	creditos INT NOT NULL
	CONSTRAINT ck_materia_creditos
	CHECK (creditos > 0)
);
GO

EXEC sp_rename
    'dbo.materia.id_materia',
    'clave_materia',
    'COLUMN';
GO

CREATE TABLE inscripcion (
	numero_alumno INT NOT NULL,
	clave_materia INT NOT NULL,
	fecha_inscripcion DATE NOT NULL,
	calificacion DECIMAL (4,2),

	CONSTRAINT pk_inscripcion
	PRIMARY KEY (numero_alumno, clave_materia),

	CONSTRAINT ck_inscripcion_calificacion
	CHECK (calificacion BETWEEN 0 AND 10),

	CONSTRAINT fk_inscripcion_alumno
	FOREIGN KEY (numero_alumno)
	REFERENCES alumno (numero_alumno),

	CONSTRAINT fk_inscripcion_materia
	FOREIGN KEY (clave_materia)
	REFERENCES materia (clave_materia)
);
GO

INSERT INTO alumno (
    nombre,
    apellido_paterno,
    apellido_materno,
    semestre
)
VALUES (
    'Jesus Eduardo',
    'Bernardo',
    'Hernandez',
    4
);
GO

INSERT INTO materia (
    nombre,
    creditos
)
VALUES (
    'Base de Datos',
    6
);
GO

INSERT INTO inscripcion(
    numero_alumno,
    clave_materia,
    fecha_inscripcion,
    calificacion
)
VALUES (
    1,
    1,
    '2026-07-31',
    9.50
);
GO
