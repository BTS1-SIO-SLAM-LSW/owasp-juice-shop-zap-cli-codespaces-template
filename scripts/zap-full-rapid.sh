#!/usr/bin/env bash
set -e

TARGET="$1"

if [ -z "$TARGET" ]; then
  echo "Usage : bash scripts/zap-full-rapid.sh \"https://<url-publique-du-sut>\""
  exit 1
fi

mkdir -p reports

echo "[INFO] Lancement du full scan rapide ZAP sur : $TARGET"
echo "[INFO] Ce scan est volontairement limité pour réduire la consommation CPU et mémoire."

docker run --rm \
  -v "$(pwd)/reports:/zap/wrk:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-full-scan.py \
  -t "$TARGET" \
  -m 1 \
  -T 3 \
  -r full-rapid-report.html \
  -I

echo "[INFO] Rapport généré : reports/full-rapid-report.html"
