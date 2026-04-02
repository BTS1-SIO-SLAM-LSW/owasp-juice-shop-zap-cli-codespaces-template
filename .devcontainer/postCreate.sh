#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y jq curl ca-certificates coreutils

mkdir -p /workspaces/$(basename "$PWD")/.zap/wrk
mkdir -p /workspaces/$(basename "$PWD")/reports
chmod -R 777 /workspaces/$(basename "$PWD")/.zap || true
chmod -R 777 /workspaces/$(basename "$PWD")/reports || true

echo "Environnement Codespaces prêt."
echo "Lancez ensuite : bash scripts/start-juice-shop.sh"
echo "Puis : bash scripts/start-zap.sh"
echo "Enfin : bash scripts/zap-baseline.sh "https://<url-publique-du-port-3000>""
