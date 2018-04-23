#!/bin/bash

echo Uploading Application container 
docker-compose up -d

docker exec -it php_7 cp .env.example .env

echo Install dependencies
docker exec -it php_7 composer install

echo Generate key
docker exec -it php_7 php artisan key:generate

echo Make migrations
docker exec -it php_7 php artisan migrate

echo Make seeds
docker exec -it php_7 php artisan db:seed

echo Information of new containers
docker ps -a
