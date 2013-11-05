#!/bin/bash
cd /var/$1
git pull origin master
composer update
composer install


