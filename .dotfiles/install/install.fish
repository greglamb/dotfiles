#!/usr/bin/env fish

source ../fish/source/detect-os.fish

# install shell

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install ilancosman/tide
#tide configure

# install node

fisher install jorgebucaran/nvm.fish
nvm install lts
npm i -g zx

# install delta

wget https://github.com/dandavison/delta/releases/download/0.11.3/git-delta_0.11.3_arm64.deb /tmp/
sudo apt install /tmp/git-delta_0.11.3_arm64.deb
