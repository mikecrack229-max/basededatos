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
