# Réplication et Load Balancing

> [!Caution]
> Sont présentés dans ce TP par aspect pratique deux notions bien différentes :
> 
> - le load balancing, qui est une répartition de charge depuis un serveur de "façade" vers X serveurs applicatifs
> - la réplication SQL, qui est une réplication de données entre une ou plusieurs bases principales et des bases secondaires
> 
> Il est extrêmement important de bien distinguer ces deux fonctionnalités.
> Le TP a été rassemblé en une seule activité sur des machines gérant les deux aspects, mais ceci n'est pas une bonne pratique, simplement une facilité d'organisation dans un cadre pédagogique !

Ce TP est prévu pour des groupes de 3 à 4 personnes, et mobilise 3 Raspberry par groupe.

## Installation des Raspberry Pi

Tous les Pi sont authentifiés auprès de la direction du numérique, permettant leur usage exceptionnel sur le réseau de l'école.
Branchez et lancez vos Pi. Notez bien les identifiants que vous créez. Ne connectez pas les Pi au réseau sans-fil mais bien au réseau filaire.
N'effectuez pas les mises à jour via l'outil graphique.

Une fois vos Pi démarrés, mettez-les à jour via ligne de commande.

Notez les IPs respectives de vos Pi, et décidez quel Raspberry sera le Raspberry "Primaire" nommé `RP`, et lesquels seront les secondaires nommés `RS1` et `RS2`.

## Load Balancing

Pour le load balancing, il est recommandé de commencer par l'installation de l'applicatif sur `RS1` et `RS2`.

### Partie RS

Sur les serveurs secondaires, installez l'applicatif tel que décrit ici : https://github.com/esirem-chassel/rainbow-sql .
Vous aurez besoin de prérequis, assurez-vous bien de lire ceux-ci.

Coté configuration des bases de données, vous pouvez configurer des bases locales pour le moment.

### Partie RP

Sur le serveur primaire, assurez-vous d'installer `nginx` ainsi que `mariadb-server`.

Suivez ensuite les différents guides d'activation du load balancing : https://docs.nginx.com/nginx/admin-guide/load-balancer/http-load-balancer/
L'objectif ici est d'effectuer un `round robin` entre `RS1` et `RS2`.
Démarrez Wireshark sur `RP`, et testez, depuis n'importe quel poste filaire de l'établissement, d'accéder à l'adresse IP de votre Pi.

Vous devriez, sur Wireshark, voir les flux vers vos serveurs `RS1` et `RS2`.

## Réplication

Si vous avez bien suivi l'installation de l'outil durant la partie Load Balancing, alors `mariadb-server` devrait être installé.

Créez votre base de données sur le serveur `RP`. Supprimez les bases des serveurs `RS1` et `RS2` pour les recréer par la suite, vierges.

La documentation de MariaDB sur le sujet est plutôt complète : https://mariadb.com/docs/server/ha-and-performance/standard-replication

> [!Tip]
> La réplication fonctionne selon un principe de binlog, c'est à dire de journaux binaires.
> Les données transmises au serveur principal sont répliqués de manière asynchrone, via écriture dans des fichiers, vers les serveurs secondaires.
> Il existe de nombreuses manières de réaliser ces opérations.

Votre objectif est de mettre en place une réplication de type asynchrone primary/replica, avec `RP` étant le serveur primaire et les serveurs `RS` comme serveurs secondaires.
