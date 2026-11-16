# Développement d'une application de services

## Objectif global

On souhaite développer une application "Pol-eat-heck", pour permettre de créer des menus permanents à la semaine, avec un système de réservation.

L'applicatif attendu sera un applicatif Web.

Nous utiliserons l'IAAS de l'UB ou les Raspberry pour les tests en production.

Le plus important dans ce TP est l'articulation et la communication entre les différentes parties; bref l'ingénierie autour du système dans son entièreté !

> [!Warning]
> A chaque fois que des chevrons `<>` sont utilisés dans ces consignes, il est nécessaire de les remplacer par les éléments adéquats.
> Par exemple, `<username>` indique que vous devrez remplacer cet élément par un nom d'utilisateur, **en remplaçant les chevrons également**.
> `<username>` pourrait par exemple devenir `esirem-chassel`

## Décomposition

Pour ce TP, vous devez vous mettre en équipe d'au minimum 3 membres, et concevoir les différentes briques avec certaines contraintes :
- la partie Base de données sera en SQLite
- la partie Back-end sera en Python sur FastAPI
- la partie Front-end sera en HTML/CSS/Javascript sans framework imposé

> [!Note]
> Ces choix ont été fait pour vous afin que l'ensemble du projet puisse être assemblé, testé et déployé sans trop d'efforts.
> Si vous faites le choix de passer par des framework supplémentaires, vous risquez de mettre en difficulté l'ensemble votre équipe, ou d'accroître les difficultés de tests et déploiements.
> Ici, avec cette stack, il sera aisé de configuré FastAPI/SQLModel/SQLAlchemy afin de se connecter en SQLite et de servir statiquement le HTML/CSS/Javascript, qui peut être ajouté en tant que submodule ou un simple lien symbolique !

## Versionning

L'ensemble du projet **devra** être versionné sur les principes suivants :
- Github sera votre outil de versionning
- Les dépôts seront nommés respectivement `4a-isi-projet-db`, `4a-isi-projet-front` et `4a-isi-projet-back`
- Tous les dépôts sont publics
- Chaque dépôt aura l'intégralité de l'équipe ajoutée en collaborateurs, ainsi que votre enseignant `esirem-chassel`
- Chaque dépôt devra comporter un `README.md` indiquant la liste des collaborateurs du projet, ainsi que des liens vers les autres projets, en plus des indications éventuelles quant au projet en lui-même

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

> [!Note]
> Il est impensable de réaliser soi-même l'ensemble de l'application sur le temps imparti; il est nécessaire de décomposer le travail !

> [!Caution]
> Tout code non-compris est considéré comme nul. Avant de balancer ce TP à une IA, réfléchissez par vous-même !

## Extension : analyse

A partir de votre application et de sa conception, quelles sont vos suggestions pour :
- améliorer la sécurité de l'application
- permettre une meilleure extensibilité (pouvoir ajouter aisément des fonctionnalités)
- accroître la résilience de l'application (sa résistance aux pannes, aux erreurs)

# Evaluation

Elle sera réalisée par présentation de votre projet et des différentes parties auxquelles chaque personne a contribué.
La pertinence des explications sera particulièrement prise en compte; si vous me racontez des feintes pour vous faire passer pour votre grand ami Claude, le résultat pourrait être relativement négatif.

# Annexes

## Ressources sur SQLite / Conception DB

