sudo cp wsl.conf /etc/
# wsl --shutdown
ln -s /mnt/c/Users/GLamb/Repositories ~/Repositories
ln -s /mnt/c/Users/GLamb/source/repos ~/VSRepositories

cp /mnt/c/windows/explorer.exe /mnt/c/Users/GLamb/bin/
chmod 755 /mnt/c/Users/GLamb/bin/explorer.exe
ln -s /mnt/c/Users/GLamb/bin/explorer.exe ~/bin/explorer.exe

cp /mnt/c/windows/system32/cmd.exe /mnt/c/Users/GLamb/bin/
chmod 755 /mnt/c/Users/GLamb/bin/cmd.exe
ln -s /mnt/c/Users/GLamb/bin/cmd.exe ~/bin/cmd.exe