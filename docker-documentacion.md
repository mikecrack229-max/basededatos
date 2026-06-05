# Documentacion de contenedores Docker de Sistemas de Base de Datos
![Imagen Docker](./img/Gemini_Generated_Image_tdka8vtdka8vtdka.png)

## Contenedor de tutorial de Docker
docker pull docker/getting-started

docker run -d -p

- -d detach (El proceso del contenedor se ejecuta en background)
- -p (port, publish) (Mapea el puerto)

## Contenedor del DBMS MariaDB
docker pull mariadb

## Contenedor de MariaDB sin volumen
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -p 3345:3306 e0236

## contenedor de mariadb con volumen
docker run --name ServerMariaDB -e MARIADB_ROOT_PASSWORD=123456 \
-d -v v-mariadbg2:/var/lib/mysql -p 3345:3306 e0236

## Contenedor de Postegress con volumen
docker run --name ServerPostgres -e POSTGRESS_PASSWORD=123456 -p 5457:5532 -v v-postgresg2:/var/lib/postgresql/data eba8d

## Contenedor de SQLServer 2022 con Volumen
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
   -u 0 \
   -p 1452:1433 --name SQLServerG2 \
   -d -v v-sqlserverg2:/var/opt/mssql/data \
   d01cc

## comandos docker

| Comando | Descripcion |
| :--- | :--- |
| docker pull nombre_imagen | **Descarga una imageb de dockerhub** [Docker Hub](https://hub.docker.com/) |
| docker images | **Visualizar las imagenes que se encuentran en el docker** |
| docker ps | **Visualizar todos los contenedores que estan encendidos** |
| docker ps -a | **Visualiza todos los contenedores que estan encendidos o y apagados** |
| docker stop idcontenedor o nombre| **detiene un contenedor** |
| docker start ide contenedor o nombre contenedor | **Enciende un contenedor** |
| docker rm| **borra el contenedor** |
| docker rm -f | **elimina un contenedor este encendido o no** |
| docker volume | **ll** |
| docker images | **Visualizar las imagenes que se encuentran en el docker** |
| docker images | **Visualizar las imagenes que se encuentran en el docker** |