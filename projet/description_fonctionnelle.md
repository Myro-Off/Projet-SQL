# Description Fonctionnelle

## Contexte
Ce projet a pour but de modéliser un système référençant les bars de la ville de Dijon, en les organisant par quartiers (districts), en définissant leur carte des boissons (bières) et en fixant les prix associés.

## Entités

1.  **Quartiers** (Table : `districts`) : Les zones géographiques de la ville.
    * *Attributs :* ID, Nom.
2.  **Bars** : Les établissements servant les boissons.
    * *Attributs :* ID, Nom, Adresse, Quartier (Clé Étrangère).
3.  **Bières** : Les produits vendus.
    * *Attributs :* ID, Nom, Type (ex : IPA, Stout...), Degré (% d'alcool), Catégorie (ex : Artisanale / Industrielle).
4.  **Prix** (Table d'association : `prices`) : Le lien pivot entre un Bar et une Bière.
    * *Attributs :* Prix.

## Règles de Gestion & Relations

* **Localisation** : Un Bar est situé dans un et un seul **Quartier**. Un Quartier peut contenir **plusieurs** Bars.
* **Catalogue** : Une Bière possède des caractéristiques fixes (degré, catégorie).
* **Tarification** : Le prix d'une bière dépend du bar. L'attribut `price` appartient donc à la relation entre Bar et Bière (une même bière peut avoir des prix différents selon les bars).
* **Intégrité** : Les contraintes de Clé Primaire (PK) et Clé Étrangère (FK) garantissent la cohérence des liens.