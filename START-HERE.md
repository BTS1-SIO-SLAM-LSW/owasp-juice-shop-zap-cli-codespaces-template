# Démarrage rapide

1. Ouvrez ce dépôt dans GitHub Codespaces.
2. Lancez le SUT :

```bash
bash scripts/start-sut.sh
```

3. Récupérez l'URL publique du port 3000 dans l'onglet **Ports**.
4. Lancez ensuite un scan passif :

```bash
bash scripts/zap-passive-scan.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

5. Ouvrez le rapport HTML dans le dossier `reports/`.
