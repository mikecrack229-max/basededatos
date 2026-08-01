# BASE DE DATOS DE CONTROL DE CURSOS

```sql
CREATE DATABASE control_cursos;
GO

USE control_cursos;
GO

/*==== CREAR TABAL PROFESOR ====*/
CREATE TABLE profesor (
	id_profesor INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_profesor
	PRIMARY KEY,

	nombre VARCHAR(50) NOT NULL,

	apellido_1 VARCHAR(50) NOT NULL,
	apellido_2 VARCHAR(50) NOT NULL,
);
GO

/*===== CREAR TABLA CURSO =====*/
CREATE TABLE curso (
	numero_curso INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_curso
	PRIMARY KEY,

	nombre_curso VARCHAR(50) NOT NULL,

	creditos INT NOT NULL
	CONSTRAINT ck_creditos
	CHECK (creditos >0),

	id_profesor INT NOT NULL
	CONSTRAINT fk_curso_profesor
	REFERENCES profesor(id_profesor)

);
GO

CREATE TABLE especialidad(
	id_especialidad INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_especialidad
	PRIMARY KEY,

	nombre VARCHAR(100) NOT NULL,

	id_profesor INT NOT NULL
	CONSTRAINT fk_especialidad_profesor
	REFERENCES profesor (id_profesor)
);
GO

```