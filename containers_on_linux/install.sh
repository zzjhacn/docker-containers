#!/bin/sh

[ -z "$1" ] && echo "Usage: $0 [name]" && exit 1

base_dir=/opt/docker

mkdir -p $base_dir/conf/$1
mkdir -p $base_dir/data/$1/data $base_dir/data/$1/config $base_dir/data/$1/certs
