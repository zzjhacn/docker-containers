#!/bin/sh
docker build . -t docker.raytest.com/redis-ha && docker-compose up -d
