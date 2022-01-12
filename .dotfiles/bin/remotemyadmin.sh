#!/bin/bash

if [ $# != 1 ]
  then
    echo "remotemyadmin.sh sshuser@remotehost.com"
    exit
fi

docker pull phpmyadmin/phpmyadmin
docker run --rm --name remotemyadmin -d \
-e PMA_HOST=docker.for.mac.localhost \
-e PMA_PORT=13306 \
-p 18080:80 phpmyadmin/phpmyadmin
echo
echo starting up - refresh browser if necessary
echo hit Ctrl-C to quit
echo
(sleep 3 && open http://localhost:18080)&
ssh $1 -L 13306:127.0.0.1:3306 -N
docker stop remotemyadmin
