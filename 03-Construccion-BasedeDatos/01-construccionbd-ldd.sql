
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
	materia_id INT NOT NULL IDENTITY(1,1),
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

SELECT * 
FROM materia_2;

--Restriccion Default
CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL UNIQUE,
	activo BIT DEFAULT 1
);

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_categoria
	PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL 
	CONSTRAINT uq_categoria_nombre
	UNIQUE,
	activo BIT
	CONSTRAINT df_categoria_activo
	DEFAULT 1
);

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR(30) NOT NULL,
	activo BIT
	CONSTRAINT df_categoria_activo
	DEFAULT 1,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre
	UNIQUE (nombre)
);

DROP TABLE categoria;

INSERT INTO categoria
VALUES ('carner Frias', 1);

INSERT INTO categoria
VALUES ('carner Calientes', DEFAULT);

INSERT INTO categoria (nombre)
VALUES ('Cochos');

SELECT *
FROM categoria;

--RESTICCION CHECK
--opcion de construccion 1

CREATE TABLE producto (
	producto_id INT IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL UNIQUE,
	precio DECIMAL (10, 2) NOT NULL CHECK (precio>0),
	existencia INT NOT NULL CHECK (existencia > 0 AND existencia <= 100),
	activo BIT NOT NULL DEFAULT 1
);
GO
--opcion de construccion 2

CREATE TABLE producto (
	producto_id INT IDENTITY (1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	precio DECIMAL (10, 2) NOT NULL 
	CONSTRAINT ck_producto_precio
	CHECK (precio>0),
	existencia INT NOT NULL
	CHECK (existencia > 0 AND existencia <= 100),
	activo BIT NOT NULL 
	CONSTRAINT df_producto_activo
	DEFAULT 1
);
GO

--opcion de construccion 3
CREATE TABLE producto(
	producto_id INT NOT NULL,
	nombre VARCHAR (20) NOT NULL,
	descripcion VARCHAR(80),
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	--Restriccion PK
	CONSTRAINT pk_producto
	PRIMARY KEY(producto_id),
	--Restriccion UNIQUE
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	--Restriccion CHECK PRECIO
	CONSTRAINT ck_producto_precio
	CHECK (precio>0.0),
	--Restriccion check existencia
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 AND 100)

);
GO

--la unica que no se puede hacer 

INSERT INTO producto
VALUES (1, 'pitufo',NULL, 200, 99,0);

INSERT INTO producto
VALUES (2, 'quemadita',NULL, 200, 99,DEFAULT);

INSERT INTO producto (producto_id, nombre, existencia, precio)
VALUES (3,'Pantera Rosa', 47, 80);

select * from producto;
DROP TABLE producto;

-- Crear una nueva base de datos PARA empresa PATITO

--CREAR LA DB 

CREATE DATABASE empresa_patito;
GO

--USAR LA BASE DE DATOS
USE empresa_patito;
GO

-- RESTRICCION DE FOREING KEY

CREATE TABLE proveedor(
	proveedor_id INT NOT NULL IDENTITY (1,1),
	empresa VARCHAR (35) NOT NULL,
	direccion VARCHAR (80) NULL,
	limite_credito DECIMAL (10,2) NOT NULL,
	-- PRIMARY KEY
	CONSTRAINT pk_proveedor
	PRIMARY KEY (proveedor_id),
	--UNIQUE
	CONSTRAINT uq_proveedor_empresa
	UNIQUE (empresa),
	--CHECK LIMITE DE CREDITO 
	CONSTRAINT ck_proveedor_limite_credito
	CHECK(limite_credito>0.0 AND limite_credito <= 100000)

); 
GO

CREATE TABLE producto(
	fabricante_id CHAR(3) NOT NULL,
	producto_id INT NOT NULL,
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	stock INT NOT NULL
	CONSTRAINT ck_producto_stock
	CHECK (stock BETWEEN 1 AND 100),
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0.0),
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	proveedor_id INT NOT NULL,
	CONSTRAINT pk_producto
	PRIMARY KEY (fabricante_id, producto_id),
	CONSTRAINT fk_producto_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)

);

GO

-- INTEGRIDADES REFERENCIALES ON DELETE Y ON UPDATE 
-- NO ACTION CASCADE, SET NULL, SET DEFAULT

CREATE DATABASE construccion;
GO

USE construccion;
GO

-- NO ACTION

CREATE TABLE cliente (
	cliente_id INT 
	CONSTRAINT PK_CLIENTE
	PRIMARY KEY,
	empresa VARCHAR (20) 
	CONSTRAINT uq_cliente_empresa
	UNIQUE,
	direccion VARCHAR (50),
	tel VARCHAR(15) NOT NULL,
	activo BIT NOT NULL,
	created_at DATETIME2 NOT NULL 
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (),
	updated_at DATETIME2 NOT NULL
	DEFAULT SYSDATETIME ()
);
GO

SELECT SYSDATETIME();

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME (),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME (),
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	-- LIKE VERIFICA UN PATRON DE CADENA DE TEXTO, EN ESTE CASO EL FORMATO DE NUMERO DE TELEFONO
	CHECK (numero_telefono  LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	-- valor por default
	ON DELETE NO ACTION
	-- 
	ON UPDATE NO ACTION
);

