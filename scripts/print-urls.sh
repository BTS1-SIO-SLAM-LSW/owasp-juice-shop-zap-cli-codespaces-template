#!/usr/bin/env bash
cat <<'MSG'
[INFO] Dans GitHub Codespaces :
- ouvrez l'onglet PORTS ;
- repérez le port 3000 ;
- si besoin, rendez-le Public ;
- copiez l'URL publique du type :
  https://<nom-du-codespace>-3000.app.github.dev

Cette URL est celle du SUT (OWASP Juice Shop).
Ne pas utiliser localhost depuis votre machine locale.
MSG
