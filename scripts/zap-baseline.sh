#!/usr/bin/env bash
set -e

TARGET="$1"

if [ -z "$TARGET" ]; then
  echo "Usage : bash scripts/zap-baseline.sh \"https://<url-publique-du-sut>\""
  exit 1
fi

mkdir -p reports

echo "[INFO] Lancement du baseline scan ZAP sur : $TARGET"

docker run --rm \
  -v "$(pwd)/reports:/zap/wrk:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t "$TARGET" \
  -m 2 \
  -r baseline-report.html \
  -I

echo "[INFO] Rapport généré : reports/baseline-report.html"
