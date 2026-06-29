# Diccionario de datos de la base de datos Control Escolar

1. Informacion General

| Elemento | Valor |
|----------|-------|
| Proyecto | Control Escolar |
| Version | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Ing. Jesus Eduardo Bernardo Hernardez |
| SGBD | SQLSERVER |

2. Descripción de la base de datos

El Base de Datos Administra:

- Carrera
- Alumno
- Profesor
- Materia
- Grupo
- Inscripcion

Permite controlar la oferta academica y la inscripcion de esttudiantes

3. Catalogo de Restricciones Utilizadas

| Catalogo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| CHK | Check |
| AI | Auto Increment o Identity |
| CK | Constraint Key |
| DF | Default |

4. Diccionario de datos

**Tabla:** _Carrera_
** Descripcion:**
Almacena las carreras ofertadas por la universidad

| Campo | Tipo de Dato | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| IdCarrera | INT | - | PK, AI, NN | Identificador único de la carrera |
| Nombre | VARCHAR | 100 | NN, UQ | Nombre de la carrera |
| Duracion_cuatrimestre | INT | - | NN, UQ (>0) | Duración en cuatrimestres |

---

**Tabla:** _Alumno_
** Descripcion:**
Almacena la información de los alumnos

| Campo | Tipo de Dato | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| IdAlumno | INT | - | PK, AI, NN | Identificador del alumno |
| Matricula | VARCHAR | 10 | NN, UQ | Matricula Institucional |
| Nombre | VARCHAR | 50 | NN | Nombre del alumno |
| ApellidoPaterno | VARCHAR | 50 | NN | Apellido paterno del alumno |
| ApellidoMaterno | VARCHAR | 50 | NN | Apellido materno del alumno |
| CorreoElectronico | VARCHAR | 100 | NN, UQ | Correo electrónico institucional del alumno |
| fechaNacimiento | DATE | - | NN | Fecha de nacimiento del alumno |
| IdCarrera | INT | - | FK, NN | Identificador de la carrera a la que pertenece el alumno |

---

TODO: Documentar las siguientes tablas 

5. Relaciones en la base de datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Carrera -> Alumno | 1:N | Una carrera tiene muchos alumnos |
| Carrera -> Materia | 1:N | Una carrera tiene muchas materias |
| Profesor -> Grupo | 1:N | Un profesor puede impartir en varios grupos |
| Materia -> Grupo | 1:N | Una materia puede abrirse en varios grupos |
| Alumnos -> Inscripcion | 1:N | Un alumno puede tener varias inscripciones |
| Grupo -> Inscripcion | 1:N | Un grupo puede tener muchos alumnos |

6. Matriz de Claves Foraneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Alumno | IdCarrera | Carrera(IdCarrera) |
| Materia | IdCarrera | Carrera(IdCarrera) |
| Grupo | Id_profesor | Profesor(IdProfesor) |
| Grupo | Id_materia | Materia(IdMateria) |
| Inscripcion | IdAlumno | Alumno(IdAlumno) |
| Inscripcion | IdGrupo | Grupo(IdGrupo) |

7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo para un profesor inexistente |

8. Reglas de Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un alumno pertenece a una sola carrera |
| RN-02 | Una carrera puede tener muchos alumnos |
| RN-03 | Una carrera puede tener muchas materias |
| RN-04 | Un profesor pude impartir varias grupos |

9. Diagrama Relacional

![Ejercicio Relacional](/img/Relacional/EjercicioRelacional5.jpg)

# Diccionario de datos de la base de datos Clínica

## 1. Información General

| Elemento | Valor |
|----------|-------|
| Proyecto | Clínica |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ing. Jesús Eduardo Bernardo Hernández |
| SGBD | SQL Server |

## 2. Descripción de la base de datos

La base de datos administra:

- Paciente
- Expediente

Permite controlar la información básica de los pacientes y el expediente médico asignado a cada uno.

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

