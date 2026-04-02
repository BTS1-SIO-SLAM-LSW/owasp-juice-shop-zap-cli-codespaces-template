#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage : bash scripts/zap-full-scan-fast.sh <URL_CIBLE>"
  exit 1
fi

TARGET="$1"
REPORT_DIR="$(pwd)/reports"
mkdir -p "$REPORT_DIR"

echo "[INFO] Lancement du full scan rapide ZAP sur : $TARGET"
echo "[INFO] Paramètres de réduction de charge : spider court, pas d'AJAX spider, durée totale bornée."
echo "[INFO] Rapport : reports/zap-full-fast-report.html"

docker run --rm \
  -v "$REPORT_DIR:/zap/wrk:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-full-scan.py \
  -t "$TARGET" \
  -m 2 \
  -j \
  -T 5 \
  -r zap-full-fast-report.html \
  -I

echo "[OK] Rapport généré : reports/zap-full-fast-report.html"
