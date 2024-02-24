#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

docker run --name neovim-build felipdocker/neovim-arm:latest
docker cp neovim-build:/neovim/build/bin/nvim nvim
docker cp neovim-build:/neovim/runtime . 
docker stop neovim-build
docker rm neovim-build

sudo mv nvim /usr/local/bin/
sudo cp -r runtime /usr/share/nvim/
sudo ln -s /usr/share/nvim /usr/local/share/nvim

if [[ "$2" == "nvchad" ]]
  then
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
fi

