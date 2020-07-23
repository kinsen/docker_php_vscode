FROM php:7.3.8-fpm

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.163.com/debian/ buster main non-free contrib' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian-security buster/updates main' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian/ buster-updates main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian/ buster-backports main non-free contrib' >> /etc/apt/sources.list \
    && apt-get update \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && apt-get install -y --no-install-recommends libfreetype6-dev libjpeg62-turbo-dev libpng-dev libmagickwand-dev libmcrypt-dev libmemcached-dev zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include
RUN docker-php-ext-install -j$(nproc) bcmath calendar exif gettext sockets dba mysqli pcntl pdo_mysql shmop sysvmsg sysvsem sysvshm iconv gd
RUN pecl install imagick-3.4.4 mcrypt-1.0.2 memcached-3.1.3 redis-5.0.2 xdebug-2.7.2 swoole-4.4.3
RUN docker-php-ext-enable imagick mcrypt memcached redis xdebug swoole
RUN docker-php-ext-configure opcache --enable-opcache && docker-php-ext-install opcache