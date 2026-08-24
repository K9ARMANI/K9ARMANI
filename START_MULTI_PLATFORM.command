#!/bin/bash
cd "$(dirname "$0")"
if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required. Install the current LTS version from nodejs.org, then run this again."
  read -n 1 -s -r -p "Press any key to close..."
  exit 1
fi
cd bridge
if [ ! -d node_modules ]; then
  echo "Installing bridge dependency (ws)..."
  npm install
fi
echo "Starting multi-platform LIVE bridge..."
echo "The app will open at http://127.0.0.1:8787"
(sleep 2; open "http://127.0.0.1:8787") &
node server.js