**Tabla:** _Paciente_  
**Descripción:**  
Almacena la información general de los pacientes registrados en la clínica.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPaciente | INT | - | PK, AI, NN | Identificador único del paciente |
| Nombre | VARCHAR | 50 | NN | Nombre del paciente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del paciente |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido del paciente |
| FechaNaci | DATE | - | NN | Fecha de nacimiento del paciente |

---

**Tabla:** _Expediente_  
**Descripción:**  
Almacena la información del expediente médico asignado a cada paciente.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumExpediente | INT | - | PK, AI, NN | Identificador único del expediente |
| FechaApertura | DATE | - | NN | Fecha en la que se abrió el expediente |
| TipoSangre | VARCHAR | 5 | NN | Tipo de sangre del paciente |
| NumPaciente | INT | - | FK, UQ, NN | Identificador del paciente al que pertenece el expediente |

---

## 5. Relaciones en la base de datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Paciente -> Expediente | 1:1 | Un paciente tiene un solo expediente |
| Expediente -> Paciente | 1:1 | Un expediente pertenece a un solo paciente |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Expediente | NumPaciente | Paciente(NumPaciente) |

## 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un expediente con un paciente inexistente |
| IR-02 | No se puede eliminar un paciente si tiene un expediente relacionado |
| IR-03 | Un expediente debe estar asociado obligatoriamente a un paciente |
| IR-04 | Un paciente no puede tener más de un expediente registrado |

## 8. Reglas de Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Cada paciente debe tener un expediente |
| RN-02 | Cada expediente pertenece a un solo paciente |
| RN-03 | Un paciente no puede tener más de un expediente |
| RN-04 | El tipo de sangre debe registrarse dentro del expediente del paciente |
| RN-05 | La fecha de apertura del expediente debe registrarse al crear el expediente |

## 9. Diagrama Relacional

![Ejercicio Relacional 1](/img/Relacional/EjercicioRelacional1.jpg)

# Diccionario de datos de la base de datos Control de Cursos

## 1. Información General

| Elemento | Valor |
|----------|-------|
| Proyecto | Control de Cursos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ing. Jesús Eduardo Bernardo Hernández |
| SGBD | SQL Server |

## 2. Descripción de la base de datos

La base de datos administra:

- Profesor
- Curso
- Especialidad

Permite controlar los cursos impartidos por los profesores, así como las especialidades asociadas a cada profesor.

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

**Tabla:** _Profesor_  
**Descripción:**  
Almacena la información general de los profesores registrados.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdProfesor | INT | - | PK, AI, NN | Identificador único del profesor |
| Nombre | VARCHAR | 50 | NN | Nombre del profesor |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del profesor |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido del profesor |

---

**Tabla:** _Curso_  
**Descripción:**  
Almacena la información de los cursos impartidos por los profesores.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumCurso | INT | - | PK, AI, NN | Identificador único del curso |
| NombreCurso | VARCHAR | 100 | NN | Nombre del curso |
| Creditos | INT | - | NN, CHK (>0) | Cantidad de créditos asignados al curso |
| Profesor | INT | - | FK, NN | Identificador del profesor que imparte el curso |

---

**Tabla:** _Especialidad_  
**Descripción:**  
Almacena las especialidades relacionadas con cada profesor.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdEspecialidad | INT | - | PK, AI, NN | Identificador único de la especialidad |
| Nombre | VARCHAR | 100 | NN | Nombre de la especialidad |
| Profesor | INT | - | FK, NN | Identificador del profesor al que pertenece la especialidad |

---

## 5. Relaciones en la base de datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Profesor -> Curso | 1:N | Un profesor puede impartir varios cursos |
| Curso -> Profesor | N:1 | Un curso es impartido por un solo profesor |
| Profesor -> Especialidad | 1:N | Un profesor puede tener varias especialidades |
| Especialidad -> Profesor | N:1 | Una especialidad pertenece a un solo profesor |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Curso | Profesor | Profesor(IdProfesor) |
| Especialidad | Profesor | Profesor(IdProfesor) |

## 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un curso con un profesor inexistente |
| IR-02 | No se puede registrar una especialidad con un profesor inexistente |
| IR-03 | No se puede eliminar un profesor si tiene cursos relacionados |
| IR-04 | No se puede eliminar un profesor si tiene especialidades relacionadas |

