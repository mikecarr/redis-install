#!/bin/bash

if [ "$(whoami)" != "root" ]; then
 echo "ERROR : Run script as Root (sudo !!) please"
 exit 1
fi

read -e -p "php_redis version to be installed (change if needed) : " -i "2.2.5" VERSION
echo 'Installing php_redis v.'$VERSION' ... '

# installing build essentials if it is missing
apt-get install php5-dev php-pear

wget https://github.com/nicolasff/phpredis/archive/$VERSION.tar.gz
tar xzf $VERSION.tar.gz
cd phpredis-$VERSION
phpize
./configure
make
make install
cd ..
rm phpredis-$VERSION -R
rm $VERSION.tar.gz

mv /etc/php5/mods-available/redis.ini /etc/php5/mods-available/redis.bkp
touch /etc/php5/mods-available/redis.ini
echo "extension=redis.so" > /etc/php5/mods-available/redis.ini
ln -s /etc/php5/mods-available/redis.ini /etc/php5/apache2/conf.d/redis.ini
ln -s /etc/php5/mods-available/redis.ini /etc/php5/cli/conf.d/redis.ini

service apache2 restart

