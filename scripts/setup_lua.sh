#! /bin/bash

# Fail the entire script if anything fails
set -eufo pipefail

BUILD_DIR="/tmp/building"
INST_DIR="/usr/local"
RESTY_INST_DIR="/opt/openresty"
ROCKS_VERSION="2.3.0"
RESTY_VERSION="1.9.7.3"

# Dependencies
echo ""
echo "=====Installing Dependencies====="
echo ""
sudo apt-get -y install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential git

# Folders
echo ""
echo "=====Creating folders====="
echo ""
mkdir -p "$BUILD_DIR"
mkdir -p "$INST_DIR"
mkdir -p "$RESTY_INST_DIR"

# Get the latest LuaJIT from Github
echo ""
echo "=====Downloading LuaJIT====="
echo ""
cd "$BUILD_DIR"
git clone https://github.com/LuaJIT/LuaJIT LuaJIT
cd LuaJIT
git checkout v2.1

# Compile (Forces the INSTALL_TNAME to be luajit)
echo ""
echo "=====Making LuaJIT====="
echo ""
perl -i -pe "s/INSTALL_TNAME=.+/INSTALL_TNAME= luajit/" Makefile
make
make install PREFIX="$INST_DIR"

# Symlink & Test
ln -s /usr/local/bin/luajit /usr/local/bin/lua
lua -v
echo ""
echo "=====LuaJIT Installed====="
echo ""

# Download & Compile Luarocks
echo ""
echo "=====Downloading LuaRocks====="
echo ""
cd "$BUILD_DIR"
curl --location "http://luarocks.org/releases/luarocks-$ROCKS_VERSION.tar.gz" | tar xz
cd luarocks-$ROCKS_VERSION

echo ""
echo "=====Making LuaRocks====="
echo ""
./configure --lua-suffix=jit --with-lua-include="$INST_DIR/include/luajit-2.1" --prefix="$INST_DIR"
make build
make install

# Test
luarocks --version
echo ""
echo "=====LuaRocks Installed====="
echo ""

# Download & Compile OpenResty
echo ""
echo "=====Downloading OpenResty====="
echo ""
cd "$BUILD_DIR"
curl --location "https://openresty.org/download/openresty-$RESTY_VERSION.tar.gz" | tar xz
cd openresty-$RESTY_VERSION

echo ""
echo "=====Making OpenResty====="
echo ""
./configure --prefix="$RESTY_INST_DIR" --with-luajit
make
make install

# Symlink & Test
ln -s "$RESTY_INST_DIR/nginx/sbin/nginx" "/usr/local/sbin/nginx"
ln -s "$RESTY_INST_DIR/bin/resty" "/usr/local/bin/resty"
nginx -v
resty -V
echo ""
echo "=====OpenResty Installed====="
echo ""

# Install Sailor
echo ""
echo "=====Installing Sailor====="
echo ""
luarocks install sailor

# Cleanup
cd "$INST_DIR"
rm -rf "$BUILD_DIR"
echo "Done!"
