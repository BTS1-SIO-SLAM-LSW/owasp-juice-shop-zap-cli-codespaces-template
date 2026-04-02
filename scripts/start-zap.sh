#!/usr/bin/env bash
set -euo pipefail

mkdir -p .zap/wrk reports
chmod -R 777 .zap reports || true

if docker ps -a --format '{{.Names}}' | grep -q '^zap-webswing$'; then
  echo "[INFO] Un conteneur zap-webswing existe déjà. Suppression pour redémarrage propre..."
  docker rm -f zap-webswing >/dev/null 2>&1 || true
fi

echo "[INFO] Lancement de OWASP ZAP (Webswing)..."
echo "[INFO] Ouvrez ensuite le port 8090 dans l'onglet Ports puis l'URL /zap."
docker run --name zap-webswing   -u zap   -p 8080:8080   -p 8090:8090   -v "$(pwd)/.zap/wrk:/zap/wrk/:rw"   -i ghcr.io/zaproxy/zaproxy:stable   zap-webswing.sh
