#!/data/data/com.termux/files/usr/bin/bash

# Auto update and install dependencies
pkg update -y && pkg upgrade -y
pkg install -y wget git proot tar

# Setup mining directory
mkdir -p ~/xmr_mine && cd ~/xmr_mine

# Download XMRig (Android compatible)
if [ ! -f xmrig ]; then
  echo "[*] Downloading XMRig..."
  wget https://github.com/monero-ocean/xmrig/releases/latest/download/xmrig-static-arm64.tar.gz -O xmrig.tar.gz
  tar -xvf xmrig.tar.gz
  mv xmrig* xmrig
  chmod +x xmrig
fi

# Create config
cat > config.json <<EOF
{
  "autosave": true,
  "cpu": {
    "enabled": true,
    "priority": 5,
    "max-threads-hint": 100,
    "asm": true
  },
  "pools": [
    {
      "url": "gulf.moneroocean.stream:10128",
      "user": "434LZoXbGH6Dy4mMkdPRqE49WFadJRv1AVJzhwy7ubM2DLSMfyNMvVs5MYwwoyWHEjPpLNTB7jZyhUEBExJ5q3eTBUixut5",
      "keepalive": true,
      "tls": false
    }
  ]
}
EOF

# Full CPU performance using Termux's task priority tools (if possible)
renice -20 $$ > /dev/null 2>&1

# Start mining with full performance
echo "[*] Starting mining..."
./xmrig --config=config.json
