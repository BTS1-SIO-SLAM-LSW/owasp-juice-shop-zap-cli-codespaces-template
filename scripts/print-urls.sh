#!/usr/bin/env bash
set -euo pipefail

echo "Rappel : dans GitHub Codespaces, ouvrez l'onglet Ports."
echo "Le SUT OWASP Juice Shop écoute sur le port 3000."
echo "L'URL à utiliser dans ZAP n'est pas localhost, mais l'URL publique du port 3000."
echo "Exemple : https://mon-codespace-3000.app.github.dev"
