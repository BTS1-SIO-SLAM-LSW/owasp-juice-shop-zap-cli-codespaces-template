# Notes enseignant

Ce template est conçu pour un usage pédagogique en BTS SIO SLAM.

## Choix techniques

- SUT : OWASP Juice Shop
- Outil d'audit : OWASP ZAP en CLI uniquement
- Pas d'interface Webswing / GUI ZAP
- Deux niveaux de scan :
  - baseline scan : recommandé pour tous les étudiants ;
  - full scan rapide : option plus avancée, mais volontairement bridée.

## Pourquoi un full scan rapide ?

Le full scan classique ZAP peut être trop long dans GitHub Codespaces. Le script fourni limite la durée du spider et du scan afin d'obtenir un rapport plus rapidement.

## Conseils d'usage

- faire lancer d'abord le baseline scan ;
- réserver le full scan rapide à une comparaison ou à un approfondissement ;
- exploiter les rapports comme support d'analyse et non comme verdict absolu.
