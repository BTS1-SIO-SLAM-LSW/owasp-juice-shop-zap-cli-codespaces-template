# Démarrage rapide

1. Ouvrir le dépôt dans GitHub Codespaces.
2. Exécuter :

```bash
bash scripts/start-sut.sh
```

3. Dans l'onglet **PORTS**, repérer le port **3000** et récupérer son URL publique.
4. Lancer le baseline scan :

```bash
bash scripts/zap-baseline.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

5. Ouvrir le rapport :

```text
reports/baseline-report.html
```

6. Pour un scan plus complet mais limité :

```bash
bash scripts/zap-full-rapid.sh "https://<nom-du-codespace>-3000.app.github.dev"
```
