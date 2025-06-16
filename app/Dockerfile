# Dockerfile
FROM php:7.4-apache

# Set timezone
ENV TZ=Asia/Jakarta

# Install ekstensi PHP yang umum dibutuhkan
RUN apt-get update && apt-get install -y \
    zip unzip libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libxml2-dev libicu-dev \
    && docker-php-ext-install mysqli pdo_mysql gd intl \
    && docker-php-ext-enable mysqli pdo_mysql

# Aktifkan mod_rewrite Apache
RUN a2enmod rewrite

# Salin source code ke direktori web Apache
COPY siakad/ /var/www/html/

# Set permission agar Apache bisa akses
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Set working directory
WORKDIR /var/www/html
