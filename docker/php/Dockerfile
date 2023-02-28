# Use the official PHP 7.3 Apache image as the base image
FROM php:7.3-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install required PHP extensions and Apache modules
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    unzip \
    git \
    vim \
    && docker-php-ext-install -j$(nproc) \
    bcmath \
    gd \
    intl \
    mbstring \
    mysqli \
    opcache \
    pdo_mysql \
    soap \
    xsl \
    zip \
    && a2enmod rewrite \
    && service apache2 restart

# Copy the Magento files to the working directory
COPY . .

# Set the ownership and permissions of the Magento files
RUN chown -R www-data:www-data .
RUN chmod -R 777 .

# Expose port 80 for Apache
EXPOSE 80