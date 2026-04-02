# TP étudiant — Analyse de OWASP Juice Shop avec OWASP ZAP CLI

## Contexte professionnel

Vous êtes chargé d'analyser la sécurité d'une application web avant sa mise en production. Pour cette étude, vous utilisez une application pédagogique volontairement vulnérable : **OWASP Juice Shop**.

Votre mission consiste à lancer l'application, récupérer son URL publique dans GitHub Codespaces, exécuter un scan ZAP, puis analyser les résultats.

## Étapes à réaliser

### Étape 1 — Lancer l'application

```bash
bash scripts/start-sut.sh
```

### Étape 2 — Trouver l'URL publique du SUT

Dans l'onglet **Ports**, repérez le port **3000** et copiez l'URL publique.

### Étape 3 — Exécuter un scan passif

```bash
bash scripts/zap-passive-scan.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

### Étape 4 — Consulter le rapport

Ouvrez le fichier :

```text
reports/zap-passive-report.html
```

### Étape 5 — Exécuter un full scan rapide

```bash
bash scripts/zap-full-scan-fast.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

### Étape 6 — Consulter le second rapport

Ouvrez le fichier :

```text
reports/zap-full-fast-report.html
```

## Questions

1. Quelle est l'URL publique réellement utilisée pour scanner l'application ?
2. Combien d'alertes apparaissent dans le rapport passif ?
3. Quelles différences observez-vous entre le rapport passif et le full scan rapide ?
4. Quelles vulnérabilités semblent particulièrement critiques ?
5. Quelles corrections proposeriez-vous au développeur ?
