# TP étudiant — OWASP ZAP sur OWASP Juice Shop

## Contexte professionnel

Vous travaillez comme développeur ou testeur sécurité dans une équipe chargée de vérifier la sécurité d'une application web avant sa mise en production.

Dans ce TP, l'application testée (**SUT**) est **OWASP Juice Shop**. L'outil d'analyse utilisé est **OWASP ZAP**.

## Mission

Votre mission consiste à :

- lancer l'application dans GitHub Codespaces ;
- retrouver son URL publique ;
- lancer OWASP ZAP ;
- produire un rapport d'analyse ;
- relever les alertes ;
- proposer des corrections.

## Étape 1 — Lancer l'application à tester

Dans le terminal du Codespace :

```bash
bash scripts/start-juice-shop.sh
```

## Étape 2 — Retrouver l'URL publique du SUT

Dans l'onglet **Ports** de Codespaces :

- repérez le port **3000** ;
- rendez-le **Public** si nécessaire ;
- ouvrez l'URL associée.

Vous devez utiliser cette URL dans ZAP. N'utilisez pas `localhost` dans le navigateur de votre ordinateur.

## Étape 3 — Lancer OWASP ZAP

Dans un second terminal :

```bash
bash scripts/start-zap.sh
```

## Étape 4 — Ouvrir ZAP

Dans l'onglet **Ports** :

- repérez le port **8090** ;
- rendez-le **Public** si nécessaire ;
- ouvrez l'URL ;
- ajoutez `/zap` à la fin si besoin.

## Étape 5 — Lancer le scan recommandé

Dans le terminal, lancez un **baseline scan** :

```bash
bash scripts/zap-baseline.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport sera généré dans `reports/baseline-report.html`.

## Étape 6 — Lancer le full scan limité

Si votre enseignant vous le demande, vous pouvez lancer un **full scan limité** :

```bash
bash scripts/zap-full-scan-lite.sh "https://<nom-du-codespace>-3000.app.github.dev"
```

Le rapport sera généré dans `reports/full-scan-lite-report.html`.

## Travail à rendre

Rédigez un compte rendu comportant :

1. l'URL publique du SUT ;
2. le type de scan utilisé ;
3. le nombre d'URLs découvertes ;
4. la liste d'au moins 5 alertes ;
5. le niveau de risque de chaque alerte ;
6. une explication claire de chaque alerte ;
7. une proposition de correction pour chaque alerte ;
8. une conclusion générale.

## Questions d'analyse

1. Quels en-têtes HTTP de sécurité semblent absents ou insuffisants ?
2. Les cookies sont-ils correctement protégés ?
3. ZAP remonte-t-il des informations techniques divulguées ?
4. Quelles pages de Juice Shop paraissent particulièrement sensibles ?
5. Quelles mesures un développeur SLAM pourrait-il proposer en priorité ?

## Consigne importante

Le **full scan classique** n'est pas demandé ici, car il peut être trop long et trop coûteux en CPU dans Codespaces. Le script fourni dans ce dépôt réalise un **full scan limité**, plus réaliste pour le temps d'un TP.
