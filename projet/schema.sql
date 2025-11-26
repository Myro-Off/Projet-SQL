-- Création du Schéma
CREATE SCHEMA IF NOT EXISTS AdamBar;

-- Utilisation du schéma AdamBar
SET search_path TO AdamBar;

-- Nettoyage
DROP TABLE IF EXISTS prices;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS bars;
DROP TABLE IF EXISTS districts;

-- 1. Table des Quartiers
CREATE TABLE districts
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Table des Bars
CREATE TABLE bars
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    address     VARCHAR(255),
    district_id INT          NOT NULL,
    CONSTRAINT fk_district
        FOREIGN KEY (district_id)
            REFERENCES districts (id)
            ON DELETE CASCADE
);

-- 3. Table des Bières
CREATE TABLE beers
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(100) NOT NULL,
    type     VARCHAR(50),
    degree   DECIMAL(3, 1) CHECK (degree >= 0 AND degree <= 100),
    category VARCHAR(50) -- ex : 'Craft', 'Industrial', 'Trappist'
);

-- 4. Table des Prix (Association)
CREATE TABLE prices
(
    bar_id  INT           NOT NULL,
    beer_id INT           NOT NULL,
    price   DECIMAL(5, 2) NOT NULL CHECK (price > 0),
    PRIMARY KEY (bar_id, beer_id),
    CONSTRAINT fk_bar
        FOREIGN KEY (bar_id)
            REFERENCES bars (id)
            ON DELETE CASCADE,
    CONSTRAINT fk_beer
        FOREIGN KEY (beer_id)
            REFERENCES beers (id)
            ON DELETE CASCADE
);

-- 5. PERFORMANCE & INDEX

-- Je suis conscient que c'est peu utile pour une si petite base de donnée,
-- mais je tenais à apprendre les bonnes pratiques.

-- ===============================================
-- INDEX STANDARD (Clés Étrangères & Recherche Simple)
-- ===============================================

-- Accélère les jointures (JOINS) entre Bars et Quartiers
CREATE INDEX idx_bars_district_id ON bars(district_id);

-- Accélère les jointures entre la table de Prix et les Bars/Bières
CREATE INDEX idx_prices_bar_id ON prices(bar_id);
CREATE INDEX idx_prices_beer_id ON prices(beer_id);

-- Accélère la recherche par type (ex : "Trouver les IPA")
CREATE INDEX idx_beers_type ON beers(type);

-- Accélère les tris par prix et les calculs MIN/AVG
CREATE INDEX idx_prices_price ON prices(price);


-- ===============================================
-- INDEX COMPOSÉS (Multi-Colonnes pour Filtre/Tri)
-- ===============================================

-- 1. Recherche du prix le plus bas pour une bière spécifique
-- Utile pour : SELECT * FROM prices WHERE beer_id = X ORDER BY price
CREATE INDEX idx_prices_beer_price ON prices (beer_id, price);

-- 2. Liste de toutes les bières d'un bar triées par prix
-- Utile pour : SELECT * FROM prices WHERE bar_id = Y ORDER BY price
CREATE INDEX idx_prices_bar_price ON prices (bar_id, price);

-- 3. Recherche ou tri de bars au sein d'un quartier
-- Utile pour : SELECT * FROM bars WHERE district_id = Z ORDER BY name
CREATE INDEX idx_bars_district_name ON bars (district_id, name);