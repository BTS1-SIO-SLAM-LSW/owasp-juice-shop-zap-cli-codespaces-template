#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage : bash scripts/zap-passive-scan.sh <URL_CIBLE>"
  exit 1
fi

TARGET="$1"
REPORT_DIR="$(pwd)/reports"
mkdir -p "$REPORT_DIR"

echo "[INFO] Lancement du scan passif ZAP sur : $TARGET"
echo "[INFO] Rapport : reports/zap-passive-report.html"

docker run --rm \
  -v "$REPORT_DIR:/zap/wrk:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t "$TARGET" \
  -m 2 \
  -r zap-passive-report.html \
  -I

echo "[OK] Rapport généré : reports/zap-passive-report.html"
