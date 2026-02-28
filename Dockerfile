# Imagen base
FROM node:18-alpine

# Directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias primero para aprovechar la caché de Docker
COPY app/package*.json /app/

# Instalar dependencias
RUN npm ci --only=production

# Copiar el resto de los archivos
COPY app/ /app/

# Exponer puerto
EXPOSE 3000

# Variable de entorno
ENV NODE_ENV=production

# Comando para ejecutar la aplicación
CMD ["npm", "start"]