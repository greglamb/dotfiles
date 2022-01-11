function killalldockeri
    docker rmi -f (docker images -q)
end