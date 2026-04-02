# Template GitHub Codespaces : OWASP Juice Shop + OWASP ZAP (mode CLI)

Ce dépôt template fournit un environnement simple et stable pour lancer :

- **OWASP Juice Shop** comme application cible (**SUT**) ;
- **OWASP ZAP** en mode **ligne de commande** pour produire des rapports d'analyse.

Ce choix évite les problèmes d'interface graphique Webswing dans GitHub Codespaces, tout en conservant un vrai workflow de test de sécurité exploitable par des étudiants de **BTS SIO option SLAM**.

---

## Objectif pédagogique

Les étudiants doivent pouvoir :

1. démarrer une application Web volontairement vulnérable ;
2. identifier son URL dans GitHub Codespaces ;
3. lancer un scan de sécurité avec ZAP ;
4. récupérer et analyser un rapport HTML, JSON ou Markdown ;
5. faire le lien entre les alertes remontées et les bonnes pratiques de sécurisation.

---

## Structure du dépôt

```text
.
├── .devcontainer/
├── docs/
├── reports/
├── scripts/
│   ├── print-urls.sh
│   ├── start-juice-shop.sh
│   ├── stop-all.sh
│   ├── zap-baseline.sh
│   └── zap-full-scan.sh
└── README.md
```

---

## Démarrage rapide

Depuis le terminal du Codespace, exécute les commandes suivantes dans l'ordre.

### 1. Lancer le SUT

```bash
bash scripts/start-juice-shop.sh
```

### 2. Afficher les URLs utiles

```bash
bash scripts/print-urls.sh
```

### 3. Ouvrir l'application cible

Dans l'onglet **PORTS** de Codespaces, ouvre l'URL associée au **port 3000**.

L'application cible est :

- **OWASP Juice Shop**
- port : **3000**

---

## Lancer un scan ZAP

Les scripts ZAP utilisent l'image Docker officielle de ZAP et génèrent des rapports dans le dossier `reports/`.

### Scan passif / de base

```bash
bash scripts/zap-baseline.sh
```

Ce script :

- cible automatiquement l'URL du port 3000 ;
- lance un **baseline scan** ;
- génère les fichiers :
  - `reports/zap-baseline-report.html`
  - `reports/zap-baseline-report.json`
  - `reports/zap-baseline-report.md`

### Scan plus poussé

```bash
bash scripts/zap-full-scan.sh
```

Ce script :

- lance un scan plus complet ;
- génère les fichiers :
  - `reports/zap-full-report.html`
  - `reports/zap-full-report.json`
  - `reports/zap-full-report.md`

---

## Où trouver les rapports

Les rapports sont enregistrés dans le dossier :

```text
reports/
```

Tu peux :

- les ouvrir directement dans VS Code ;
- les télécharger par clic droit ;
- les exploiter pour répondre aux questions du TP.

---

## Vérifications utiles

### Voir les conteneurs Docker en cours d'exécution

```bash
docker ps
```

### Vérifier le port utilisé par Juice Shop

```bash
ss -ltnp | grep 3000
```

### Arrêter tous les conteneurs du projet

```bash
bash scripts/stop-all.sh
```

---

## Conseils pour les étudiants

Ne scanne que l'application fournie dans ce dépôt. Ce template est prévu pour l'entraînement et la pédagogie.

Avant d'interpréter un rapport ZAP, il faut :

- relever le nom de l'alerte ;
- identifier le niveau de gravité ;
- repérer l'URL concernée ;
- distinguer un vrai risque d'un simple point d'information ;
- proposer une mesure de sécurisation adaptée.

---

## Idée d'exploitation pédagogique

Après le scan, les étudiants peuvent compléter un tableau d'analyse avec les colonnes suivantes :

- Nom de l'alerte
- Gravité
- URL concernée
- Explication
- Risque métier
- Recommandation technique

---

## Remarques importantes

- Le **port 3000** correspond à **Juice Shop**.
- Ce template n'utilise **pas** l'interface graphique ZAP Webswing.
- Les scans sont réalisés en **mode CLI**, plus fiable dans GitHub Codespaces.

