# TestLink (test management tool) for the RTV-QS group.
# Only used to document and run manual test cases. It is not part of the system under test.
FROM php:8.2-apache

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install mysqli gd zip \
 && rm -rf /var/lib/apt/lists/*

# 1.9.20 maintenance release (Dec 2025), tested by the maintainers with PHP 8.x
ARG TESTLINK_VERSION=1.9.20-20251208
RUN curl -fsSL "https://github.com/TestLinkOpenSourceTRMS/testlink-code/archive/refs/tags/${TESTLINK_VERSION}.tar.gz" \
    | tar xz --strip-components=1 -C /var/www/html \
 && mkdir -p /var/testlink/logs /var/testlink/upload_area \
 && chown -R www-data:www-data /var/www/html /var/testlink

# php.ini values recommended by the TestLink README
RUN { echo "max_execution_time=120"; \
      echo "memory_limit=256M"; \
      echo "max_input_vars=10000"; \
      echo "session.gc_maxlifetime=60000"; } > /usr/local/etc/php/conf.d/testlink.ini

# Port 8081, so it does not clash with the Lanchonete (8080)
RUN sed -i 's/^Listen 80$/Listen 8081/' /etc/apache2/ports.conf \
 && sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8081>/' /etc/apache2/sites-available/000-default.conf