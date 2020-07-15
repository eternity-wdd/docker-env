# base from
FROM php:7.1-fpm-alpine3.9

# 管理者
MAINTAINER 271648298@qq.com

# 安装依赖
RUN apk add  dpkg-dev dpkg g++ gcc zlib-dev libc-dev re2c file pkgconf

# 安装 memcache 和 redis 扩展
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache zlib libmcrypt-dev freetype-dev libjpeg-turbo-dev \
    && docker-php-ext-install mcrypt pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/3.1.6.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis \
    && apk add m4 \
    && apk add autoconf \
    && cd /tmp \
    && curl -sSL -o php7.zip https://github.com/websupport-sk/pecl-memcache/archive/php7.zip \
    && unzip php7 \
    && cd pecl-memcache-php7 \
    && /usr/local/bin/phpize \
    &&  apk add autoconf \
    && apk add --no-cache musl-dev \
    && ./configure --with-php-config=/usr/local/bin/php-config \
    && apk add make \
    && make \
    && make install \
    && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/docker-php-ext-memcache.ini \
    && rm -rf /tmp/pecl-memcache-php7 php7.zip
