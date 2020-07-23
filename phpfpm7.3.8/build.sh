#!/bin/bash

BASEDIR=$(dirname "$0")

# 清除已有的
docker container ls --all|grep 'my-php-fpm:7.3.8'|awk '{print $1 }'|xargs docker rm -f
docker images|grep 'my-php-fpm:7.3.8'|awk '{print $3 }'|xargs docker rmi

# 重新生成
docker build -f ${BASEDIR}/Dockerfile -t my-php-fpm:7.3.8 ${BASEDIR}