## 8. Reglas de Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un profesor puede impartir varios cursos |
| RN-02 | Cada curso debe ser impartido por un solo profesor |
| RN-03 | Un profesor puede tener varias especialidades |
| RN-04 | Cada especialidad debe estar asociada a un profesor |
| RN-05 | Los créditos de un curso deben ser mayores a cero |

## 9. Diagrama Relacional

![Ejercicio Relacional 2](/img/Relacional/EjercicioRelacional2.jpg)

# Diccionario de datos de la base de datos Inscripción de Materias

## 1. Información General

| Elemento | Valor |
|----------|-------|
| Proyecto | Inscripción de Materias |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ing. Jesús Eduardo Bernardo Hernández |
| SGBD | SQL Server |

## 2. Descripción de la base de datos

La base de datos administra:

- Alumno
- Materia
- Inscribe

Permite controlar la inscripción de alumnos a materias, registrando la fecha de inscripción y la calificación obtenida.

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

**Tabla:** _Alumno_  
**Descripción:**  
Almacena la información general de los alumnos registrados.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumAlumno | INT | - | PK, AI, NN | Identificador único del alumno |
| Nombre | VARCHAR | 50 | NN | Nombre del alumno |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del alumno |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido del alumno |
| Semestre | INT | - | NN, CHK (>0) | Semestre que cursa el alumno |

---

**Tabla:** _Materia_  
**Descripción:**  
Almacena la información de las materias disponibles para inscripción.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ClaveMateria | INT | - | PK, AI, NN | Identificador único de la materia |
| Nombre | VARCHAR | 100 | NN, UQ | Nombre de la materia |
| Creditos | INT | - | NN, CHK (>0) | Cantidad de créditos de la materia |

---

**Tabla:** _Inscribe_  
**Descripción:**  
Almacena la relación entre los alumnos y las materias en las que se inscriben.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumAlumno | INT | - | PK, FK, NN | Identificador del alumno inscrito |
| ClaveMateria | INT | - | PK, FK, NN | Identificador de la materia inscrita |
| FechaInscripcion | DATE | - | NN | Fecha en la que el alumno se inscribió a la materia |
| Calificacion | DECIMAL | 4,2 | CHK (>=0 AND <=10) | Calificación final obtenida por el alumno |

---

## 5. Relaciones en la base de datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Alumno -> Inscribe | 1:N | Un alumno puede tener varias inscripciones |
| Materia -> Inscribe | 1:N | Una materia puede tener varios alumnos inscritos |
| Alumno -> Materia | M:N | Un alumno puede inscribirse a varias materias y una materia puede tener varios alumnos |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Inscribe | NumAlumno | Alumno(NumAlumno) |
| Inscribe | ClaveMateria | Materia(ClaveMateria) |

## 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar una inscripción con un alumno inexistente |
| IR-02 | No se puede registrar una inscripción con una materia inexistente |
| IR-03 | No se puede eliminar un alumno si tiene inscripciones relacionadas |
| IR-04 | No se puede eliminar una materia si tiene alumnos inscritos |
| IR-05 | Una inscripción debe estar asociada obligatoriamente a un alumno y a una materia |

## 8. Reglas de Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede inscribirse a varias materias |
| RN-02 | Una materia puede tener varios alumnos inscritos |
| RN-03 | Un alumno no puede inscribirse dos veces a la misma materia |
| RN-04 | La calificación debe estar en un rango de 0 a 10 |
| RN-05 | Los créditos de una materia deben ser mayores a cero |
| RN-06 | La fecha de inscripción debe registrarse al momento de inscribir al alumno |

## 9. Diagrama Relacional

![Ejercicio Relacional 3](/img/Relacional/EjercicioRelacional3.jpg)

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

# Diccionario de datos de la base de datos Empresa

## 1. Información General

| Elemento | Valor |
|----------|-------|
| Proyecto | Empresa |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ing. Jesús Eduardo Bernardo Hernández |
| SGBD | SQL Server |

