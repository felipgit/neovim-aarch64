# Build Neovim for ARM64 (aarch64)
This will download and install latest tag from neovim repo and build binary for ARM64/aarch64 ubuntu.  
Tested with Oracle Cloud instance.
## Build
```bash
git clone https://github.com/felipgit/neovim-aarch64.git
cd neovim-aarch64
./build.sh
```
## Install
Only install nvim
```bash
./install.sh
```
Alternative with nvchad too:
```bash
./install.sh nvchad
```
