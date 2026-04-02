# Template GitHub Classroom — OWASP ZAP CLI + OWASP Juice Shop

Ce dépôt sert de **template repository** pour un TP de **cybersécurité applicative** en **BTS SIO option SLAM**. Il permet de lancer :

- **OWASP Juice Shop** comme **SUT** (*Software Under Test*) ;
- **OWASP ZAP en ligne de commande uniquement** ;
- un **scan baseline** (passif, plus rapide et moins risqué) ;
- un **full scan rapide** (plus complet, mais volontairement limité pour rester utilisable dans GitHub Codespaces).

L'objectif pédagogique est d'apprendre à **observer, analyser et interpréter** des alertes de sécurité applicative sur une application web volontairement vulnérable, dans un environnement maîtrisé.

---

## 1. Contexte professionnel

Vous travaillez comme développeur ou analyste sécurité au sein d'une équipe chargée de vérifier la sécurité d'une application web avant une mise en production. Votre mission consiste à utiliser **OWASP ZAP** pour identifier des faiblesses de sécurité sur l'application **OWASP Juice Shop**.

Ce travail s'inscrit dans les compétences du **Bloc 3 du BTS SIO** :

- protéger les données à caractère personnel ;
- préserver l'identité numérique de l'organisation ;
- garantir la disponibilité, l'intégrité et la confidentialité des services ;
- assurer la cybersécurité d'une solution applicative et de son développement.

---

## 2. Ce que contient ce dépôt

- `docker-compose.yml` : lance **OWASP Juice Shop** ;
- `.devcontainer/devcontainer.json` : configuration conseillée pour **GitHub Codespaces** ;
- `scripts/start-sut.sh` : démarre Juice Shop ;
- `scripts/stop-sut.sh` : arrête Juice Shop ;
- `scripts/print-urls.sh` : rappelle comment récupérer l'URL publique du SUT dans Codespaces ;
- `scripts/zap-baseline.sh` : lance un **scan baseline** avec génération d'un rapport HTML ;
- `scripts/zap-full-rapid.sh` : lance un **full scan rapide**, borné pour réduire la consommation CPU et mémoire ;
- `reports/` : dossier dans lequel seront générés les rapports.

---

## 3. Consignes de lancement dans GitHub Codespaces

### Étape 1 — Ouvrir le dépôt dans Codespaces

Depuis GitHub Classroom ou GitHub, ouvrez le dépôt avec **Code > Codespaces > Create codespace on main**.

Attendez la fin du démarrage du conteneur.

### Étape 2 — Lancer le SUT (OWASP Juice Shop)

Dans le terminal de Codespaces, exécutez :

```bash
bash scripts/start-sut.sh
```

Cette commande lance **OWASP Juice Shop** avec Docker Compose.

### Étape 3 — Récupérer l'URL publique du SUT

Dans **Codespaces**, ouvrez l'onglet **PORTS**.

Repérez le port **3000**. Si nécessaire, rendez-le accessible en choisissant **Port Visibility > Public**.

L'URL de l'application à tester sera de la forme :

```text
https://<nom-du-codespace>-3000.app.github.dev
```

**Important :** dans ce TP, les élèves **ne doivent pas utiliser `localhost`**. Ils doivent toujours utiliser **l'URL publique fournie par Codespaces**.

Vous pouvez aussi afficher un rappel avec :

```bash
bash scripts/print-urls.sh
```

### Étape 4 — Vérifier l'accès à l'application

Ouvrez l'URL publique du port **3000** dans le navigateur.

Vous devez voir **OWASP Juice Shop**.

---

## 4. Lancer OWASP ZAP en ligne de commande

### Scan baseline recommandé

Le **baseline scan** est le mode recommandé pour les étudiants, car il est plus rapide, consomme moins de ressources et produit un rapport exploitable en temps limité.

Commande :

```bash
bash scripts/zap-baseline.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport sera généré ici :

```text
reports/baseline-report.html
```

### Full scan rapide

Le **full scan rapide** réalise un scan plus complet, mais il a été **volontairement limité** pour éviter les scans trop longs ou trop gourmands dans Codespaces.

Commande :

```bash
bash scripts/zap-full-rapid.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport sera généré ici :

```text
reports/full-rapid-report.html
```

---

## 5. Différence entre les deux scans

### Baseline scan

Le baseline scan :

- explore le site ;
- attend la fin du **passive scanning** ;
- ne lance pas d'attaques actives agressives ;
- est adapté à un TP de 2 heures.

### Full scan rapide

Le full scan rapide :