## 2. Descripción de la base de datos

La base de datos administra:

- Employee
- Department
- Locations
- Project
- Work_On
- Dependent

Permite controlar la información de empleados, departamentos, proyectos, ubicaciones, dependientes y las horas trabajadas por los empleados en cada proyecto.

Este ejercicio cuenta con dos ejemplos de modelo relacional, por lo que se documentan ambos de forma independiente.

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

# 4. Diccionario de datos - Ejemplo Relacional 1

## **Tabla:** _Employee_  
**Descripción:**  
Almacena la información general de los empleados.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Ssn | VARCHAR | 20 | PK, NN | Número de seguridad social del empleado |
| Firstname | VARCHAR | 50 | NN | Nombre del empleado |
| Lastname | VARCHAR | 50 | NN | Apellido del empleado |
| Bdate | DATE | - | NN | Fecha de nacimiento del empleado |
| Address | VARCHAR | 150 | NN | Dirección del empleado |
| Salary | DECIMAL | 10,2 | NN, CHK (>0) | Salario del empleado |
| Sex | CHAR | 1 | NN | Sexo del empleado |
| NameProyect | VARCHAR | 100 | FK, NN | Nombre del proyecto asignado |
| NumberProyect | INT | - | FK, NN | Número del proyecto asignado |
| Jefe | VARCHAR | 20 | FK, NN | Identificador del empleado jefe o supervisor |

---

## **Tabla:** _Department_  
**Descripción:**  
Almacena la información de los departamentos de la empresa.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Name | VARCHAR | 100 | PK, NN | Nombre del departamento |
| Number | INT | - | PK, NN | Número identificador del departamento |
| Ssn | VARCHAR | 20 | FK, NN | Identificador del empleado que administra el departamento |
| StartDate | DATE | - | NN | Fecha de inicio del empleado como administrador del departamento |

---

## **Tabla:** _Locations_  
**Descripción:**  
Almacena las ubicaciones relacionadas con cada departamento.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumLocation | INT | - | PK, AI, NN | Identificador único de la ubicación |
| NumDepartment | INT | - | FK, NN | Número del departamento al que pertenece la ubicación |
| Location | VARCHAR | 100 | NN | Ubicación del departamento |

---

## **Tabla:** _Project_  
**Descripción:**  
Almacena la información de los proyectos de la empresa.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Name | VARCHAR | 100 | PK, NN | Nombre del proyecto |
| Number | INT | - | PK, NN | Número identificador del proyecto |
| Location | VARCHAR | 100 | NN | Ubicación donde se desarrolla el proyecto |
| NameProyect | VARCHAR | 100 | FK, NN | Nombre del departamento o proyecto relacionado |
| NumerProyect | INT | - | FK, NN | Número del departamento o proyecto relacionado |

---

## **Tabla:** _Work_On_  
**Descripción:**  
Almacena la relación entre empleados y proyectos, indicando las horas trabajadas.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Ssn | VARCHAR | 20 | PK, FK, NN | Identificador del empleado que trabaja en el proyecto |
| NumPro | INT | - | FK, NN | Identificador del proyecto relacionado |
| NumberPro | INT | - | FK, NN | Número del proyecto relacionado |
| Hours | DECIMAL | 5,2 | NN, CHK (>=0) | Horas trabajadas por el empleado en el proyecto |

---

## **Tabla:** _Dependent_  
**Descripción:**  
Almacena la información de los dependientes registrados por cada empleado.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Name | VARCHAR | 100 | PK, NN | Nombre del dependiente |
| Sex | CHAR | 1 | NN | Sexo del dependiente |
| Birthdate | DATE | - | NN | Fecha de nacimiento del dependiente |
| Ssn | VARCHAR | 20 | FK, NN | Identificador del empleado al que pertenece el dependiente |

---

