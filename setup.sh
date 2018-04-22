#!/bin/bash

echo Uploading Application container 
docker-compose up -d

echo Copying the configuration example file
docker exec -it docker_php_1 cp .env.example .env

echo Install dependencies
docker exec -it docker_php_1 composer install

echo Generate key
docker exec -it docker_php_1 php artisan key:generate

echo Make migrations
docker exec -it docker_php_1 php artisan migrate

echo Make seeds
docker exec -it docker_php_1 php artisan db:seed

echo Information of new containers
docker ps -a