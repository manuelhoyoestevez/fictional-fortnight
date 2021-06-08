# Dot Core Server en Docker

Este documento muestra cómo debe ser cargado Dot Core Server en un contenedor Docker.

## Arranque
Para su ejecución sólo es necesario introducir el comando:
```
$ docker-compose up -d
```
Esto efectuará las siguientes acciones:

1. Creará una imagen llamada `dot-core-server` con el tag `latest`.
2. Arrancará un contenedor de esta imagen con la siguiente configuración:
     - Un volumen para licencia, la cual debe estar situada en la carpeta `local/license`.
     - Un volumen para logs. Para ello debe existir la carpeta `local/logs`.
     - El puerto `8080` del contenedor (donde se arranca la API de Dot Core) mapeado al puerto `8080` de la máquina anfitriona. 

Estos parámetros son configurables modificando el fichero `docker-compose.yaml`.

## Enlaces:
- [Descargas](https://crm.innovatrics.com/client/zone/show/Digital%20Onboarding%20Toolkit)
- [Documentación técnica](https://crm.innovatrics.com/downloads/2084925791/30_Digital%20Onboarding%20Toolkit/DOT%20Core%20Server/Innovatrics_DOT_Core_Server_Technical_Documentation.html)
