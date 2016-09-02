FROM php:7.0-fpm

RUN apt-get update && apt-get install -y \
        libpq-dev \
        libzip-dev \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libwebp-dev \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install pgsql \
    && docker-php-ext-install intl \
    && rm -rf /var/lib/apt/lists/*
CMD ["php-fpm"]
