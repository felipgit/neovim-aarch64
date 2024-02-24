FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \
    git

# Clone Neovim repository
RUN git clone https://github.com/neovim/neovim.git /neovim
WORKDIR /neovim
RUN git checkout v0.9.5

# Compile Neovim
RUN make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/usr/local" -j4

