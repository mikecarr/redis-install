#!/bin/bash

if [ "$(whoami)" != "root" ]; then
 echo "ERROR : Run script as Root (sudo !!) please"
 exit 1
fi

read -e -p "Redis version to be installed (change if needed) : " -i "2.8.8" VERSION
echo 'Installing redis v.'$VERSION' ... '

# installing build essentials if it is missing
apt-get install build-essential

wget http://download.redis.io/releases/redis-$VERSION.tar.gz
tar xzf redis-$VERSION.tar.gz
cd redis-$VERSION
make
make install prefix=/usr/local/bin/
cp redis.conf /etc/redis.conf
cd ..
rm redis-$VERSION -R
rm redis-$VERSION.tar.gz