INSERT INTO	cliente
VALUES (2, 'patito de hule', NULL , '773-DFE-123',1, DEFAULT, DEFAULT);

INSERT INTO	cliente (cliente_id, empresa, tel, activo)
VALUES (1, 'taqueria Mr. Linux', '7731234567', 1 );

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('723-432-9453', 5);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('773-453-2243', 1),
	   ('773-467-3424', 1),
	   ('773-879-1572', 1),
	   ('423-342-8853', 2);

DROP TABLE telefono;

--Eliminar con on delete en no action
--ELIMINAR LOS HIJOS
DELETE FROM telefono
WHERE cliente_id= 1;

--ELIMINAR AL PADRE
DELETE FROM cliente 
WHERE cliente_id = 1;

SELECT *
FROM telefono;
SELECT *
FROM cliente;

--PARA ACTUALIZAR EN ON UPDATE EN NO ACTION SE ACTUALIZA EL HIJO PONIENDOLO EN NULO 
--Y SE ACTUALIZA EL PADRE,

UPDATE telefono
SET cliente_id = NULL
WHERE cliente_id = 2;

UPDATE cliente 
SET cliente_id = 3
WHERE cliente_id = 2;

--ACTUALIZAR EL PADRE
UPDATE telefono
SET cliente_id = 3
WHERE cliente_id  IS NULL;

SELECT *
FROM telefono;
SELECT *
FROM cliente;

--INTEGRIDAD REFENCIAL ON DELETE Y ON UPDATE CASCADE

CREATE TABLE cliente (
	cliente_id INT 
	CONSTRAINT PK_CLIENTE
	PRIMARY KEY,
	empresa VARCHAR (20) 
	CONSTRAINT uq_cliente_empresa
	UNIQUE,
	direccion VARCHAR (50),
	tel VARCHAR(15) NOT NULL,
	activo BIT NOT NULL,
	created_at DATETIME2 NOT NULL 
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (),
	updated_at DATETIME2 NOT NULL
	DEFAULT SYSDATETIME ()
);
GO

SELECT SYSDATETIME();

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME (),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME (),
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	-- LIKE VERIFICA UN PATRON DE CADENA DE TEXTO, EN ESTE CASO EL FORMATO DE NUMERO DE TELEFONO
	CHECK (numero_telefono  LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	-- valor por default
	ON DELETE CASCADE
	-- 
	ON UPDATE CASCADE
);

DROP TABLE telefono;

INSERT INTO	cliente
VALUES (1, 'patito de hule', NULL , '773-DFE-123',1, DEFAULT, DEFAULT);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('773-453-2243', 1),
	   ('773-467-3424', 1),
	   ('773-879-1572', 1);

-- eliminar en on delete cascade

-- eliminar al padre

DELETE FROM cliente
WHERE cliente_id = 3;


-- ACTUALIZAR EN ON UPDATE CASCADE
UPDATE cliente
SET cliente_id = 10
WHERE cliente_id = 1;

SELECT *
FROM telefono;
SELECT *
FROM cliente;

-- TODO: EXPLICAR ON DELETE Y ON UPDATE SET NULL Y SET DEFAULT

DROP TABLE telefono;

-- ON DELETE Y ON UPDATE SET NULL

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME (),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME (),
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	-- LIKE VERIFICA UN PATRON DE CADENA DE TEXTO, EN ESTE CASO EL FORMATO DE NUMERO DE TELEFONO
	CHECK (numero_telefono  LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	-- valor por default
	ON DELETE SET NULL
	-- 
	ON UPDATE SET NULL
);


INSERT INTO cliente(cliente_id,empresa, tel, activo)
VALUES(11,'Bimbo', '7731554893',1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('723-432-9453', 11);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('773-453-2243', 11),
	   ('773-467-3424', 11),
	   ('773-879-1572', 11),
	   ('423-342-8853', 10);

DELETE FROM cliente
WHERE cliente_id = 11;

UPDATE cliente
SET cliente_id=15
WHERE cliente_id = 10;

SELECT * FROM cliente;
SELECT * FROM telefono;

-- SET ON DELETE Y ON UPDATE SET NULL
DROP TABLE telefono;
GO

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME (),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME (),
	cliente_id INT
	CONSTRAINT df_telefono_cliente_id
	DEFAULT 0,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	-- LIKE VERIFICA UN PATRON DE CADENA DE TEXTO, EN ESTE CASO EL FORMATO DE NUMERO DE TELEFONO
	CHECK (numero_telefono  LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	-- valor por default
	ON DELETE SET DEFAULT
	-- 
	ON UPDATE SET DEFAULT
);
GO


INSERT INTO cliente(cliente_id,empresa, tel, activo)
VALUES(0,'Mostrador', '6662557895',1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('723-432-9453', 15);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('773-453-2243', 15),
	   ('773-467-3424', 15),
	   ('773-879-1572', 15),
	   ('423-342-8853', 15);

DELETE FROM cliente
WHERE cliente_id = 15;

UPDATE cliente
SET cliente_id=19
WHERE cliente_id = 0;

SELECT * 
FROM cliente;

SELECT * 
FROM telefono;