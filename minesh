#!/data/data/com.termux/files/usr/bin/bash

# Update and install dependencies
pkg update -y && pkg upgrade -y
pkg install -y git wget proot clang cmake make openssl ncurses-utils

# Clone XMRig
cd ~
rm -rf xmrig
git clone https://github.com/xmrig/xmrig.git
cd xmrig

# Build XMRig
mkdir build && cd build
cmake .. -DWITH_HWLOC=OFF
make -j$(nproc)

# Run XMRig with your wallet and pool
echo
echo "✅ Build complete. Starting XMRig Miner..."
sleep 2
./xmrig -o gulf.moneroocean.stream:10128 -u 434LZoXbGH6Dy4mMkdPRqE49WFadJRv1AVJzhwy7ubM2DLSMfyNMvVs5MYwwoyWHEjPpLNTB7jZyhUEBExJ5q3eTBUixut5 -k
