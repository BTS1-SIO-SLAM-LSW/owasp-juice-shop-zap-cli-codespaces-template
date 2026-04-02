#!/usr/bin/env bash
set -euo pipefail

if [ -n "${CODESPACE_NAME:-}" ] && [ -n "${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-}" ]; then
  echo "URL probable de OWASP Juice Shop :"
  echo "https://${CODESPACE_NAME}-3000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
  echo
  echo "URL probable de ZAP Webswing :"
  echo "https://${CODESPACE_NAME}-8090.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}/zap"
  echo
  echo "Vérifiez aussi l'onglet Ports de Codespaces, qui reste la source la plus fiable."
else
  echo "Variables Codespaces non détectées. Ouvrez l'onglet Ports pour récupérer les URLs publiques."
fi
