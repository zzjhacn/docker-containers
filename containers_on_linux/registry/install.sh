#!/bin/sh
base_dir=/opt/docker
name=registry

function prepareDir(){
  mkdir -p $base_dir/data/$1/data $base_dir/data/$1/config $base_dir/data/$1/certs
}

mkdir -p $base_dir/conf/$name
prepareDir $name
prepareDir frontend

cp frontend-config.yml $base_dir/data/frontend/config/config.yml
cp registry-config.yml $base_dir/data/$name/config/config.yml

docker-compose up -d
