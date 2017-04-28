#!/bin/sh
docker build . -t docker.raytest.com/redis-cluster && docker-compose up
#docker run --rm -it --link redis_redis-0_1:redis-0 --link redis_redis-1_1:redis-1 --link redis_redis-2_1:redis-2 --link redis_redis-3_1:redis-3 zvelo/redis-trib create --replicas 1 redis-0:6379 redis-1:6379 redis-2:6379 redis-3:6379
#docker run --rm -it docker.raytest.com/redis-trib create --replicas 1 172.19.0.2:6379 172.19.0.3:6379 172.19.0.4:6379 172.19.0.5:6379 172.19.0.6:6379 172.19.0.7:6379
#docker run --rm -it --link rediscluster_redis-0_1:redis-0 --link rediscluster_redis-1_1:redis-1 --link rediscluster_redis-2_1:redis-2 --link rediscluster_redis-3_1:redis-3 --link rediscluster_redis-4_1:redis-4 --link rediscluster_redis-5_1:redis-5 redis-trib create --replicas 1 172.18.0.2:6379 172.18.0.3:6379 172.18.0.4:6379 172.18.0.5:6379 172.18.0.6:6379 172.18.0.7:6379
#docker run --rm -it inem0o/redis-trib create --replicas 1 127.0.0.1:60379 127.0.0.1:61379 127.0.0.1:62379 127.0.0.1:63379 127.0.0.1:64379 127.0.0.1:65379

#docker run --rm -it redis-trib create --replicas 1 127.0.0.1:60379 127.0.0.1:61379 127.0.0.1:62379 127.0.0.1:63379 127.0.0.1:64379 127.0.0.1:65379

#docker run --rm  zvelo/redis-trib  version
