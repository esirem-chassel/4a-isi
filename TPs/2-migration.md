# Migration difficile

## 0. Contexte

Un serveur Minecraft personnalisé a mis en place un système de "panneaux commerçants".
Un joueur peut poser un panneau spécial, qu'il "remplit" en jeu avec des items (tous les mêmes), et indique :
- la quantité vendue par action
- le prix pour cette quantité

Les joueurs peuvent acheter des items en jeu en interagissant avec les panneaux commerçants.
A chaque achat, on garde l'historique de qui a acheté quoi sur quel panneau.

La version de Minecraft sur lequel ce système a été développé prenait en compte des items sur la base d'un couple d'identifiants : itemId et itemData.
Par exemple, la laine blanche est de valeur `(35,0)`, tandis que la laine jaune est `(35,4)`.

Les tables intéressantes pour le système (en 1.11) sont les suivantes :

```sql
create table `items` (
`itemId` int not null,
`itemData` int not null,
`name` varchar(300) not null,
primary key(`itemId`, `itemData`)
);

create table `trader_signs` (
`id` int not null primary key auto_increment,
`x` int not null,
`y` int not null,
`z` int not null,
`itemId` int not null,
`itemData` int not null,
`status` enum('active', 'destroyed') not null default 'active',
`price` double(20,2) default null,
`stack` int not null default 1,
`total` int not null default 0,
constraint `fk_trader_signs_item`
foreign key (`itemId`, `itemData`)
references `items`(`itemId`, `itemData`)
);
```

> [!Note]
> Les informations inutiles dans le cadre de l'exercice (liens avec la table `users`, etc.) ont été retirées.

> [!Warning]
> Si le panneau est "détruit", alors son prix devient nul.

## 1. Historique

Proposez la création de la table `signs_sales_logs` pour stocker l'historique des achats.

## 2. Nouvelle version

### 2.1 Préparation (item_template)

Sur les versions plus récentes (dites "1.18"), les identifiants d'items sont devenus des chaînes de caractères uniques; respectivement `minecraft:white_wool` et `minecraft:yellow_wool`.
Cela correspond, dans `item_template`, à l'information `strkey`.

On crée la table `item_template` pour préparer les prochaines mises à jour de Minecraft.

```sql
create table `item_template` (
`id` int not null primary key auto_increment,
`itemId` int not null,
`itemData` int not null,
`name` varchar(300) not null,
`strkey` varchar(300) not null unique,
unique index(`itemId`, `itemData`)
);
```

Comment modifier `trader_sign` et `signs_sales_logs` pour qu'elles se basent sur `item_template` ?
Proposer une solution de migration complète.

### 2.2 Bascule

Le code du serveur modifié n'a pas accès à l'ID "interne" de `item_template` dans son code directement, mais a accès à l'identifiant sous forme de chaîne de caractères, et peut effectuer des requêtes.

Typiquement, lors d'une interaction avec un panneau existant, le jeu ne connaît que l'identifiant (chaîne) de l'objet ainsi que l'ID interne (entier) du panneau.

Proposez une solution pour que le code du jeu puisse:
- insérer de nouveaux panneaux
- détruire des panneaux
- enregistrer les actions d'achat des joueurs

### 2.3 Action

Le développeur ayant réalisé la migration du plugin des panneaux commerçants vers la 1.18 a ajouté,
dans `trader_signs` et `signs_sales_logs` un champ `string_id`, stockant la clef "chaîne", sans clef étrangère.

Comme les deux versions (1.18 et avant 1.18) tournent en parallèle, nous avons des enregistrements dans `trader_sign` et dans `sales_signs_logs` de deux natures différentes :
- ceux de l'ancienne version, dont `string_id` est vide, mais `itemId` et `itemData` sont remplis
- ceux de la nouvelle version, dont `itemId` et `itemData` sont vides, mais `string_id` est rempli

Proposer une solution pour réparer cette situation.
Le code jeu à modifier doit être minimal.
Proposer également une stratégie de migration.
