chmod 755 "/mnt/c/Users/GLamb/AppData/Local/Programs/Microsoft VS Code/bin/code"
chmod 755 "/mnt/c/Users/GLamb/AppData/Local/Programs/Microsoft VS Code/Code.exe"
find "/mnt/c/Users/GLamb/.vscode/extensions/ms-vscode-remote.remote-wsl-"* -type f -name wslCode.sh -exec chmod 755 {} \;
find "/mnt/c/Users/GLamb/.vscode/extensions/ms-vscode-remote.remote-wsl-"* -type f -name wslDownload.sh -exec chmod 755 {} \;
find "/mnt/c/Users/GLamb/.vscode/extensions/ms-vscode-remote.remote-wsl-"* -type f -name wslServer.sh -exec chmod 755 {} \;
