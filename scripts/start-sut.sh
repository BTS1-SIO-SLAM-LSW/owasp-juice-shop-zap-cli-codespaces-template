#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Téléchargement éventuel de l'image OWASP Juice Shop..."
docker pull bkimminich/juice-shop >/dev/null

echo "[INFO] Arrêt d'un éventuel conteneur juice-shop existant..."
docker rm -f juice-shop >/dev/null 2>&1 || true

echo "[INFO] Lancement de OWASP Juice Shop sur le port 3000..."
docker run -d --name juice-shop -p 3000:3000 bkimminich/juice-shop >/dev/null

echo "[OK] OWASP Juice Shop est lancé."
echo "[INFO] Dans Codespaces, ouvrez l'onglet Ports et repérez le port 3000."
echo "[INFO] L'URL publique sera de la forme : https://<nom-du-codespace>-3000.app.github.dev"