# 5. Relaciones en la base de datos - Ejemplo Relacional 1

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Employee -> Dependent | 1:N | Un empleado puede tener varios dependientes |
| Employee -> Employee | 1:N | Un empleado puede supervisar a varios empleados |
| Employee -> Department | 1:1 | Un empleado puede administrar un departamento |
| Department -> Locations | 1:N | Un departamento puede tener varias ubicaciones |
| Department -> Project | 1:N | Un departamento puede controlar varios proyectos |
| Employee -> Work_On | 1:N | Un empleado puede trabajar en varios proyectos |
| Project -> Work_On | 1:N | Un proyecto puede tener varios empleados trabajando |
| Employee -> Project | M:N | Un empleado puede trabajar en varios proyectos y un proyecto puede tener varios empleados |

## 6. Matriz de Claves Foráneas - Ejemplo Relacional 1

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employee | Jefe | Employee(Ssn) |
| Employee | NameProyect | Project(Name) |
| Employee | NumberProyect | Project(Number) |
| Department | Ssn | Employee(Ssn) |
| Locations | NumDepartment | Department(Number) |
| Project | NumerProyect | Department(Number) |
| Work_On | Ssn | Employee(Ssn) |
| Work_On | NumPro | Project(Number) |
| Work_On | NumberPro | Project(Number) |
| Dependent | Ssn | Employee(Ssn) |

---

# 7. Diccionario de datos - Ejemplo Relacional 2

## **Tabla:** _Employee_  
**Descripción:**  
Almacena la información general de los empleados.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumEmploy | INT | - | PK, AI, NN | Identificador único del empleado |
| Ssn | VARCHAR | 20 | UQ, NN | Número de seguridad social del empleado |
| Firstname | VARCHAR | 50 | NN | Nombre del empleado |
| Lastname | VARCHAR | 50 | NN | Apellido del empleado |
| Bdate | DATE | - | NN | Fecha de nacimiento del empleado |
| Address | VARCHAR | 150 | NN | Dirección del empleado |
| Salary | DECIMAL | 10,2 | NN, CHK (>0) | Salario del empleado |
| Sex | CHAR | 1 | NN | Sexo del empleado |
| NumberProject | INT | - | FK, NN | Identificador del proyecto relacionado |
| Jefe | INT | - | FK, NN | Identificador del empleado jefe o supervisor |

---

## **Tabla:** _Department_  
**Descripción:**  
Almacena la información de los departamentos de la empresa.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Manager | INT | - | PK, UQ, NN | Identificador del empleado administrador del departamento |
| Number | INT | - | PK, NN | Número identificador del departamento |
| Name | VARCHAR | 100 | NN | Nombre del departamento |
| StartDate | DATE | - | NN | Fecha de inicio del administrador del departamento |

---

## **Tabla:** _Locations_  
**Descripción:**  
Almacena las ubicaciones relacionadas con cada departamento.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumLocation | INT | - | PK, AI, NN | Identificador único de la ubicación |
| NumDepartment | INT | - | FK, NN | Número del departamento al que pertenece la ubicación |
| Location | VARCHAR | 100 | NN | Ubicación del departamento |

---

## **Tabla:** _Project_  
**Descripción:**  
Almacena la información de los proyectos de la empresa.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumberProject | INT | - | PK, AI, NN | Identificador único del proyecto |
| NumberDependent | INT | - | FK, NN | Identificador del dependiente relacionado |
| Location | VARCHAR | 100 | NN | Ubicación donde se desarrolla el proyecto |

---

## **Tabla:** _Work_On_  
**Descripción:**  
Almacena la relación entre empleados y proyectos, indicando las horas trabajadas.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumEmploy | INT | - | FK, NN | Identificador del empleado que trabaja en el proyecto |
| NumberProject | INT | - | FK, NN | Identificador del proyecto asignado |
| Hours | DECIMAL | 5,2 | NN, CHK (>=0) | Horas trabajadas por el empleado en el proyecto |

---

## **Tabla:** _Dependent_  
**Descripción:**  
Almacena la información de los dependientes registrados por cada empleado.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumberDependent | INT | - | PK, AI, NN | Identificador único del dependiente |
| Name | VARCHAR | 100 | NN | Nombre del dependiente |
| NumberEmploy | INT | - | FK, NN | Identificador del empleado al que pertenece el dependiente |
| Sex | CHAR | 1 | NN | Sexo del dependiente |
| Bdate | DATE | - | NN | Fecha de nacimiento del dependiente |
| Relationship | VARCHAR | 50 | NN | Relación del dependiente con el empleado |

