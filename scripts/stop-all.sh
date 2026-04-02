#!/usr/bin/env bash
set -euo pipefail

docker stop juice-shop 2>/dev/null || true
docker rm juice-shop 2>/dev/null || true

echo "Tous les conteneurs du projet ont été arrêtés."
