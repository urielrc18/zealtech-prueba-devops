# Imagen base
FROM php:8.0-fpm as development

# Instalar dependencias adicionales según sea necesario
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo_mysql zip

# Configuración adicional de PHP (si es necesario)
# COPY php.ini /usr/local/etc/php/

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código de la aplicación
COPY app /app

# Exponer el puerto (si es necesario)
# EXPOSE 9000

# Comando por defecto para el contenedor
CMD ["php-fpm"]
