FROM php:7-fpm
# Install modules
RUN buildDeps="libpq-dev libzip-dev libicu-dev" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install \
        gd \
        pdo \
        pdo_pgsql \
        pgsql \
        intl && \
    && docker-php-ext-configure gd --enable-gd-native-ttf --with-jpeg-dir=/usr/lib/x86_64-linux-gnu --with-png-dir=/usr/lib/x86_64-linux-gnu --with-freetype-dir=/usr/lib/x86_64-linux-gnu \
    && docker-php-ext-install gd \
CMD ["php-fpm"]