[Documentation SQLite](https://www.sqlite.org/docs.html)

### Mermaid

[Mermaid](https://mermaid.js.org/) est un pseudo-langage de description de graphiques.

Il permet, avec du code, de visualiser différents processus, qu'il s'agisse de flowchart, de diagrammes UML...

Le plus pratique est de l'utiliser [dans Github, qui supporte Mermaid](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-diagrams).

## Infos sur FastAPI

[FastAPI](https://fastapi.tiangolo.com/) est un framework simpliste de création rapide d'API en Python.

### Installation / mise en place de FastAPI

L'installation est assez simple, et usuelle pour tout package/framework Python : https://fastapi.tiangolo.com/tutorial/#install-fastapi

Il est déconseillé de passer par `uv` à moins que votre équipe ne soit habituée à ce pseudo-gestionnaire d'environnements.
L'utilisation de `venv`, `pip` et d'un fichier `requirements.txt` est fortement conseillée.

<details>
<summary>Détails de l'installation pas-à-pas si vous êtes absolument perdus, comme un lapin au milieu d'un blizzard</summary>

*Note : les étapes 1 à 4 ne sont à réaliser qu'une seule fois sur votre poste. Les étapes 5 et 6 sont à réaliser à chaque fois que vous souhaitez travailler sur votre projet.*

**1. Clonez votre dépôt**

`git clone <uri distante> <chemin local>`

**2. Déplacez-vous dans votre clone**

`cd <chemin local>`

**3. Créez votre venv**

`py -m venv .venv`

**4. __Si ce n'est déjà fait__, créez votre fichier `requirements.txt` à la racine de votre dépôt, et ajoutez-y FastAPI**

Ajoutez la ligne `fastapi[standard]` dans votre `requirements.txt`.

**5. Activez votre venv**

Sur Windows avec Powershell : `Set-ExecutionPolicy -Scope=Process Unrestricted` puis `.\.venv\Scripts\Activate.ps1`
Sur Linux OU sur Windows avec Git Bash *(conseillé)* : `source .venv/Scripts/activate`

**6. Installez tous les packages python nécessaires dans votre venv**

`pip install -r requirements.txt`
  
</details>

Une fois FastAPI installé, à nouveau, la documentation se suffit pour commencer : https://fastapi.tiangolo.com/tutorial/first-steps/

Créez au minimun un fichier `main.py` et initialisez une variable `app` contenant une instance de FastAPI, comme indiqué dans la documentation.

> [!Tip]
> Attention à bien indiquer le point d'entrée de votre application dans le `pyproject.toml` à nouveau [comme indiqué dans la documentation](https://fastapi.tiangolo.com/tutorial/first-steps/#configure-the-app-entrypoint-in-pyproject-toml).

> [!Caution]
> A chaque fois que vous voulez faire du python, y compris tester/lancer le serveur FastAPI, vous devez le faire dans un CLI avec votre venv actif.
> Sous VSC, l'activation et la détection des venv reste très aléatoire.
> Il est conseillé de passer par la CLI pour lancer le serveur FastAPI en mode dev : `fastapi dev`.
> Cela va recharger tout seul le serveur lors de la modification des fichiers !


### Démarrage : créer des routes, renvoyer des données...

Votre objectif dans ce TP est de créer les routes nécessaires à la manipulation de votre système.
Il est donc nécessaire de définir la liste des routes API en amont, avec la ou les personne(s) responsable(s) du front.

Dans un premier temps, il est conseillé de créer ces routes ne renvoyant rien, puis renvoyant des données fictives ou "mock", puis de remplir le code applicatif pouvant être développé, et de continuer avec du code réel interagissant avec la base de données.

<details>
<summary>Exemples de routes</summary>

Ne renvoyant aucune donnée :

```py
@router.patch("/users{uid}", summary="Update specific information for current user")
async def modify():
    pass
```

Renvoyant des données statiques :

```py
from fastapi import APIRouter

router = APIRouter()

@router.get("/", summary="Show the current API version")
async def home():
    return {"version": "0.1a"}
```

Renvoyant des données réelles (ou non !) utilisant des librairies développées dans le projet :

```py
@app.get("/", name="List all bingos", response_model=BingosList)
async def index():
    bingos = getAllBingos()
    res = []
    for b in bingos:
        res.append(convertBingoToOutput(b, False))
    return {"bingos": res}
```

</details>

### Connexion DB

Utilisez [SQLModel, intégré dans FastAPI](https://fastapi.tiangolo.com/tutorial/sql-databases/) pour la connexion à la base de données.

## Bases sur HTML/CSS/JS

Normalement, vous connaissez HTML/CSS/JS, puisque vous avez validé le module correspondant en 3A.
Néanmoins, je peux vous redonner des documentations sur le sujet :
- HTML : https://developer.mozilla.org/en-US/docs/Web/HTML
- CSS : https://developer.mozilla.org/en-US/docs/Web/CSS
- JS : https://developer.mozilla.org/en-US/docs/Web/JavaScript


### Templates HTML

Un concept pratique en HTML/JS est celui de [templates](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_templates_and_slots).
Cela permet de préparer des éléments complets en HTML, avec des données génériques, et de les dupliquer pour les insérer / déplacer dans la page après, par exemple, un chargement asynchrone.

<details>
  <summary>Exemple avec une liste et des éléments</summary>
  
```html
<ul id="myList"></ul>
<template id="tpl">
  <li class="list-el" data-lid=""></li>
</template>
```

```js
// on suppose la fonction "callbackListElement" appelée pour chaque élément obtenu après appel au back-office
function callbackListElement(id, name) {
  let tpl = document.importNode(document.getElementById('tpl').content, true);
  tpl.querySelector('li').dataset.lid = id;
  tpl.querySelector('li').innerText = name;
  document.getElementById('myList').appendChild(tpl);
}
```

</details>


### Fetch

[Fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch) est la "nouvelle" API JS pour effectuer des requêtes asynchrones. C'est ce dont vous avez besoin pour communiquer depuis le front vers le back.

Une requête fetch est très simple à réaliser, mais elle mobilise certaines connaissances de JS, notemment la partie "Promesses".

<details>
  <summary>Un exemple de requête fetch basique</summary>

```js
// version sans async
fetch("URI", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({ test: "val" }),
}).then((r) => {
  r.json().then((res) => {
    // res has the response parsed as JSON
  });
});

// version async
async function fetchText(url) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Response status: ${response.status}`);
    }

    const res = await response.json();
    console.log(res);
  } catch (e) {
    console.error(e);
  }
}

```

</details>
