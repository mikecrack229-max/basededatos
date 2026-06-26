# Ejercicios del modelo entidad relacion

## Ejercicio 1

Un hospital registra informacion de sus pacientes: 

>De cada paciente se registra:
- numero de paciente que lo identifica
- nombre
- fecha de nacimiento

>De cada expediente se registra:
- numero de expediente que lo identifica
- fecha de apertura
- tipo de sangre

>Reglas del negocio:

- Cada paciente deb tener exactamente un expediente medico
- Cada expediente medico pertenece a un unico paciente
3; No puede existir un expediente medico sin paciente
4; No puede existir un paciente sin expediente medico

> Que se debe realizar:
- Identificar las entidades
- Identificar atributos
- Dibujar relaciones
- Determinar cardinalidad de las relaciones
- Determinar la participacion de las entidades en las relaciones

![Ejercicio 1](../img/ejercicio1Dia.jpg )

## Ejercicio 2

Una universidad administra profesores y cursos;

> De cada profesor se la almacena

- Numero de Profesor
- Nombre
- Especialidad

> De cada curso se almacena

- Numero de curso
- Nombre del curso
- Creditos

> Reglas del Negocio

1. Un profesor puede impartir varios cursos
2. Un curso solamente puede ser impartido por un profesor
3. Puede existir un profesor que actualmente ni imparta cursos
4. Todo curso debe estar asignado a un profesor

![Ejercicio 2](../img/Ejercicio2B.jpg)

## Ejercicio 3

Una escuela administra alumnos y materias

> De cada alumno se almacena:

- Matricula 
- Nombre
- Semestre

> De cada materia se alamcena:

- Clave de la materia
- Nombre de la materia
- Creditos

> Reglas del negocio

1. Un alumno puede inscribirse en dos materias
2. una materia puede tener muchos alumnos inscritos
3. puede existir una materia sin alumnos inscritos
4. todo alumno debe estar inscrito en almenos una materia
5. de cada inscripcion se desea almacenar:
    - fecha de inscripcion
    - calificacion final
    
Nota: a la relacion nombrarla inscribe

![Ejercicio 3](../img/ejercicio3B.jpg)

## Ejercicio 4

Una empresa dedicada a la ventas al por mayor necesita registrar lo siguiente:

> Para los clientes

- Numero de cliente
- Nombre (el cual es una persona moral)

>Pedidos

- Numero de pedidos
- Fecha de pedidos

> Productos

-Numero de producto
-nombre
-precio

>Reglas del negocio

1. Un cliente puede realizar muchos pedidos
2. cada pedido pertenece a un solo cliente
3. un pedido contine varios productos
4. un producto puede aparecer en muchos pedidos
5. un pedido debe contener al menos un producto
6. un producto puede no haber sido vendido
7. el detalle del pedido no existe sin pedido
8. el detalle del pedido no existe sin producto
9. el detalle almacena la cantidad y el precio de venta

![Ejercicio 4](../img/Ejemplo4B.png)

## Ejercicio 5
Una compañía necesita registrar la siguiente información:

> Para los departamentos

* Número de departamento
* Nombre del departamento, el cual debe ser único
* Ubicación o ubicaciones del departamento
* Empleado que administra el departamento
* Fecha de inicio en la que el empleado comenzó a administrar el departamento

> Para los proyectos

* Número de proyecto
* Nombre del proyecto, el cual debe ser único
* Ubicación del proyecto

> Para los empleados

* Nombre del empleado
* Número de Seguro Social
* Dirección
* Salario
* Sexo o género
* Fecha de nacimiento
* Departamento al que pertenece
* Supervisor directo

> Para los dependientes

* Primer nombre del dependiente
* Sexo
* Fecha de nacimiento
* Relación con el empleado

> Reglas del negocio

1. La compañía está organizada en departamentos.
2. Cada departamento tiene un nombre único y un número único.
3. Cada departamento es administrado por un empleado en particular.
4. Se debe registrar la fecha en la que el empleado comenzó a administrar el departamento.
5. Un departamento puede tener varias ubicaciones.
6. Un departamento controla varios proyectos.
7. Cada proyecto tiene un nombre único, un número único y una sola ubicación.
8. Cada empleado pertenece a un solo departamento.
9. Un empleado puede trabajar en varios proyectos.
10. Un proyecto puede tener varios empleados trabajando en él.
11. Los proyectos en los que trabaja un empleado no necesariamente pertenecen al mismo departamento del empleado.
12. Se debe registrar el número de horas por semana que un empleado trabaja en cada proyecto.
13. Cada empleado puede tener un supervisor directo.
14. El supervisor directo de un empleado también es otro empleado.
15. Se deben registrar los dependientes de cada empleado para fines de seguro.
16. Un empleado puede tener varios dependientes.
17. Cada dependiente pertenece a un solo empleado.
18. De cada dependiente se registra su primer nombre, sexo, fecha de nacimiento y relación con el empleado.

![Ejercicio 5](../img/ejercicio5B.jpeg)