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
