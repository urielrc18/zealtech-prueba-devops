# Imagen base
FROM nginx:1.8 as development

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código de la aplicación
COPY app /app

# Copiar la configuración de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponer el puerto
EXPOSE 8008

# Comando por defecto para el contenedor
CMD ["nginx", "-g", "daemon off;"]
