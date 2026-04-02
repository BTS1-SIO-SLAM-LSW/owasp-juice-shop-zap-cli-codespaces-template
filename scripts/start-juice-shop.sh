#!/usr/bin/env bash
set -euo pipefail

PORT="${JUICE_SHOP_PORT:-3000}"
CONTAINER_NAME="juice-shop"
IMAGE="bkimminich/juice-shop"

if docker ps -a --format '{{.Names}}' | grep -q '^'"${CONTAINER_NAME}"'$'; then
  echo "[INFO] Un conteneur ${CONTAINER_NAME} existe déjà. Suppression pour redémarrage propre..."
  docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true
fi

echo "[INFO] Lancement de OWASP Juice Shop sur le port ${PORT}..."
docker run --name "${CONTAINER_NAME}" -p "${PORT}:3000" --rm "${IMAGE}"
