# Diccionario de datos de la base de datos Control de Pedidos

## 1. Información General

| Elemento | Valor |
|----------|-------|
| Proyecto | Control de Pedidos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ing. Jesús Eduardo Bernardo Hernández |
| SGBD | SQL Server |

## 2. Descripción de la base de datos

La base de datos administra:

- Cliente
- Pedido
- Producto
- DetallePedido

Permite controlar los pedidos realizados por los clientes, así como los productos incluidos en cada pedido, registrando cantidad y precio de venta.

## 3. Catálogo de Restricciones Utilizadas

| Catálogo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| CHK | Check |
| AI | Auto Increment o Identity |
| CK | Constraint Key |
| DF | Default |

## 4. Diccionario de datos

**Tabla:** _Cliente_  
**Descripción:**  
Almacena la información general de los clientes registrados.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumCliente | INT | - | PK, AI, NN | Identificador único del cliente |
| Nombre | VARCHAR | 50 | NN | Nombre del cliente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del cliente |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido del cliente |

---

**Tabla:** _Pedido_  
**Descripción:**  
Almacena la información de los pedidos realizados por los clientes.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPedido | INT | - | PK, AI, NN | Identificador único del pedido |
| FechaPedido | DATE | - | NN | Fecha en la que se realizó el pedido |
| Cliente | INT | - | FK, NN | Identificador del cliente que realizó el pedido |

---

**Tabla:** _Producto_  
**Descripción:**  
Almacena la información de los productos disponibles para venta.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProducto | INT | - | PK, AI, NN | Identificador único del producto |
| Nombre | VARCHAR | 100 | NN, UQ | Nombre del producto |
| Precio | DECIMAL | 10,2 | NN, CHK (>0) | Precio del producto |

---

**Tabla:** _DetallePedido_  
**Descripción:**  
Almacena los productos incluidos en cada pedido, así como la cantidad vendida y el precio de venta.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPedido | INT | - | PK, FK, NN | Identificador del pedido |
| NumProducto | INT | - | PK, FK, NN | Identificador del producto |
| PrecioVenta | DECIMAL | 10,2 | NN, CHK (>0) | Precio al que se vendió el producto en el pedido |
| CantidadVendida | INT | - | NN, CHK (>0) | Cantidad de productos vendidos en el pedido |

---

## 5. Relaciones en la base de datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Cliente -> Pedido | 1:N | Un cliente puede realizar varios pedidos |
| Pedido -> Cliente | N:1 | Un pedido pertenece a un solo cliente |
| Pedido -> DetallePedido | 1:N | Un pedido puede contener varios productos |
| Producto -> DetallePedido | 1:N | Un producto puede aparecer en varios pedidos |
| Pedido -> Producto | M:N | Un pedido puede tener varios productos y un producto puede estar en varios pedidos |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Pedido | Cliente | Cliente(NumCliente) |
| DetallePedido | NumPedido | Pedido(NumPedido) |
| DetallePedido | NumProducto | Producto(NumProducto) |

## 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un pedido con un cliente inexistente |
| IR-02 | No se puede registrar un detalle de pedido con un pedido inexistente |
| IR-03 | No se puede registrar un detalle de pedido con un producto inexistente |
| IR-04 | No se puede eliminar un cliente si tiene pedidos relacionados |
| IR-05 | No se puede eliminar un pedido si tiene productos registrados en el detalle |
| IR-06 | No se puede eliminar un producto si aparece en algún detalle de pedido |

## 8. Reglas de Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar varios pedidos |
| RN-02 | Cada pedido debe pertenecer a un solo cliente |
| RN-03 | Un pedido puede incluir varios productos |
| RN-04 | Un producto puede estar incluido en varios pedidos |
| RN-05 | La cantidad vendida debe ser mayor a cero |
| RN-06 | El precio de venta debe ser mayor a cero |
| RN-07 | Un mismo producto no debe repetirse dentro del mismo pedido |

## 9. Diagrama Relacional

![Ejercicio Relacional 4](/img/Relacional/EjercicioRelacional4.jpg)
