FROM php:8.1-apache

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions pdo_mysql intl zip

RUN apt-get update && apt-get install -y \
    unzip \
    p7zip-full

RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
   mv composer.phar /usr/local/bin/composer

# Maintenant le Dockerfile est à la racine, ajustez le chemin d'accès pour le fichier apache.conf
COPY ./docker/apache.conf /etc/apache2/sites-available/000-default.conf
    
WORKDIR /var/www/

# Ajustez le chemin d'accès pour le script docker.sh
ENTRYPOINT ["bash", "./docker/docker.sh"]

EXPOSE 80
