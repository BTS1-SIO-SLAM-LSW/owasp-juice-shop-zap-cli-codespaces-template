# Template repository — OWASP ZAP + OWASP Juice Shop (Codespaces)

Ce template repository est destiné à des étudiants de **BTS SIO option SLAM**. Il permet de lancer, dans **GitHub Codespaces**, l'application à tester (**SUT**, *Software Under Test*) **OWASP Juice Shop** ainsi que l'outil d'audit **OWASP ZAP**.

L'objectif n'est pas de scanner Internet, mais d'analyser **uniquement** l'application fournie dans ce dépôt, dans un cadre pédagogique. Les étudiants doivent apprendre à retrouver l'URL publique de l'application dans Codespaces, à ouvrir ZAP dans le navigateur, puis à réaliser une analyse de sécurité raisonnable et exploitable dans le temps d'un TP.

---

## 1. Objectif pédagogique

Ce template permet de travailler les compétences suivantes :

- lancer une application web de test dans un environnement contrôlé ;
- retrouver son URL publique dans GitHub Codespaces ;
- lancer OWASP ZAP et comprendre son rôle de proxy d'audit ;
- effectuer une exploration et un scan passif ;
- générer un rapport HTML ;
- interpréter les alertes remontées par ZAP ;
- proposer des mesures correctives adaptées.

---

## 2. Structure du repository

- `.devcontainer/` : configuration GitHub Codespaces
- `scripts/start-juice-shop.sh` : lancement du SUT OWASP Juice Shop
- `scripts/start-zap.sh` : lancement de l'interface OWASP ZAP via Webswing
- `scripts/zap-baseline.sh` : scan rapide recommandé pour les étudiants
- `scripts/zap-full-scan-lite.sh` : full scan **limité** pour éviter une consommation CPU excessive
- `scripts/print-urls.sh` : rappel des URLs probables dans Codespaces
- `docs/TP-STUDENT.md` : consignes détaillées pour les étudiants
- `reports/` : emplacement des rapports HTML générés

---

## 3. Principe général du TP

Dans ce dépôt, le **SUT testé est OWASP Juice Shop**.

Les étudiants doivent :

1. ouvrir leur dépôt GitHub Classroom dans **GitHub Codespaces** ;
2. lancer **OWASP Juice Shop** ;
3. repérer l'URL publique du port **3000** dans l'onglet **Ports** ;
4. lancer **OWASP ZAP** ;
5. ouvrir l'URL publique du port **8090** puis accéder à `/zap` ;
6. utiliser l'URL publique de Juice Shop comme cible ;
7. produire un rapport avec le **baseline scan** ou, pour les groupes avancés, avec le **full scan limité**.

Dans Codespaces, **vous ne devez pas utiliser `localhost` dans le navigateur de votre machine**. Vous devez utiliser les **URLs publiques GitHub Codespaces**.

---

## 4. Consignes de lancement pour les étudiants

### Étape 1 — Ouvrir le dépôt dans GitHub Codespaces

Depuis GitHub Classroom, ouvrez votre dépôt personnel puis choisissez **Open in Codespaces**.

Attendez la fin du démarrage complet de l'environnement.

### Étape 2 — Lancer OWASP Juice Shop

Dans le terminal du Codespace, exécutez :

```bash
bash scripts/start-juice-shop.sh
```

Ce script démarre le conteneur Docker de **OWASP Juice Shop** sur le **port 3000**.

### Étape 3 — Retrouver l'URL publique du SUT

Dans l'onglet **Ports** de Codespaces :

1. repérez le **port 3000** ;
2. rendez-le **Public** si nécessaire ;
3. ouvrez l'URL correspondante.

L'URL ressemblera à ceci :

```text
https://<nom-du-codespace>-3000.app.github.dev
```

C'est **cette URL** que vous devez utiliser dans ZAP.

### Étape 4 — Lancer OWASP ZAP

Dans un second terminal du Codespace, exécutez :

```bash
bash scripts/start-zap.sh
```

### Étape 5 — Ouvrir l'interface de ZAP

Dans l'onglet **Ports** :

1. repérez le **port 8090** ;
2. rendez-le **Public** si nécessaire ;
3. ouvrez l'URL correspondante ;
4. ajoutez `/zap` à la fin de l'URL si nécessaire.

Exemple :

```text
https://<nom-du-codespace>-8090.app.github.dev/zap
```

### Étape 6 — Lancer un scan rapide recommandé

Le mode recommandé pour les étudiants est le **baseline scan**, car il est plus rapide et consomme moins de ressources qu'un full scan.

Dans le terminal, remplacez l'URL ci-dessous par votre URL publique Juice Shop :

```bash
bash scripts/zap-baseline.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport HTML sera généré dans le dossier :

```text
reports/baseline-report.html
```

### Étape 7 — Lancer un full scan limité

Le full scan classique est souvent trop long dans GitHub Codespaces. Ce template propose donc un **full scan limité**, avec un périmètre et une durée réduits, afin d'obtenir un rapport sans saturer inutilement le CPU.

Commande :

```bash
bash scripts/zap-full-scan-lite.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport HTML sera généré dans :

```text
reports/full-scan-lite-report.html
```

---

## 5. Pourquoi le full scan classique posait problème

Le full scan ZAP peut consommer beaucoup de CPU car il combine :

- une phase de découverte du site ;
- une phase d'analyse passive ;
- une phase d'analyse active plus agressive.

Sur GitHub Codespaces, cela peut devenir trop lourd si le scan n'est pas borné. Dans ce template, le script `zap-full-scan-lite.sh` réduit volontairement le temps consacré au spider et limite certaines durées d'analyse afin de rendre le scan exploitable dans le cadre d'un TP.

Pour un travail étudiant standard, utilisez **d'abord** le baseline scan. Le full scan limité doit être réservé à une deuxième phase ou à un groupe avancé.

---

## 6. Travail demandé aux étudiants

Après lancement de Juice Shop et de ZAP, l'étudiant doit :

1. noter l'URL publique du SUT ;
2. lancer un baseline scan ;
3. relever au moins **5 alertes** ;
4. indiquer leur niveau de criticité ;
5. expliquer le risque associé ;
6. proposer une mesure corrective ;
7. conclure sur l'état de sécurité apparent de l'application.

---

## 7. Aide : affichage des URLs probables

Pour afficher les URLs probables automatiquement :

```bash
bash scripts/print-urls.sh
```

L'onglet **Ports** reste toutefois la source la plus fiable.

---

## 8. Arrêt des services

Pour arrêter Juice Shop :

```bash
docker stop juice-shop
```

Pour arrêter ZAP :

```bash
docker stop zap-webswing
```

---

## 9. Remarque importante

Ce dépôt doit être utilisé **uniquement** dans un cadre pédagogique sur l'application fournie. Il ne faut pas l'utiliser pour scanner un site tiers sans autorisation.
