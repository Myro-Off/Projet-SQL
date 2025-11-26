# Requêtes Analytiques

Voici les 5 requêtes obligatoires exécutées sur le schéma `AdamBar`.

## 1. Prix moyen de la bière par quartier
Nous calculons le prix moyen de toutes les bières servies dans les bars, regroupées par quartier, pour voir quelles zones sont les plus chères.
### Prix moyen de la bière par quartier
```sql
SELECT 
    d.name AS district_name, 
    ROUND(AVG(p.price), 2) AS average_price
FROM AdamBar.districts d
    JOIN AdamBar.bars b ON d.id = b.district_id
    JOIN AdamBar.prices p ON b.id = p.bar_id
GROUP BY d.name
ORDER BY average_price ASC;
```
### Bars vendant l'IPA la moins chère
```sql
SELECT
    b.name AS bar_name,
    be.name AS beer_name,
    p.price
FROM AdamBar.bars b
    JOIN AdamBar.prices p ON b.id = p.bar_id
    JOIN AdamBar.beers be ON p.beer_id = be.id
WHERE be.type = 'IPA'
ORDER BY p.price ASC
    LIMIT 1;
```
### Bières vendues dans ≥ 5 bars
```sql
SELECT
    be.name AS beer_name,
    COUNT(p.bar_id) AS bar_count
FROM AdamBar.beers be
    JOIN AdamBar.prices p ON be.id = p.beer_id
GROUP BY be.name
HAVING COUNT(p.bar_id) >= 5
ORDER BY bar_count DESC;
```
### Bars sans bière à moins de 6€
```sql
SELECT
    b.name AS bar_name,
    MIN(p.price) AS cheapest_beer_price
FROM AdamBar.bars b
    JOIN AdamBar.prices p ON b.id = p.bar_id
GROUP BY b.name
HAVING MIN(p.price) >= 6.00;
```
### Top bar avec panier moyen maximum
```sql
SELECT 
    b.name AS bar_name, 
    ROUND(AVG(p.price), 2) AS avg_basket
FROM AdamBar.bars b
    JOIN AdamBar.prices p ON b.id = p.bar_id
GROUP BY b.name
ORDER BY avg_basket DESC
LIMIT 1;
```