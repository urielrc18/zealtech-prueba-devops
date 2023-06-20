# Imagen base
FROM mysql:8.0 as development

# Variables de entorno para la configuración de MySQL
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Copiar el script de inicialización de la base de datos
COPY init.sql /docker-entrypoint-initdb.d/

# Exponer el puerto (opcional, solo si deseas acceder a MySQL desde fuera del contenedor)
# EXPOSE 3306

# Comando por defecto para el contenedor
CMD ["mysqld"]
