#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

echo Get latest version
api_url="https://api.github.com/repos/neovim/neovim/releases/latest"
response=$(curl -s $api_url)
latest_version=$(echo "$response" | jq -r '.tag_name')

echo Set latest version in Dockerfile
sed -i 's/^\(RUN git checkout\).*/\1 '$latest_version'/' Dockerfile

echo Build image $latest_version
docker build -t felipdocker/neovim-arm:$latest_version .

echo Tag as latest too
docker tag felipdocker/neovim-arm:$latest_version felipdocker/neovim-arm:latest

echo Clean up old images
docker image ls | grep none | awk '{print $3}' | xargs -I _ docker rmi _

echo Done
