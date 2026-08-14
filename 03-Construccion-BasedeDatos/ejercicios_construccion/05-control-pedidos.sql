CREATE DATABASE control_pedidos;
GO

USE control_pedidos;
GO


/*==== crear tabla cliente =====*/
CREATE TABLE cliente(
	numero_cliente INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_cliente
	PRIMARY KEY,

	nombre VARCHAR (50) NOT NULL,

	apellido_paterno VARCHAR (50) NOT NULL,

	apellido_materno VARCHAR (50) NOT NULL

);
GO

/*=== crear tabla producto ====*/
CREATE TABLE producto(
	numero_producto INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,

	nombre VARCHAR (100) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,

	precio DECIMAL(10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0)
);
GO

/*=== crear tabla pedido ===*/
CREATE TABLE pedido(
	numero_pedido INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_pedido
	PRIMARY KEY,

	fecha_pedido DATETIME NOT NULL,

	numero_cliente INT NOT NULL
	CONSTRAINT fk_pedido__cliente
	REFERENCES cliente (numero_cliente)
);
GO

/*=== crear tabla detalle pedido====*/
CREATE TABLE detalle_pedido(
	numero_pedido INT NOT NULL,
	numero_producto INT NOT NULL,
	precio_venta DECIMAL(10,2) NOT NULL,
	cantidad_vendida INT NOT NULL,

	CONSTRAINT pk_detalle_pedido
	PRIMARY KEY (numero_pedido, numero_producto),

	CONSTRAINT ck_detalle_pedido_precio_venta
	CHECK(precio_venta > 0),

	CONSTRAINT ck_detalle_pedido_cantidad_vendida
	CHECK (cantidad_vendida > 0),

	CONSTRAINT fk_detalle_pedido_pedido
	FOREIGN KEY (numero_pedido)
	REFERENCES pedido (numero_pedido),

	CONSTRAINT fk_detalle_pedido_producto
	FOREIGN KEY (numero_producto)
	REFERENCES producto (numero_producto)
);
GO