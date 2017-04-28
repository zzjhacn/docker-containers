#!/bin/sh
cd /conf
redis_role=$1
echo $redis_role
if [ $redis_role = "master" ] ; then
    echo "master"
    sed -i "s/\$port/$port/g" redis.conf
    [ -n "$password" ] && sed -i "s/#requirepass \$password/requirepass $password/g" redis.conf
    redis-server /conf/redis.conf
elif [ $redis_role = "slave" ] ; then
    echo "slave"
    sed -i "s/\$port/$port/g" redis.conf
    [ -n "$password" ] && sed -i "s/#requirepass \$password/requirepass $password/g" redis.conf
    [ -n "$master_password" ] && sed -i "s/#masterauth \$master_password/masterauth $master_password/g" redis.conf
    sed -i "s/#slaveof \$master_host \$master_port/slaveof $master_host $master_port/g" redis.conf
    redis-server /conf/redis.conf
elif [ $redis_role = "sentinel" ] ; then
    echo "sentinel"
    sed -i "s/\$sentinel_port/$sentinel_port/g" /conf/sentinel.conf
    sed -i "s/\$master_port/$master_port/g" /conf/sentinel.conf
    sed -i "s/\$master_host/$master_host/g" /conf/sentinel.conf
    redis-sentinel /conf/sentinel.conf
else
    echo "unknow role!"
fi     #ifend
