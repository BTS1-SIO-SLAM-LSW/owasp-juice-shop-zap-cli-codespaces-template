#!/usr/bin/env bash
set -euo pipefail

mkdir -p reports

TARGET_URL="${TARGET_URL:-http://host.docker.internal:3000}"

echo "[zap-baseline] Cible : ${TARGET_URL}"
echo "[zap-baseline] Génération des rapports dans reports/"

docker run --rm \
  --add-host=host.docker.internal:host-gateway \
  -v "$(pwd)/reports:/zap/wrk/:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t "$TARGET_URL" \
  -r zap-baseline-report.html \
  -J zap-baseline-report.json \
  -w zap-baseline-report.md \
  -m 5

echo "[zap-baseline] Terminé."
