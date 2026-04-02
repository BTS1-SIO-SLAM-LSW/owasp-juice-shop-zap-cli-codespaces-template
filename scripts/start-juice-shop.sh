#!/usr/bin/env bash
set -euo pipefail

echo "[juice-shop] Téléchargement / lancement de Juice Shop..."
docker stop juice-shop 2>/dev/null || true
docker rm juice-shop 2>/dev/null || true

docker run -d \
  --name juice-shop \
  -p 3000:3000 \
  bkimminich/juice-shop:latest

echo "[juice-shop] Juice Shop est en cours de démarrage sur le port 3000."
echo "[juice-shop] Vérifie l'onglet PORTS dans Codespaces."
