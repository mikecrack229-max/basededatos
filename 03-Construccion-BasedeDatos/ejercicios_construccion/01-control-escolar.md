# CONSTRUCCION DE LA BBASE DE DATOS DE CONTROL ESCOLAR

```sql
CREATE DATABASE control_escolar;
GO

USE control_escolar;
GO

/*===== crear tabla carrera ====*/
CREATE TABLE carrera(
	id_carrera INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_carrera 
	PRIMARY KEY,

	nombre VARCHAR(100) NOT NULL
	CONSTRAINT uq_carrera_nombre
	UNIQUE,

	duracion_cuatrimestre INT NOT NULL
	CONSTRAINT ck_carrera_duracion_cuatrimestre
	CHECK(duracion_cuatrimestre > 0)
);
GO

/*==== crear tabla alumno ==== */
CREATE TABLE alumno (
	id_alumno INT NOT NULL IDENTITY(1,1),
	matricula VARCHAR(10) NOT NULL,
	nombre VARCHAR (50) NOT NULL,
	apellido_paterno VARCHAR(50) NOT NULL,
	apellido_materno VARCHAR(50) NOT NULL,
	correo_electronico VARCHAR (50) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	id_carrera INT NOT NULL,

	CONSTRAINT pk_alumno
	PRIMARY KEY (id_alumno),

	CONSTRAINT uq_alumno_matricula
	UNIQUE (matricula),

	CONSTRAINT uq_alumno_correo_electronico
	UNIQUE (correo_electronico),

	CONSTRAINT fk_alumno_carrera
	FOREIGN KEY (id_carrera)
	REFERENCES carrera (id_carrera)
); 
GO

INSERT INTO carrera (
	nombre,
	duracion_cuatrimestre
)
VALUES (
	'Desarrollo de Software Multiplataforma',
	11
);
GO

INSERT INTO alumno (
    matricula,
    nombre,
    apellido_paterno,
    apellido_materno,
    correo_electronico,
    fecha_nacimiento,
    id_carrera
)
VALUES (
    '2026000001',
    'Jesus Eduardo',
    'Bernardo',
    'Hernandez',
    'jesus@uttt.edu.mx',
    '2006-01-01',
    1
);
GO

SELECT
	c.nombre AS 'nombre carrera',
	c.duracion_cuatrimestre AS 'duracion'
FROM carrera AS c;
GO

SELECT
	a.nombre AS 'nombre',
	a.apellido_paterno AS 'apellido p',
	a.correo_electronico AS [correo electronico],
	a.fecha_nacimiento AS 'fecha nacimiento',
	a.id_alumno AS 'id alumno',
	a.id_carrera AS 'id carrera'
FROM alumno AS a;
GO

/*==== Crear tabla profesor ====*/
CREATE TABLE profesor (
	id_profesor INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_profesor
	PRIMARY KEY,

	nombre VARCHAR(50) NOT NULL,

	apellido_paterno VARCHAR (50) NOT NULL,
	apellido_materno VARCHAR (50) NOT NULL,

	correo_electronico VARCHAR(50) NOT NULL	
	CONSTRAINT uq_profesor_correo_electronico
	UNIQUE
); 
GO

/*==== crear tabla materia ====*/
CREATE TABLE materia (
	id_materia INT NOT NULL IDENTITY (1,1),
	clave_materia VARCHAR (10) NOT NULL,
	nombre VARCHAR (100) NOT NULL,
	creditos INT NOT NULL,
	id_carrera INT NOT NULL,

	CONSTRAINT pk_materia
	PRIMARY KEY (id_materia),

	CONSTRAINT uq_materia_clave_materia
	UNIQUE(clave_materia),

	CONSTRAINT ck_materia_creditos
	CHECK (creditos > 0),
	
	CONSTRAINT fk_materia_carrera
	FOREIGN KEY (id_carrera)
	REFERENCES carrera (id_carrera)

);
GO

INSERT INTO profesor (
    nombre,
    apellido_paterno,
    apellido_materno,
    correo_electronico
)
VALUES (
    'Ana',
    'Martinez',
    'Lopez',
    'ana.martinez@uttt.edu.mx'
);
GO

INSERT INTO materia (
    clave_materia,
    nombre,
    creditos,
    id_carrera
)
VALUES (
    'BD-101',
    'Base de Datos',
    6,
    1
);
GO

SELECT
    materia.clave_materia,
    materia.nombre AS materia,
    materia.creditos,
    carrera.nombre AS carrera
FROM materia
INNER JOIN carrera
    ON materia.id_carrera = carrera.id_carrera;
GO

/*==== Crear tabla Grupo ====*/
CREATE TABLE grupo (
	id_grupo INT NOT NULL IDENTITY (1,1),
	nombre_grupo VARCHAR (10) NOT NULL,
	id_profesor INT NOT NULL,
	id_materia INT NOT NULL,

	CONSTRAINT pk_grupo
	PRIMARY KEY (id_grupo),

	CONSTRAINT fk_grupo_profesor
	FOREIGN KEY (id_profesor)
	REFERENCES profesor (id_profesor),

	CONSTRAINT fk_grupo_materia
	FOREIGN KEY (id_materia)
	REFERENCES materia (id_materia)
); 
GO

/*===== Crear tabla inscripcion ======*/
CREATE TABLE inscripcion (
	id_alumno INT NOT NULL,
	id_grupo INT NOT NULL,

	fecha_inscripcion DATE NOT NULL
	CONSTRAINT pk_inscripcion_fecha_inscripcion
	DEFAULT GETDATE(),

	calificacion DECIMAL (4,2),

	CONSTRAINT pk_inscripcion
	PRIMARY KEY (id_alumno, id_grupo),

	CONSTRAINT ck_inscripcion_calificacion
	CHECK (
		calificacion IS NULL
		OR calificacion BETWEEN 0 AND 10
	),

	CONSTRAINT fk_inscripcion_alumno
	FOREIGN KEY (id_alumno)
	REFERENCES alumno (id_alumno),

	CONSTRAINT fk_inscripcion_grupo
	FOREIGN KEY (id_grupo)
	REFERENCES grupo (id_grupo)
);
GO

```