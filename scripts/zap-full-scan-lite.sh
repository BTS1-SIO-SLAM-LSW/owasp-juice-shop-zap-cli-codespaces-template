#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo 'Usage : bash scripts/zap-full-scan-lite.sh "https://<url-cible>"'
  exit 1
fi

TARGET_URL="$1"
SPIDER_MINUTES="${SPIDER_MINUTES:-2}"
ACTIVE_SCAN_MAX_MINUTES="${ACTIVE_SCAN_MAX_MINUTES:-6}"
REPORT_DIR="reports"
REPORT_FILE="full-scan-lite-report.html"

mkdir -p "${REPORT_DIR}" .zap/wrk
chmod -R 777 "${REPORT_DIR}" .zap || true

echo "[INFO] Cible : ${TARGET_URL}"
echo "[INFO] Full scan limité : spider=${SPIDER_MINUTES} min, active scan max=${ACTIVE_SCAN_MAX_MINUTES} min."
echo "[INFO] Ce mode est plus coûteux que le baseline scan."

docker run --rm   -v "$(pwd)/${REPORT_DIR}:/zap/wrk/:rw"   ghcr.io/zaproxy/zaproxy:stable   zap-full-scan.py -t "${TARGET_URL}" -m "${SPIDER_MINUTES}" -r "${REPORT_FILE}"   -z "-config spider.maxDuration=${SPIDER_MINUTES} -config ascan.maxScanDurationInMins=${ACTIVE_SCAN_MAX_MINUTES}"

echo "[OK] Rapport généré : ${REPORT_DIR}/${REPORT_FILE}"
