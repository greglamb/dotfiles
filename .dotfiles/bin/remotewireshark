#!/bin/bash

if [ $# != 3 ]
  then
    echo "remotewireshark.sh sshuser@remotehost.com remoteinterface sudopass"
    exit
fi

wireshark -S -l -k -i <(echo $3 | ssh -tt $1 sudo tcpdump -i $2 -s0 -w - '\(!port 22\)' | grep -v sudo)
