#!/bin/bash

if [ $# != 1 ]
  then
    echo "remoterediscmdr.sh sshuser@remotehost.com"
    exit
fi

docker pull rediscommander/redis-commander
docker run --rm --name remoterediscmdr -d \
-e REDIS_HOSTS=docker.for.mac.localhost \
-e REDIS_PORT=16379 \
-p 18081:80 rediscommander/redis-commander
echo
echo starting up - refresh browser if necessary
echo hit Ctrl-C to quit
echo
(sleep 3 && open http://localhost:18081)&
ssh $1 -L 16379:127.0.0.1:6379 -N
docker stop remoterediscmdr
