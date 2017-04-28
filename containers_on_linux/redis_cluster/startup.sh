#!/bin/sh
[ -n "$password" ] && sed -i "s/#requirepass \$password/requirepass $password/g" /conf/redis.conf
sed -i "s/\$port/$port/g" /conf/redis.conf
#ip=`ipaddr show to 172.* scope global | grep inet | awk '{print $2}'|awk -F "/" '{print $1}'`

#[ -n "$ip" ] && echo binding $ip && sed -i "s/\$ip/$ip/g" /conf/redis.conf
echo "listing on port $port"
which redis-server
redis-server /conf/redis.conf
which redis-server
grep port /conf/redis.conf
echo "started"
