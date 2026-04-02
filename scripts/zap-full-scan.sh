#!/usr/bin/env bash
set -euo pipefail

mkdir -p reports

TARGET_URL="${TARGET_URL:-http://host.docker.internal:3000}"

echo "[zap-full] Cible : ${TARGET_URL}"
echo "[zap-full] Génération des rapports dans reports/"

docker run --rm \
  --add-host=host.docker.internal:host-gateway \
  -v "$(pwd)/reports:/zap/wrk/:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-full-scan.py \
  -t "$TARGET_URL" \
  -r zap-full-report.html \
  -J zap-full-report.json \
  -w zap-full-report.md \
  -m 5

echo "[zap-full] Terminé."
