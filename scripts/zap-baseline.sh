#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo 'Usage : bash scripts/zap-baseline.sh "https://<url-cible>"'
  exit 1
fi

TARGET_URL="$1"
SPIDER_MINUTES="${SPIDER_MINUTES:-2}"
REPORT_DIR="reports"
REPORT_FILE="baseline-report.html"

mkdir -p "${REPORT_DIR}" .zap/wrk
chmod -R 777 "${REPORT_DIR}" .zap || true

echo "[INFO] Cible : ${TARGET_URL}"
echo "[INFO] Baseline scan avec spider limité à ${SPIDER_MINUTES} minute(s)."

docker run --rm   -v "$(pwd)/${REPORT_DIR}:/zap/wrk/:rw"   ghcr.io/zaproxy/zaproxy:stable   zap-baseline.py -t "${TARGET_URL}" -m "${SPIDER_MINUTES}" -r "${REPORT_FILE}"

echo "[OK] Rapport généré : ${REPORT_DIR}/${REPORT_FILE}"
