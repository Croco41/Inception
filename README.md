# Projet Inception

![Statut du projet](https://img.shields.io/badge/statut-compl%C3%A9t%C3%A9-4caf50)
![Notions Apprises](https://img.shields.io/badge/notions-Docker%20%7C%20Virtualisation%20%7C%20S%C3%A9curit%C3%A9%20%7C%20Docker%20Compose-007bff)

## Description

Inception est un projet d'administration système qui m'a permis de renforcer mes compétences avec Docker. L'idée est de mettre en place une infrastructure utilisant des conteneurs Docker sur une machine virtuelle. Chaque service est isolé dans un conteneur et interagit avec les autres pour former une infrastructure fonctionnelle.

Le but est de créer une mini-infrastructure avec des services comme **NGINX**, **WordPress**, **MariaDB**, le tout orchestré avec **docker-compose**. Ce projet m'a permis de comprendre la création, la configuration, et l'interconnexion de plusieurs conteneurs Docker, tout en respectant les bonnes pratiques de sécurité.

## Prérequis et Structure

- Le projet doit être réalisé sur une **machine virtuelle**.
- J'ai dû créer un dossier `srcs` contenant tous les fichiers de configuration nécessaires.
- Un **Makefile** est requis à la racine du projet, permettant de construire toute l'infrastructure à l'aide de `docker-compose.yml`.

## Infrastructure à mettre en place

1. **Services à Créer :**

   - **NGINX** avec TLSv1.2 ou TLSv1.3 comme point d'entrée unique (port 443).
   - **WordPress** avec **php-fpm** (sans NGINX).
   - **MariaDB** pour la base de données.
   - Deux volumes pour persister les données : un pour la base de données et un pour les fichiers WordPress.
   - Un **docker-network** pour connecter les différents services.

2. **Configuration :**

   - Chaque service a son propre **Dockerfile**.
   - J'ai utilisé **Alpine** ou **Debian** comme base pour les images Docker.
   - Les informations sensibles (comme les mots de passe) sont stockées de manière sécurisée (via `.env` ou Docker secrets).
   - Le nom de domaine configuré pointe vers l'adresse IP locale de ma machine (ex: `monlogin.42.fr`).

## Consignes Spéciales

- **Pas de services prédéfinis** : Toutes les images Docker ont été construites par moi-même.
- **Pas de hacks** : Les solutions de contournement comme `sleep infinity` ou des boucles infinies sont interdites.
- **Utilisation de variables d'environnement** : Aucune information confidentielle ne doit être présente en clair dans les Dockerfiles.
- **Redémarrage automatique** : Les conteneurs doivent être configurés pour redémarrer en cas de crash.

## Résumé des Étapes

1. Créer une machine virtuelle et installer Docker.
2. Créer les Dockerfiles pour chaque service (NGINX, WordPress, MariaDB).
3. Utiliser `docker-compose` pour orchestrer les conteneurs.
4. Configurer le domaine local et tester la connectivité entre les services.
5. Ajouter des bonus si possible.

## Ressources Utiles

- [Documentation Docker](https://docs.docker.com/)
- [docker-compose](https://docs.docker.com/compose/)
- [Guide sur TLS](https://docs.redhat.com/fr/documentation/red_hat_enterprise_linux/9/html/securing_networks/planning-and-implementing-tls_securing-networks#planning-and-implementing-tls_securing-networks)

---