---

# 8. Relaciones en la base de datos - Ejemplo Relacional 2

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Employee -> Dependent | 1:N | Un empleado puede tener varios dependientes |
| Employee -> Employee | 1:N | Un empleado puede supervisar a varios empleados |
| Employee -> Department | 1:1 | Un empleado puede administrar un departamento |
| Department -> Locations | 1:N | Un departamento puede tener varias ubicaciones |
| Employee -> Work_On | 1:N | Un empleado puede trabajar en varios proyectos |
| Project -> Work_On | 1:N | Un proyecto puede tener varios empleados trabajando |
| Employee -> Project | M:N | Un empleado puede trabajar en varios proyectos y un proyecto puede tener varios empleados |
| Dependent -> Project | 1:N | Un dependiente puede estar relacionado con varios proyectos según el modelo relacional mostrado |

## 9. Matriz de Claves Foráneas - Ejemplo Relacional 2

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employee | NumberProject | Project(NumberProject) |
| Employee | Jefe | Employee(NumEmploy) |
| Department | Manager | Employee(NumEmploy) |
| Locations | NumDepartment | Department(Number) |
| Project | NumberDependent | Dependent(NumberDependent) |
| Work_On | NumEmploy | Employee(NumEmploy) |
| Work_On | NumberProject | Project(NumberProject) |
| Dependent | NumberEmploy | Employee(NumEmploy) |

---

# 10. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un empleado con un jefe inexistente |
| IR-02 | No se puede registrar un departamento con un administrador inexistente |
| IR-03 | No se puede registrar una ubicación con un departamento inexistente |
| IR-04 | No se puede registrar un proyecto con una referencia inexistente |
| IR-05 | No se puede registrar trabajo en un proyecto con un empleado inexistente |
| IR-06 | No se puede registrar trabajo en un proyecto inexistente |
| IR-07 | No se puede registrar un dependiente con un empleado inexistente |
| IR-08 | No se puede eliminar un empleado si tiene dependientes, proyectos o registros relacionados |
| IR-09 | No se puede eliminar un departamento si tiene ubicaciones relacionadas |
| IR-10 | No se puede eliminar un proyecto si tiene registros de trabajo relacionados |

# 11. Reglas de Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un empleado puede tener varios dependientes |
| RN-02 | Un empleado puede supervisar a otros empleados |
| RN-03 | Un empleado puede trabajar en varios proyectos |
| RN-04 | Un proyecto puede tener varios empleados asignados |
| RN-05 | Un departamento puede tener varias ubicaciones |
| RN-06 | Un departamento debe tener un administrador |
| RN-07 | Las horas trabajadas deben ser mayores o iguales a cero |
| RN-08 | El salario del empleado debe ser mayor a cero |
| RN-09 | Un empleado no debe registrarse dos veces en el mismo proyecto |
| RN-10 | Cada dependiente debe estar asociado a un empleado |

## Diagrama Relacional

![Ejercicio Relacional 5](/img/Relacional/EjercicioRelacional5.jpg)

# Diccionario de datos de la base de datos Sistema Académico

## 1. Información General

| Elemento | Valor |
|----------|-------|
| Proyecto | Sistema Académico |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ing. Jesús Eduardo Bernardo Hernández |
| SGBD | SQL Server |

## 2. Descripción de la base de datos

La base de datos administra:

- Alumno
- Alumno_Tel
- Credencial
- Materia
- Cursa
- Profesor
- Depto
- Dependiente
- Proyecto
- Participa

Permite controlar la información de alumnos, materias, profesores, departamentos, credenciales, teléfonos, proyectos y la participación de profesores en proyectos.

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

