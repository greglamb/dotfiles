#!/bin/bash

if [ $# != 1 ]
  then
    echo "remoteadminmongo.sh sshuser@remotehost.com"
    exit
fi

docker pull mrvautin/adminmongo
docker run --rm --name remoteadminmongo -d \
-e PORT=80 \
-p 18082:80 mrvautin/adminmongo
echo
echo starting up - refresh browser if necessary
echo hit Ctrl-C to quit
echo
echo mongodb://admin:@docker.for.mac.localhost:57017
echo
(sleep 3 && open http://localhost:18082)&
ssh $1 -L 57017:127.0.0.1:27017 -N
docker stop remoteadminmongo
