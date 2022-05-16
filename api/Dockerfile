FROM framenetbrasil/php-fpm:8.1
WORKDIR /server
RUN chown www-data:www-data /server
RUN mkdir -p /var/www/.composer/cache
RUN chown www-data:www-data /var/www/.composer/cache

USER www-data

COPY cli.php ./
COPY cli ./cli

COPY app ./app
COPY conf ./conf
COPY composer.json ./

#COPY phinx.php ./
#COPY db ./db
#COPY composer.lock ./
COPY index.php ./

RUN composer install --no-progress
