# SQL : notions avancées

## Contexte

On souhaite concevoir un site web de commande et livraison nommé "MegaEat".

Le site permet également de noter les différents restaurants.
Chaque restaurant est géré par un compte partenaire.
Les livreurs sont des employés de la société.

Les clients peuvent ajouter différentes adresses, et choisir quelle adresse sera utilisée pour la livraison.

Pour simplifier cette activité, la partie paiement a été omise.

La structure des tables est présente dans le fichier [datasets/tp4.sql](/TPs/datasets/tp4.sql)
tandis qu'une base complète avec données au format SQLite est présent dans le fichier [datasets/tp4.db](/TPs/datasets/tp4.db).


Sélectionnez la liste des 20 éléments de menu les plus rentables (qui font partie des commandes dont le menu est le plus élevé), ainsi que l'information de si l'élément a changé de nom depuis.


## Index

Activez la mesure des performances via la commande `.timer on`.

### Découverte de la différence par index

Sélectionnez le compte client ayant le plus de commandes, et notez-le.

<details>
<summary>Proposition de requête</summary>

```sql
select customer_id, count(id) as nb from orders group by customer_id order by nb desc limit 1
```

</details>

Sélectionnez la liste des commandes (limité à 20) pour ce compte client.
**Notez bien le timing obtenu.**

<details>
<summary>Proposition de requête</summary>

```sql
select "id", "order_date", "status", "total_amount"
from "Orders"
where "customer_id" = 1465
order by "order_date" desc
limit 20
```

</details>

Tentons de créer un index, à présent, sur le champ "customer_id".

```sql
create index "idx_orders_customer" on "Orders"("customer_id");
```

Relancez la requête. Que constatez-vous ?

Nous allons revenir en arrière et examiner comment SQLite procède.
Supprimez l'index :

```sql
drop index "idx_orders_customer";
```

Et relancez votre requête de sélection en la précédant des mots-clefs `EXPLAIN QUERY PLAN`.

<details>
<summary>Proposition de requête</summary>

```sql
explain query plan
select "id", "order_date", "status", "total_amount"
from "Orders"
where "customer_id" = 1465
order by "order_date" desc
limit 20
```

</details>

Vous devriez obtenir un résultat similaire au suivant :

```
QUERY PLAN
|--SCAN Orders
`--USE TEMP B-TREE FOR ORDER B
```

Maintenant, recréez l'index, et relancez votre requête avec `explain query plan`.
Quel est votre résultat ?

```
QUERY PLAN
|--SEARCH Orders USING INDEX idx_orders_customer (customer_id=?)
`--USE TEMP B-TREE FOR ORDER BY
```

> [!Note]
> Une étape de "scan" est un scan complet de la table par SQLite,
> au contraire d'un "search" utilisant un "index".

### Index composite

Sélectionnez la liste des commandes, par date de commande, pour un restaurant choisi (cherchez le restaurant avec un maximum de commandes !), sur l'année 2026.

<details>
<summary>Proposition de requête</summary>

```sql
select id, order_date, total_amount
from Orders
where restaurant_id = 12
  and order_date >= '2026-01-01'
  and order_date <  '2027-01-01'
order by order_date;
```

</details>

Quels timings obtenez-vous ? Quel(s) index pourriez-vous créer pour améliorer ces performances ?

> [!Tip]
> Un index peut être créé sur un tuple de champs.
> On appelle cela un *index composite*.
> L'ordre des champs est important : cela va changer l'enchaînement des recherches par le SGBDR !

### Pas toujours positif

Sélectionnez la liste des commandes groupé par statut, avec le montant total et le nombre de commandes par statut, ainsi que la date minimale et maximale des commandes trouvées.

<details>
<summary>Proposition de requête</summary>

```sql
select count("id") as nb,
    min("order_date") as mn,
    max("order_date") as mx,
    sum("total_amount") as ttl
from "Orders"
group by "status";
```

</details>

Tentez de créer un index pour améliorer ces performandes.
Que constatez-vous ?


### Index et clefs étrangères

Sélectionnez la liste des adresses pour un compte client choisi (à nouveau, trouvez un compte client pertinant !).

Ajoutez un index et comparez les performances.

Qu'en déduisez-vous ?

## Déclencheurs

Les déclencheurs ou triggers sont des actions automatisées.

### Empêcher les transitions d'états non-valides

Dans notre système, les seules transitions d'état de commande autorisées sont les suivantes :
- PENDING vers WAITING ou CANCELLED
- WAITING vers MOVING ou CANCELLED
- MOVING vers DONE ou CANCELLED

Dans d'autres SGBDR, nous utiliserions des procédures stockées à fournir lors de l'exécution des commandes SQL. Nous pourrions utilisez un modèle similaire en SQL via Python, mais cela sera pour plus tard.

Nous allons créer un déclencheur (trigger) sur la table `Orders` afin d'empêcher de mettre à jour le statut si la transition est invalide.

Créez un `trigger` qui doit s'exécuter sur la table `Orders` __avant__ **chaque** `update`, qui va comparer l'ancien `old` statut au nouveau `new` statut.
Si la transition de statut est invalide, alors on annule en levant `raise` un signal d'annulation `abort`.


<details>
<summary>Proposition de requête</summary>

```sql
CREATE TRIGGER trg_orders_validate_status
BEFORE UPDATE OF status ON Orders
WHEN OLD.status IS NOT NEW.status
BEGIN
    SELECT CASE
        WHEN NOT (
            (OLD.status = 'PENDING'
                AND NEW.status IN ('WAITING', 'CANCELLED'))
            OR
            (OLD.status = 'WAITING'
                AND NEW.status IN ('MOVING', 'CANCELLED'))
            OR
            (OLD.status = 'MOVING'
                AND NEW.status IN ('DONE', 'CANCELLED'))
        )
        THEN RAISE(ABORT, 'Transition de statut interdite')
    END;
END;
```

</details>

> [!Tip]
> Vous pouvez avoir quelques variations de cette requête.
> Par exemple, la clause `OF status` permet de ne cibler que les requêtes
> impliquant ce champ, mais n'est pas une obligation !

### Annulation des commandes en cours en cas de suppression ou changement d'adresse utilisées pour la commande

Un phénomène dérangeant a été observé : certains clients changent ou suppriment leur adresse une fois la commande passée.
Ajoutez un ou plusieurs déclencheurs pour annuler toute commande en statut "WAITING" ou "MOVING" qui utilisent cette adresse.


## Vues
