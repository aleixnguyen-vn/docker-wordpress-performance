
FROM wordpress:php8.2-fpm

# Install system dependencies & PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev zip \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libxml2-dev \
    libcurl4-openssl-dev pkg-config libssl-dev libicu-dev \
    build-essential autoconf gcc make \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install pdo_mysql zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

