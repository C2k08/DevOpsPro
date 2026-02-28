# Instrucciones para ejecutar DevOpsPro

Este documento proporciona instrucciones paso a paso para ejecutar el proyecto DevOpsPro.

## Requisitos previos

Asegúrate de tener instalado:
- Docker
- Docker Compose

## Opción 1: Ejecución con Docker Compose (recomendada)

1. Abre una terminal y navega hasta el directorio del proyecto:
   ```
   cd ruta\hacia\DevOpsPro
   ```

2. Ejecuta el proyecto utilizando Docker Compose:
   ```
   docker-compose up
   ```
   
   Esto iniciará la aplicación y podrás acceder a ella en http://localhost:3000

3. Para ejecutar en segundo plano:
   ```
   docker-compose up -d
   ```

4. Para detener los servicios:
   ```
   docker-compose down
   ```

## Opción 2: Ejecución directa de la aplicación Node.js

Si prefieres ejecutar la aplicación directamente sin Docker:

1. Navega hasta el directorio de la aplicación:
   ```
   cd ruta\hacia\DevOpsPro\app
   ```

2. Instala las dependencias:
   ```
   npm install
   ```

3. Inicia la aplicación:
   ```
   npm start
   ```
   
   O para desarrollo con reinicio automático:
   ```
   npm run dev
   ```

## Verificación

Una vez iniciada la aplicación, puedes verificar que funcione correctamente accediendo a:

- API principal: http://localhost:3000/
- Estado de salud: http://localhost:3000/health

## Solución de problemas

Si encuentras algún problema:

1. Verifica que los puertos no estén siendo utilizados (especialmente el 3000)
2. Asegúrate de que Docker esté funcionando correctamente
3. Revisa los logs con `docker-compose logs`