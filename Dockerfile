FROM php:7-fpm
# Install modules
RUN buildDeps="libpq-dev libzip-dev libicu-dev" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install php7.0-gd && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install \
        pdo \
        pdo_pgsql \
        pgsql \
        intl
CMD ["php-fpm"]
