# Développement d'une application de services

## Objectif global

On souhaite développer une application "Pol-eat-heck", pour permettre de créer des menus permanents à la semaine, avec un système de réservation.
L'applicatif attendu sera un applicatif Web.
Nous utiliserons l'IAAS de l'UB ou les Raspberry pour les tests en production.

## Décomposition

Pour ce TP, vous devez vous mettre en équipe d'au minimum 3 membres, et concevoir les différentes briques avec certaines contraintes :
- la partie Base de données sera en SQLite
- la partie Back-end sera en Python sur FastAPI
- la partie Front-end sera en HTML/CSS/Javascript sans framework imposé

## Versionning

L'ensemble du projet **devra** être versionné sur les principes suivants :
- Github sera votre outil de versionning
- Les dépôts seront nommés respectivement `4a-isi-projet-db`, `4a-isi-projet-front` et `4a-isi-projet-back`
- Tous les dépôts sont publics
- Chaque dépôt aura l'intégralité de l'équipe ajoutée en collaborateurs, ainsi que votre enseignant `esirem-chassel`

## Possibilités de l'application

L'application doit gérer la connexion d'utilisateurs.
Il existe deux types d'utilisateurs : les utilisateurs standard et les administrateurs.
Le paiement n'est PAS géré dans l'application; celui-ci est réalisé en direct à la récupération/achat de commandes.
L'application permet aux administrateurs de créer/modifier/supprimer des produits, d'indiquer la disponibilité / stock des produits, de créer/supprimer des menus, et d'indiquer des disponibilités des menus (à savoir si un menu est limité à un jour ou une semaine, par exemple).
Il doit également être possible pour les administrateurs d'indiquer des jours précis de fermeture.
N'importe qui, sans être connecté, peut visualiser les produits et menus.
Seuls les utilisateurs peuvent commander des produits / menus à l'avance.
La connexion se fait via un nom d'utilisateur et un mot de passe. On ne gère pas l'emailing.
A la création d'un compte, un mot de passe est généré aléatoirement et transmis à cette occasion uniquement.
Les utilisateurs peuvent changer leur mot de passe.
Il est possible, pour un administrateur, de bloquer un compte utilisateur (par exemple, en cas de commandes répétées non-honorées).
Enfin, il est possible, uniquement en ligne de commande, de créer un compte administrateur en fournissant un nom d'utilisateur et un mot de passe.

## Consignes additionnelles

Une conception est attendue.
Cette conception sera décomposée pour chaque partie, mais une conception globale est également attendu, pour mettre en exergue les flux entre les différentes parties de l'application.
Il n'est pas attendu une application 100% fonctionnelle, mais un maximum d'avancement et de travail par rapport au temps imparti.
Il est impensable de réaliser soi-même l'ensemble de l'application sur le temps imparti; il est nécessaire de décomposer le travail !
Tout code non-compris est considéré comme nul. Avant de balancer ce TP à une IA, réfléchissez par vous-même !
