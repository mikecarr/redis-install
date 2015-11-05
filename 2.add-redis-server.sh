useradd -r -s /bin/false redis
wget -O /etc/init.d/redis-server https://gist.github.com/iJackUA/5336459/raw/4d7e4adfc08899dc7b6fd5d718f885e3863e6652/redis-server-for-init.d-startup
touch /var/run/redis.pid
chown redis:redis /var/run/redis.pid
chmod 755 /etc/init.d/redis-server
