function killalldocker
    docker rm -f (docker ps -aq)
end