**Tabla:** _Alumno_  
**Descripción:**  
Almacena la información general de los alumnos registrados.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | VARCHAR | 20 | PK, NN | Matrícula única del alumno |
| pila_nombre | VARCHAR | 50 | NN | Nombre de pila del alumno |
| apellido_paterno | VARCHAR | 50 | NN | Apellido paterno del alumno |
| apellido_materno | VARCHAR | 50 | - | Apellido materno del alumno |
| correo | VARCHAR | 100 | NN, UQ | Correo electrónico del alumno |

---

**Tabla:** _Alumno_Tel_  
**Descripción:**  
Almacena los números telefónicos asociados a cada alumno.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_telefono | INT | - | PK, AI, NN | Identificador único del teléfono |
| matricula | VARCHAR | 20 | FK, NN | Matrícula del alumno al que pertenece el teléfono |
| numero_telefono | VARCHAR | 20 | NN | Número telefónico del alumno |

---

**Tabla:** _Credencial_  
**Descripción:**  
Almacena la información de la credencial asignada a cada alumno.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_credencial | VARCHAR | 20 | PK, NN | Número único de la credencial |
| fecha_inscripcion | DATE | - | NN | Fecha de inscripción registrada en la credencial |
| matricula | VARCHAR | 20 | FK, UQ, NN | Matrícula del alumno dueño de la credencial |

---

**Tabla:** _Materia_  
**Descripción:**  
Almacena la información de las materias registradas.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| clave_materia | VARCHAR | 20 | PK, NN | Clave única de la materia |
| nombre_materia | VARCHAR | 100 | NN | Nombre de la materia |
| id_profesor | VARCHAR | 20 | FK, NN | Identificador del profesor que imparte la materia |

---

**Tabla:** _Cursa_  
**Descripción:**  
Almacena la relación entre alumnos y materias cursadas.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | VARCHAR | 20 | PK, FK, NN | Matrícula del alumno inscrito |
| clave_materia | VARCHAR | 20 | PK, FK, NN | Clave de la materia cursada |
| fecha_inscripcion | DATE | - | NN | Fecha en la que el alumno se inscribió a la materia |
| calif_final | DECIMAL | 4,2 | CHK (>=0 AND <=10) | Calificación final obtenida por el alumno |

---

**Tabla:** _Depto_  
**Descripción:**  
Almacena la información de los departamentos académicos.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_depto | VARCHAR | 20 | PK, NN | Número único del departamento |
| nombre | VARCHAR | 100 | NN | Nombre del departamento |
| edificio | VARCHAR | 50 | - | Edificio donde se ubica el departamento |

---

**Tabla:** _Profesor_  
**Descripción:**  
Almacena la información general de los profesores.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_profesor | VARCHAR | 20 | PK, NN | Identificador único del profesor |
| pila_nombre | VARCHAR | 50 | NN | Nombre de pila del profesor |
| apellido_paterno | VARCHAR | 50 | NN | Apellido paterno del profesor |
| apellido_materno | VARCHAR | 50 | - | Apellido materno del profesor |
| num_depto | VARCHAR | 20 | FK, NN | Número del departamento al que pertenece el profesor |

---

**Tabla:** _Dependiente_  
**Descripción:**  
Almacena la información de los dependientes asociados a cada profesor.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_dependiente | INT | - | PK, AI, NN | Identificador único del dependiente |
| nombre | VARCHAR | 100 | NN | Nombre del dependiente |
| fecha_naci | DATE | - | - | Fecha de nacimiento del dependiente |
| parentesco | VARCHAR | 50 | - | Parentesco del dependiente con el profesor |
| id_profesor | VARCHAR | 20 | FK, NN | Identificador del profesor al que pertenece el dependiente |

---

**Tabla:** _Proyecto_  
**Descripción:**  
Almacena la información de los proyectos registrados.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_proyecto | VARCHAR | 20 | PK, NN | Número único del proyecto |
| nombre_proyecto | VARCHAR | 100 | NN | Nombre del proyecto |
| presupuesto | DECIMAL | 12,2 | CHK (>=0) | Presupuesto asignado al proyecto |

---

