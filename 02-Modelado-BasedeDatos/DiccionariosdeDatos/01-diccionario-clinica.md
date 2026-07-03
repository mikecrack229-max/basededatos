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