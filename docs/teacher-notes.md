# Notes enseignant

Ce template est volontairement centré sur une approche robuste dans GitHub Codespaces.

## Choix retenus

- SUT : OWASP Juice Shop
- Outil de scan : OWASP ZAP en mode Docker CLI
- Rapports : HTML, JSON et Markdown

## Intérêt pédagogique

Cette solution permet de faire travailler les étudiants sur :

- la notion de cible de test ;
- le principe d'un scan passif et d'un scan plus intrusif ;
- l'analyse structurée d'un rapport de sécurité ;
- la distinction entre observation technique et recommandation métier.

## Scripts principaux

- `start-juice-shop.sh` : démarre le SUT
- `zap-baseline.sh` : scan de base
- `zap-full-scan.sh` : scan plus poussé
- `stop-all.sh` : arrête les conteneurs

## Exploitation possible en 2 heures

1. Démarrage de Juice Shop
2. Découverte de l'application
3. Scan baseline
4. Lecture du rapport HTML
5. Sélection de 5 alertes
6. Analyse et recommandations

