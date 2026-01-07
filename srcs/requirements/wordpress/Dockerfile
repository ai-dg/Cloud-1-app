FROM wordpress:php8.1-fpm

# Copier TES fichiers WordPress
COPY ./requirements/wordpress/sources /var/www/html

RUN chown -R www-data:www-data /var/www/html