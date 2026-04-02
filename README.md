# Template GitHub Classroom / Codespaces — OWASP ZAP CLI + OWASP Juice Shop

Ce dépôt est un **template repository** conçu pour des étudiants de **BTS SIO option SLAM**. Il permet de lancer une application web volontairement vulnérable, **OWASP Juice Shop**, puis d'exécuter des scans **OWASP ZAP en ligne de commande** dans **GitHub Codespaces**.

Le choix de la **version CLI de ZAP** est volontaire. En Codespaces, l'interface graphique Webswing de ZAP peut provoquer des redirections d'authentification et consommer beaucoup de ressources. Ici, le travail se fait donc à partir de scripts simples, reproductibles et proches d'un usage DevSecOps réel.

## Objectifs pédagogiques

Ce template permet de travailler les compétences suivantes :

- identifier l'URL publique d'une application exécutée dans Codespaces ;
- réaliser un **scan passif** avec ZAP ;
- réaliser un **full scan allégé**, plus rapide et moins gourmand en mémoire qu'un full scan classique ;
- interpréter un rapport HTML de sécurité ;
- proposer des mesures correctives en lien avec la cybersécurité applicative.

## SUT utilisé

Le **SUT** (*Software Under Test*) est :

**OWASP Juice Shop**

Il s'agit d'une application volontairement vulnérable, spécialement conçue pour l'apprentissage de la sécurité applicative. OWASP indique que Juice Shop est une application intentionnellement vulnérable, et sa documentation officielle propose notamment un lancement simple via Docker. citeturn118406search2turn118406search16

## Pourquoi éviter le full scan classique ?

La documentation officielle de ZAP précise que le **Full Scan** exécute un spider, éventuellement un AJAX spider, puis un active scan complet. Par défaut, il peut donc durer longtemps. À l'inverse, le **Baseline Scan** est limité dans le temps et ne réalise pas d'attaques actives, ce qui le rend beaucoup plus court. citeturn118406search1turn118406search7

Pour cette raison, ce dépôt propose deux modes :

- un **scan passif** recommandé pour tous les étudiants ;
- un **full scan rapide** configuré pour être plus court et moins gourmand qu'un full scan brut.

## Contenu du dépôt

- `scripts/start-sut.sh` : lance OWASP Juice Shop ;
- `scripts/print-urls.sh` : rappelle comment récupérer l'URL publique Codespaces ;
- `scripts/zap-passive-scan.sh` : lance un **baseline scan** passif ;
- `scripts/zap-full-scan-fast.sh` : lance un **full scan allégé** ;
- `reports/` : contient les rapports HTML générés ;
- `.devcontainer/` : configuration Codespaces.

---

# Consignes étudiants

## 1. Ouvrir le dépôt dans GitHub Codespaces

Depuis votre dépôt GitHub Classroom, ouvrez le projet avec **GitHub Codespaces**.

Attendez que le conteneur de développement soit entièrement prêt.

## 2. Lancer le SUT

Dans le terminal du Codespace, exécutez :

```bash
bash scripts/start-sut.sh
```

Ce script lance **OWASP Juice Shop** dans Docker sur le **port 3000**.

## 3. Récupérer l'URL publique de l'application

Dans GitHub Codespaces, ouvrez l'onglet **Ports**.

Repérez le **port 3000**. Si besoin, rendez-le public.

L'URL d'accès à l'application ne sera **pas** de la forme `http://localhost:3000`, mais de la forme :

```text
https://<nom-du-codespace>-3000.app.github.dev
```

Vous pouvez aussi afficher un rappel avec :

```bash
bash scripts/print-urls.sh
```

Ouvrez ensuite cette URL dans votre navigateur. Vous devez voir **OWASP Juice Shop**.

## 4. Lancer le scan passif recommandé

Le scan passif est le mode à utiliser en priorité. Il s'appuie sur le script officiel **`zap-baseline.py`**, qui effectue un spider limité dans le temps puis attend la fin du passive scanning. La documentation officielle indique que ce script ne réalise pas d'attaques actives et qu'il est conçu pour rester relativement court. citeturn118406search7turn118406search4

Commande :

```bash
bash scripts/zap-passive-scan.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport est généré dans :

```text
reports/zap-passive-report.html
```

## 5. Lancer le full scan rapide

Ce dépôt contient aussi un **full scan rapide**. Il utilise le script officiel **`zap-full-scan.py`**, mais avec des limitations explicites afin de réduire la durée du spider, de désactiver l'AJAX spider et de borner le temps maximal de scan. La documentation officielle précise en effet que le full scan brut peut durer longtemps, notamment parce qu'il enchaîne spider, AJAX spider optionnel et active scan complet. citeturn118406search1turn118406search4

Commande :

```bash
bash scripts/zap-full-scan-fast.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport est généré dans :

```text
reports/zap-full-fast-report.html
```

## 6. Travail demandé

Après exécution d'un scan, consultez le rapport HTML et relevez :

- le nombre d'alertes détectées ;
- les niveaux de gravité ;
- les URL concernées ;
- les mesures correctives proposées.

Vous devez ensuite rédiger une courte analyse :

1. Quelles vulnérabilités ou mauvaises configurations ont été détectées ?
2. Lesquelles relèvent d'un problème de développement applicatif ?
3. Lesquelles relèvent d'un problème de configuration HTTP ou navigateur ?
4. Quelles corrections proposeriez-vous ?

---

# Commandes utiles

Lancer le SUT :

```bash
bash scripts/start-sut.sh
```

Afficher un rappel sur l'URL Codespaces :

```bash
bash scripts/print-urls.sh
```

Lancer le scan passif :

```bash
bash scripts/zap-passive-scan.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Lancer le full scan rapide :

```bash
bash scripts/zap-full-scan-fast.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Arrêter le SUT :

```bash
docker stop juice-shop
```

---

# Remarques pour l'enseignant

Le **scan passif** est celui à privilégier en séance, car il reste léger et produit un rapport exploitable rapidement. Le **full scan rapide** est un compromis : il ne remplace pas un full scan complet, mais il permet d'obtenir davantage de résultats sans bloquer trop longtemps un Codespace.

Sur le plan technique :

- le **passive scan** fixe une courte durée de spider ;
- le **full scan rapide** fixe une durée courte de spider, désactive l'AJAX spider et borne le temps total.

Cela ne garantit pas un temps identique dans tous les Codespaces, mais réduit nettement les risques de scans interminables.

---

# Références

- Documentation ZAP Docker : scripts Baseline Scan et Full Scan. citeturn118406search0turn118406search1turn118406search7
- Documentation OWASP / Juice Shop : application volontairement vulnérable et déploiement Docker. citeturn118406search2turn118406search16
