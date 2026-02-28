# Imagen base para desarrollo
FROM node:18-alpine

# Directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias
COPY app/package*.json ./

# Instalar dependencias (incluyendo devDependencies)
RUN npm install

# Exponer puerto
EXPOSE 3000

# Variable de entorno
ENV NODE_ENV=development

# Instalar nodemon globalmente para reinicio automático
RUN npm install -g nodemon

# Comando para ejecutar la aplicación en modo desarrollo
CMD ["nodemon", "index.js"]