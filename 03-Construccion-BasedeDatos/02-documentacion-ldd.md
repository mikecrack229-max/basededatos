# Construccion de base de datos en SQL Server, MySQL y PostgreSQL

para la construccion de objetos de la basse de datos se utilizara el lenguaje sql que significa (structured query language) se divide en **cinco grandes categorias** 

## SQL
- DDL (Data definition language)
- DML (Data Manipualtion Language)
- DQL (Data query Language)
- DCL (Data control Language)
- TCL (Transaction control Language)

### SQL-DDL (Data definition language)
Lenguaje de difnicion de datos:

Se tuliza para modificar la estructura de la base de datos, es decir crear, modificar y eliminar objetos de la base de datos como tablas, vistas, procedimientos almacenados, funciones, etc.

Con DDL trabajamos sobre los siguientes objetos de la base de datos:
- Base de datos
- Tablas
- Vistas
- indices
- restricciones
- esquemas
- Stored procedures (procedimientos almacenados)
- funciones
- disparadores (triggers)

**Comandos Principales de DDL**

| Comando | Función |
|----------|-------|
| Create | Crear Objeto |
| Alter | Modificar Objeto |
| Drop | Eliminar Objeto |
| Truncate | Eliminar todos los registros de una tabla (vacia toda la tabla) |
| rename | Cambiar el nombre de un objeto (segun el sistema gestor de base de datos SGDB) |


### SQL-DML (Data Manipulation Language)

**Lenguaje de manipulación de datos:**

Sirve para **trabajar** con la informacion almacenada en la base de datos, es decir insertar, actualizar, eliminar y consultar registros de las tablas.

Nota: Aqui no cambia la estructura de la base de datos, solo se trabaja con los registros de las tablas.

**Comandos Principales de DML**

| Comando | Función |
|----------|-------|
| INSERT | Insertar registros en una tabla |
| UPDATE | Actualizar registros de una tabla |
| DELETE | Eliminar registros de una tabla |

### SQL-DQL (Data Query Language)

**Lenguaje de consulta de datos:**

Su fucnion es **consultar** la informacion almacenada en la base de datos, es decir obtener registros de las tablas.

**Comandos Principales de DQL**

| Comando | Función |
|----------|-------|
| SELECT | Consultar registros de una tabla (información)|

Generalmente se combina con clausulas como:

- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN (LEFT, RIGHT, INNER, CROSS, FULL)
- DISTINCT
- LIMIT / TOP 
- FUNCION DE AGREGADO
- FUNCINES DE VENTANA


## Nomenclatura de constrccion 

Utilizaremos la convencion **snake_case** para nombrar los objetos de la base de datos, es decir, se escriben en minusculas y se separan las palabras con guion bajo (_).

| Objeto | Convencion | Ejemplo |
| :--- | :--- | :--- |
| Base de datos | snake_case | control escolar |
| Esquema | snake_case | ventas, rh, seguridad |
| Tabla | Singular en snake_case | cliente, pedido, detalle pedido |
| Columna | snake_case | id_cliente, fecha_registro, correo_electronico |
| PK | <tabla>_id | Cliente-id, producto_id | 
| FK | Igual que la PK referenciada | Cliente_id, categoria_id |
| Tabla puente | <tabla1>_<tabla2> | alumno_cuso producto_proveedor |

**Restricciones**

pk_cliente
fk_pedido_cliente
uq_cliente_correo_electronico
ck_producto_precio
df_cliente_activo

### DDL en SQL server Create, ALTER Y DROP para la creacion modificacion de tablas

**Sintaxis de creacion de tablas**

```sql 
    CREATE TABLE nombre_tabla
    (
     columna tipo_dato restricciones,
     columna tipo_dato restricciones
    )
´´´


## SQL Server
```SQL
CREATE
ALTER
DROP
```

investigar comandos emet 