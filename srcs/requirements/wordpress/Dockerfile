FROM wordpress:php8.1-fpm

# Copie des fichiers WordPress (partie qui change souvent - à la fin)
COPY ./requirements/wordpress/sources /var/www/html

# Configuration des permissions
RUN chown -R www-data:www-data /var/www/html
