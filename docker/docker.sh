#!/bin/bash

cd /var/www && \
    composer install && \
    composer require symfony/apache-pack && \
#    php bin/console doctrine:migrations:diff && \
#    php bin/console doctrine:migrations:migrate && \
    exec apache2-foreground