# Template GitHub Classroom / Codespaces — OWASP ZAP CLI + OWASP Juice Shop

Ce dépôt est un **template repository** destiné à des étudiants de **BTS SIO option SLAM**. Il permet de lancer une application web volontairement vulnérable, **OWASP Juice Shop**, puis d'exécuter des scans **OWASP ZAP en ligne de commande** dans **GitHub Codespaces**.

Le choix de la **version CLI de ZAP** est volontaire. En Codespaces, l'interface graphique de ZAP peut provoquer des redirections d'authentification et consommer inutilement les ressources. Ici, le travail se fait donc à partir de scripts simples, reproductibles et proches d'un usage **DevSecOps** réel.

## Objectifs pédagogiques

Ce template permet de travailler les compétences suivantes :

- identifier l'URL publique d'une application exécutée dans Codespaces ;
- réaliser un **scan passif** avec ZAP ;
- réaliser un **full scan rapide**, plus court et moins gourmand en mémoire qu'un full scan classique ;
- interpréter un rapport HTML de sécurité ;
- relier les alertes détectées aux thèmes du BTS SIO : protection des données, identité numérique de l'organisation, sécurité des usages, disponibilité, intégrité, confidentialité et sécurisation du développement.

## SUT utilisé

Le **SUT** (*Software Under Test*) est :

**OWASP Juice Shop**

Il s'agit d'une application web volontairement vulnérable, spécialement conçue pour l'apprentissage de la sécurité applicative. Elle est particulièrement adaptée à un travail de découverte des faiblesses d'une application web moderne.

## Pourquoi deux modes de scan ?

Le dépôt propose deux modes afin d'adapter la charge machine au temps d'une séance de TP :

- un **scan passif**, à utiliser en priorité, car il est rapide et peu gourmand ;
- un **full scan rapide**, limité volontairement pour éviter les traitements trop longs dans GitHub Codespaces.

Le scan passif est le mode recommandé pour l'ensemble de la classe. Le full scan rapide peut être utilisé dans un second temps, lorsque le scan passif a déjà été interprété.

## Contenu du dépôt

- `scripts/start-sut.sh` : lance OWASP Juice Shop ;
- `scripts/print-urls.sh` : rappelle comment récupérer l'URL publique Codespaces ;
- `scripts/zap-passive-scan.sh` : lance un **scan passif** ;
- `scripts/zap-full-scan-fast.sh` : lance un **full scan rapide** ;
- `reports/` : contient les rapports HTML générés ;
- `docs/TP-STUDENT.md` : support complémentaire pour les étudiants.

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

Ce script lance **OWASP Juice Shop** sur le **port 3000**.

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

Commande :

```bash
bash scripts/zap-passive-scan.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport est généré dans :

```text
reports/zap-passive-report.html
```

## 5. Lancer le full scan rapide

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

# Exercices pratiques personnalisés — BTS SIO SLAM

Les exercices ci-dessous sont conçus pour une séance de **2 heures**. Ils sont rédigés pour des étudiants de **BTS SIO option SLAM** et ciblent la **cybersécurité applicative** plutôt que la sécurité réseau.

## Exercice 1 — Vérifier que l'environnement de test est bien opérationnel

1. Lancez le SUT avec le script fourni.
2. Ouvrez l'application dans le navigateur à partir de l'URL publique Codespaces.
3. Vérifiez que la page d'accueil de **OWASP Juice Shop** s'affiche correctement.
4. Expliquez en quelques lignes pourquoi, dans GitHub Codespaces, on ne doit pas utiliser `localhost` depuis son poste local.

**Production attendue :** une capture d'écran de l'application ouverte et une explication courte sur le rôle de l'URL publique.

## Exercice 2 — Réaliser un scan passif et relever les premières alertes

1. Lancez le scan passif avec le script `zap-passive-scan.sh`.
2. Ouvrez le rapport HTML généré.
3. Relevez au moins **5 alertes** ou informations de sécurité présentes dans le rapport.
4. Pour chacune, indiquez :
   - le nom de l'alerte ;
   - son niveau de gravité ;
   - la ou les URL concernées ;
   - le type de risque représenté pour une organisation.

**Production attendue :** un tableau de 5 lignes minimum.

## Exercice 3 — Classer les alertes par grands thèmes du BTS SIO

À partir du rapport obtenu, classez les alertes dans les catégories suivantes :

- **Protéger les données à caractère personnel** ;
- **Préserver l'identité numérique de l'organisation** ;
- **Sécuriser les équipements et les usages des utilisateurs** ;
- **Garantir la disponibilité, l'intégrité et la confidentialité des services** ;
- **Assurer la cybersécurité d'une solution applicative et de son développement**.

Pour chaque catégorie, donnez au moins **un exemple d'alerte** et justifiez votre classement en une ou deux phrases.

**Production attendue :** un classement argumenté.

## Exercice 4 — Distinguer les problèmes de code et les problèmes de configuration

Choisissez **6 alertes** du rapport et répartissez-les dans deux colonnes :

- **problème de développement applicatif** ;
- **problème de configuration de sécurité ou d'en-têtes HTTP**.

Expliquez pour chaque ligne pourquoi vous placez l'alerte dans cette colonne.

**Production attendue :** un tableau comparatif clair.

## Exercice 5 — Proposer des mesures correctives réalistes

Sélectionnez **4 alertes** du rapport et proposez, pour chacune, une correction concrète.

Votre réponse doit préciser :

- ce qu'il faudrait modifier dans l'application ou sa configuration ;
- quel bénéfice sécurité cela apporterait ;
- si la correction relève plutôt du développeur, de l'administrateur système ou des deux.

**Production attendue :** 4 propositions argumentées.

## Exercice 6 — Lancer un full scan rapide et comparer les résultats

1. Lancez le script `zap-full-scan-fast.sh`.
2. Comparez le rapport issu du scan passif avec le rapport issu du full scan rapide.
3. Indiquez :
   - quelles alertes sont communes aux deux rapports ;
   - quelles alertes apparaissent uniquement dans le full scan rapide ;
   - si le gain d'informations obtenu justifie ou non le temps de traitement supplémentaire.

**Production attendue :** un paragraphe comparatif structuré.

## Exercice 7 — Analyse métier pour une entreprise fictive

Contexte : vous travaillez pour une boutique en ligne fictive qui utilise une application comparable à **OWASP Juice Shop**. Le responsable vous demande quels risques les alertes détectées peuvent avoir pour l'entreprise.

Rédigez une réponse structurée expliquant :

- les conséquences possibles pour les clients ;
- les conséquences possibles pour l'image de marque ;
- les conséquences possibles pour la conformité réglementaire ;
- les conséquences possibles pour la disponibilité du service.

**Production attendue :** un court compte rendu rédigé en phrases complètes.

## Exercice 8 — Synthèse finale type compte rendu d'audit

Rédigez une synthèse de **10 à 15 lignes** répondant à la question suivante :

**L'application testée peut-elle être mise en production en l'état ?**

Votre réponse devra :

- s'appuyer sur les résultats observés ;
- distinguer les points les plus critiques des points secondaires ;
- proposer un ordre de priorité pour les corrections.

**Production attendue :** un avis argumenté de niveau technicien supérieur.

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

Ce template est donc adapté à une progression pédagogique en deux temps :

1. découverte des alertes avec le scan passif ;
2. approfondissement avec le full scan rapide.
