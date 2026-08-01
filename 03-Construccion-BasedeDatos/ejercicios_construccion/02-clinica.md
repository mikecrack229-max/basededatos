# Construcción de la base de datos Clínica

```sql
CREATE DATABASE clinica;
GO

USE clinica;
GO

/*===== CREAR TABLA PACIENTE =====*/
CREATE TABLE paciente (
    num_paciente INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_paciente
    PRIMARY KEY,

    nombre VARCHAR(50) NOT NULL,
    apellido_1 VARCHAR(50) NOT NULL,
    apellido_2 VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);
GO

/*===== crear tabla expediente======*/
CREATE TABLE expediente(
	numero_expediente INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_expediente
	PRIMARY KEY,

	fecha_apertura DATE NOT NULL,

	tipo_sangre VARCHAR(5) NOT NULL,

	numero_paciente INT NOT NULL
	CONSTRAINT uq_expediente_numero_paciente
	UNIQUE
	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY
	REFERENCES paciente (numero_paciente)
);
GO
```