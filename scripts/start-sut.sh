#!/usr/bin/env bash
set -e

echo "[INFO] Démarrage de OWASP Juice Shop..."
docker compose up -d

echo "[INFO] Juice Shop a été lancé."
echo "[INFO] Ouvrez l'onglet PORTS de Codespaces et récupérez l'URL publique du port 3000."
