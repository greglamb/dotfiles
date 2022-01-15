#!/usr/bin/env cat

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

OR

sudo port install git-delta

# exa

sudo port install exa

OR

sudo apt install exa

# bat

sudo port install bat

OR

sudo apt install bat

# fx

npm install -g fx

# duf

sudo port install duf

OR

?

# htop

sudo port install htop

# httpie

port install httpie

# viu

sudi port install viu

# glow

sudo port install glow

# lazydocker

sudo port install lazydocker
