FROM php:5.6-apache

MAINTAINER Ondrej Novak "novakondrej@seznam.cz"

RUN a2enmod rewrite vhost_alias

RUN apt-get update && apt-get install -y locales php5-gd php5-sqlite php5-mysql php5-memcache memcached php-gettext gettext libpng12-dev libjpeg-dev libpq-dev imagemagick libxml2-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql zip exif soap \
	&& rm -rvf /usr/local/etc/php/conf.d/docker-php-ext-pdo.ini; \
	rm -rvf /usr/local/etc/php/conf.d/docker-php-ext-curl.ini; \
	rm -rf /tmp/*

COPY php.ini /etc/php5/apache2/conf.d/php.ini
COPY apache2.conf /etc/apache2/apache2.conf

RUN echo cs_CZ.UTF-8 UTF-8  >> /etc/locale.gen
RUN locale-gen

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]