- explore davantage l'application ;
- lance aussi des tests plus poussés ;
- reste **bridé** pour limiter les ressources ;
- doit être utilisé après le baseline scan, et non à sa place.

---

## 6. Exercices pratiques personnalisés — BTS SIO SLAM

### Exercice 1 — Vérifier l'environnement de test

1. Lancez `OWASP Juice Shop`.
2. Repérez son URL publique dans Codespaces.
3. Expliquez pourquoi l'URL d'accès ne doit pas contenir `localhost` dans ce contexte.
4. Indiquez le rôle du **SUT** dans un audit de sécurité applicative.

### Exercice 2 — Réaliser un scan baseline

1. Lancez le script `zap-baseline.sh`.
2. Ouvrez le rapport HTML généré.
3. Relevez au moins **5 alertes**.
4. Pour chaque alerte, indiquez :
   - son nom ;
   - son niveau de gravité ;
   - l'élément concerné (page, ressource, paramètre, en-tête HTTP, cookie, etc.).

### Exercice 3 — Classer les alertes selon les thèmes du BTS SIO

À partir du rapport baseline, classez les alertes dans les catégories suivantes :

- protéger les données à caractère personnel ;
- préserver l'identité numérique de l'organisation ;
- sécuriser les équipements et les usages des utilisateurs ;
- garantir la disponibilité, l'intégrité et la confidentialité des services ;
- assurer la cybersécurité d'une solution applicative et de son développement.

Justifiez chaque classement en quelques phrases.

### Exercice 4 — Distinguer problème de développement et problème de configuration

Pour au moins **6 alertes**, indiquez si le problème semble lié principalement :

- au **code applicatif** ;
- à la **configuration HTTP / serveur** ;
- à la **gestion des cookies / sessions** ;
- ou à un **manque de durcissement général**.

Expliquez votre réponse.

### Exercice 5 — Proposer des mesures correctives

Choisissez **5 alertes** et proposez, pour chacune, une mesure corrective réaliste.

Exemples de pistes de réflexion :

- ajout d'un en-tête HTTP de sécurité ;
- limitation d'une fuite d'information ;
- amélioration de la gestion de session ;
- validation des entrées ;
- durcissement du serveur.

### Exercice 6 — Comparer baseline scan et full scan rapide

1. Lancez le `full scan rapide`.
2. Comparez le nouveau rapport avec celui du baseline scan.
3. Répondez aux questions suivantes :
   - Quelles alertes apparaissent dans les deux rapports ?
   - Quelles alertes semblent nouvelles ?
   - Le full scan rapide apporte-t-il des informations plus exploitables ?
   - Le temps de traitement supplémentaire vous paraît-il justifié ?

### Exercice 7 — Analyse métier

Choisissez **une alerte importante** et rédigez un paragraphe expliquant :

- le risque technique ;
- le risque métier pour l'entreprise ;
- le risque potentiel pour les utilisateurs ;
- la priorité de correction.

### Exercice 8 — Compte rendu d'audit

Rédigez une synthèse structurée comportant :

- le contexte ;
- l'outil utilisé ;
- l'URL du SUT testée ;
- le type de scan réalisé ;
- les principales vulnérabilités observées ;
- les mesures correctives recommandées ;
- une conclusion sur le niveau de sécurité global de l'application.

---

## 7. Commandes utiles

### Démarrer le SUT

```bash
bash scripts/start-sut.sh
```

### Arrêter le SUT

```bash
bash scripts/stop-sut.sh
```

### Afficher un rappel sur les URLs Codespaces

```bash
bash scripts/print-urls.sh
```

### Lancer le baseline scan

```bash
bash scripts/zap-baseline.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

### Lancer le full scan rapide

```bash
bash scripts/zap-full-rapid.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

---

## 8. Recommandations importantes

- N'utilisez ce dépôt **que dans un cadre pédagogique**.
- Ne lancez **jamais** un scan ZAP contre un site qui ne vous appartient pas ou pour lequel vous n'avez pas d'autorisation.
- Commencez toujours par le **baseline scan**.
- Le **full scan rapide** doit rester un complément.

---

## 9. Remarque technique sur le full scan rapide

Le script `zap-full-rapid.sh` a été réglé pour être **moins gourmand** que le full scan classique. Il réduit notamment :

- la durée du spider ;
- la durée maximale du scan ;
- le périmètre exploré dans le cadre d'un TP.

Il ne remplace donc pas un audit complet, mais il fournit un compromis intéressant entre **rapidité**, **charge machine** et **richesse pédagogique**.
