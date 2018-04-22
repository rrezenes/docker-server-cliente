#!/bin/bash

echo Uploading Application container 
docker-compose up -d

docker exec -it ${PWD##*/}_php_1 cp .env.example .env

echo Install dependencies
docker exec -it ${PWD##*/}_php_1 composer install

echo Generate key
docker exec -it ${PWD##*/}_php_1 php artisan key:generate

echo Make migrations
docker exec -it ${PWD##*/}_php_1 php artisan migrate

echo Make seeds
docker exec -it ${PWD##*/}_php_1 php artisan db:seed

echo Information of new containers
docker ps -a
