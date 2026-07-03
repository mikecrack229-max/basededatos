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
