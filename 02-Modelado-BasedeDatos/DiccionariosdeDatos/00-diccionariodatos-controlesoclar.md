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
