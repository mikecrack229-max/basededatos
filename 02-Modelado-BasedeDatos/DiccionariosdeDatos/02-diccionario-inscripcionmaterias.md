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