**Tabla:** _Participa_  
**Descripción:**  
Almacena la relación entre profesores y proyectos en los que participan.

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_profesor | VARCHAR | 20 | PK, FK, NN | Identificador del profesor que participa en el proyecto |
| num_proyecto | VARCHAR | 20 | PK, FK, NN | Número del proyecto en el que participa el profesor |
| fecha_inicio | DATE | - | NN | Fecha en la que inició la participación del profesor |
| rol | VARCHAR | 50 | NN | Rol que desempeña el profesor dentro del proyecto |

---

## 5. Relaciones en la base de datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Alumno -> Alumno_Tel | 1:N | Un alumno puede tener varios números telefónicos |
| Alumno -> Credencial | 1:1 | Un alumno posee una sola credencial |
| Alumno -> Cursa | 1:N | Un alumno puede cursar varias materias |
| Materia -> Cursa | 1:N | Una materia puede ser cursada por varios alumnos |
| Alumno -> Materia | M:N | Un alumno puede cursar varias materias y una materia puede tener varios alumnos |
| Profesor -> Materia | 1:N | Un profesor puede impartir varias materias |
| Depto -> Profesor | 1:N | Un departamento puede tener varios profesores |
| Profesor -> Dependiente | 1:N | Un profesor puede tener varios dependientes |
| Profesor -> Participa | 1:N | Un profesor puede participar en varios proyectos |
| Proyecto -> Participa | 1:N | Un proyecto puede tener varios profesores participantes |
| Profesor -> Proyecto | M:N | Un profesor puede participar en varios proyectos y un proyecto puede tener varios profesores |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Alumno_Tel | matricula | Alumno(matricula) |
| Credencial | matricula | Alumno(matricula) |
| Cursa | matricula | Alumno(matricula) |
| Cursa | clave_materia | Materia(clave_materia) |
| Materia | id_profesor | Profesor(id_profesor) |
| Profesor | num_depto | Depto(num_depto) |
| Dependiente | id_profesor | Profesor(id_profesor) |
| Participa | id_profesor | Profesor(id_profesor) |
| Participa | num_proyecto | Proyecto(num_proyecto) |

## 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un teléfono con una matrícula inexistente |
| IR-02 | No se puede registrar una credencial con una matrícula inexistente |
| IR-03 | No se puede registrar una inscripción en Cursa con un alumno inexistente |
| IR-04 | No se puede registrar una inscripción en Cursa con una materia inexistente |
| IR-05 | No se puede registrar una materia con un profesor inexistente |
| IR-06 | No se puede registrar un profesor con un departamento inexistente |
| IR-07 | No se puede registrar un dependiente con un profesor inexistente |
| IR-08 | No se puede registrar una participación con un profesor inexistente |
| IR-09 | No se puede registrar una participación con un proyecto inexistente |
| IR-10 | No se puede eliminar un alumno si tiene teléfonos, credencial o materias cursadas relacionadas |
| IR-11 | No se puede eliminar un profesor si tiene materias, dependientes o proyectos relacionados |
| IR-12 | No se puede eliminar un proyecto si tiene profesores participantes relacionados |

## 8. Reglas de Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede tener uno o varios teléfonos registrados |
| RN-02 | Un alumno debe tener una sola credencial |
| RN-03 | Un alumno puede cursar varias materias |
| RN-04 | Una materia puede ser cursada por varios alumnos |
| RN-05 | Un alumno no puede inscribirse dos veces a la misma materia |
| RN-06 | Una materia debe ser impartida por un profesor |
| RN-07 | Un profesor pertenece a un solo departamento |
| RN-08 | Un departamento puede tener varios profesores |
| RN-09 | Un profesor puede tener varios dependientes |
| RN-10 | Un profesor puede participar en varios proyectos |
| RN-11 | Un proyecto puede tener varios profesores participantes |
| RN-12 | La calificación final debe estar en un rango de 0 a 10 |
| RN-13 | El presupuesto de un proyecto debe ser mayor o igual a cero |
| RN-14 | Un profesor no puede registrarse dos veces en el mismo proyecto |

### Diagrama Relacional

![Ejercicio Relacional 6](/img/Relacional/EjercicioRelacional6.jpeg)