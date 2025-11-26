-- ============================================================
-- SEED SQL FINAL - PROJET DIJON BARS
-- Schéma : AdamBar
-- Volume : 10 Quartiers, 20 Bars, 40 Bières, 162 Prix
-- ============================================================

-- 1. CONFIGURATION ET NETTOYAGE
SET
search_path TO AdamBar;

-- On vide les tables et on remet les compteurs (ID) à 1
TRUNCATE TABLE prices, beers, bars, districts RESTART IDENTITY CASCADE;


-- 2. INSERTION DES QUARTIERS (10)
INSERT INTO districts (name)
VALUES ('Centre-Ville'),
       ('Toison d''Or'),
       ('Montchapet'),
       ('Drapeau'),
       ('Bourroches'),
       ('Fontaine d''Ouche'),
       ('Grésilles'),
       ('Maladière'),
       ('Wilson'),
       ('Université');


-- 3. INSERTION DES BARS (20)
INSERT INTO bars (name, address, district_id)
VALUES ('Le Brighton', '33 Rue Verrerie', 1),
       ('Flannery''s', '4 Place Saint-Bénigne', 1),
       ('L''Industrie', '15 Rue des Godrans', 1),
       ('Beer Country', '12 Bd de la Toison d''Or', 2),
       ('Le Trinidad', 'Place du Théâtre', 1),
       ('Café de l''Univers', 'Rue de la Liberté', 1),
       ('Le Sherry Butt', 'Rue Berbisey', 1),
       ('Antre II Mondes', 'Rue d''Ahuy', 3),
       ('Le Blue Dog', 'Place Emile Zola', 1),
       ('Byron Bay', 'Rue Monge', 1),
       ('Campus Bar', 'Avenue de l''Université', 10), -- Bar Étudiant (Pas cher)
       ('Le Zinc', 'Avenue du Drapeau', 4),
       ('Montchapet Corner', 'Rue de Montchapet', 3),
       ('The Red Lion', 'Rue de la Préfecture', 1),
       ('Bar des Bourroches', 'Bd Eugène Fyot', 5),
       ('Le Fontainois', 'Av. du Lac', 6),
       ('Grésilles Pub', 'Av. Raymond Poincaré', 7),
       ('Le Wilson', 'Place Wilson', 9),
       ('Smart Bar', 'Rue de la Maladière', 8),
       ('Tech Brew', 'Rue Alain Bombard', 2);
-- Bar de Luxe (Cher)


-- 4. INSERTION DES BIÈRES (40)
INSERT INTO beers (name, type, degree, category)
VALUES ('Guinness', 'Stout', 4.2, 'Industrial'),           -- ID 1
       ('Punk IPA', 'IPA', 5.6, 'Craft'),                  -- ID 2
       ('Leffe Blonde', 'Abbey', 6.6, 'Industrial'),       -- ID 3
       ('Leffe Ruby', 'Fruit', 5.0, 'Industrial'),
       ('Chouffe', 'Strong Ale', 8.0, 'Craft'),            -- ID 5
       ('Delirium Tremens', 'Strong Ale', 8.5, 'Craft'),
       ('Heineken', 'Lager', 5.0, 'Industrial'),           -- ID 7
       ('1664', 'Lager', 5.5, 'Industrial'),               -- ID 8
       ('Grimbergen Blanche', 'Wheat', 6.0, 'Industrial'),
       ('Cuvée des Trolls', 'Blonde', 7.0, 'Craft'),       -- ID 10
       ('Kwak', 'Amber', 8.4, 'Industrial'),
       ('Tripel Karmeliet', 'Tripel', 8.4, 'Industrial'),
       ('Brooklyn Lager', 'Lager', 5.2, 'Craft'),
       ('Lagunitas IPA', 'IPA', 6.2, 'Craft'),             -- ID 14
       ('Goose Island IPA', 'IPA', 5.9, 'Craft'),          -- ID 15
       ('Chimay Bleue', 'Trappist', 9.0, 'Trappist'),      -- ID 16
       ('Orval', 'Trappist', 6.2, 'Trappist'),
       ('Rochefort 10', 'Trappist', 11.3, 'Trappist'),     -- ID 18
       ('Duvel', 'Strong Ale', 8.5, 'Craft'),
       ('Pelforth Brune', 'Brown Ale', 6.5, 'Industrial'), -- ID 20
       ('Hoegaarden', 'Wheat', 4.9, 'Industrial'),
       ('Desperados', 'Flavored', 5.9, 'Industrial'),
       ('Corona', 'Lager', 4.5, 'Industrial'),
       ('Paix Dieu', 'Tripel', 10.0, 'Craft'),             -- ID 24
       ('Rince Cochon', 'Blonde', 8.5, 'Craft'),
       ('Bourgogne des Flandres', 'Red Ale', 5.0, 'Craft'),
       ('Lindemans Kriek', 'Lambic', 3.5, 'Craft'),
       ('Brewdog Elvis Juice', 'IPA', 6.5, 'Craft'),       -- ID 28
       ('Stone IPA', 'IPA', 6.9, 'Craft'),                 -- ID 29
       ('Vedett Extra White', 'Wheat', 4.7, 'Craft'),
       ('Maredsous 8', 'Dubbel', 8.0, 'Abbey'),            -- ID 31
       ('Westmalle Tripel', 'Tripel', 9.5, 'Trappist'),
       ('Blanc de Blanc', 'Wheat', 5.0, 'Craft'),
       ('Meteor Pils', 'Pilsner', 5.0, 'Industrial'),
       ('Jenlain Ambrée', 'Amber', 7.5, 'Industrial'),     -- ID 35
       ('Goudale', 'Blonde', 7.2, 'Industrial'),
       ('Ch''ti Blonde', 'Blonde', 6.4, 'Craft'),
       ('La Bête', 'Amber', 8.0, 'Craft'),
       ('Ninkasi IPA', 'IPA', 6.0, 'Craft'),               -- ID 39
       ('Blanc Bec', 'Wheat', 4.8, 'Craft');
-- ID 40


-- 5. INSERTION DES PRIX (162 Relations)
INSERT INTO prices (bar_id, beer_id, price)
VALUES

-- Bar 1: Le Brighton (Irish vibe) - 8 bières
(1, 1, 7.50),
(1, 2, 8.00),
(1, 5, 7.00),
(1, 12, 8.50),
(1, 15, 8.20),
(1, 28, 8.50),
(1, 29, 8.50),
(1, 31, 7.50),

-- Bar 2: Flannery's (Pub vibe) - 8 bières
(2, 1, 6.50),
(2, 7, 5.00),
(2, 11, 8.00),
(2, 17, 6.00),
(2, 20, 5.50),
(2, 29, 7.50),
(2, 34, 5.00),
(2, 10, 7.00),

-- Bar 3: L'Industrie (Standard) - 8 bières
(3, 8, 4.50),
(3, 9, 5.00),
(3, 3, 5.50),
(3, 22, 6.00),
(3, 7, 4.50),
(3, 34, 4.00),
(3, 1, 6.00),
(3, 2, 6.50),

-- Bar 4: Beer Country (Craft focused) - 8 bières
(4, 2, 8.50),
(4, 14, 8.50),
(4, 15, 9.00),
(4, 28, 9.50),
(4, 29, 9.00),
(4, 39, 8.00),
(4, 40, 7.50),
(4, 24, 9.50),

-- Bar 5: Le Trinidad (Tourist spot) - 8 bières
(5, 23, 7.00),
(5, 21, 6.50),
(5, 8, 6.00),
(5, 7, 6.00),
(5, 1, 7.00),
(5, 22, 6.50),
(5, 12, 7.50),
(5, 5, 7.00),

-- Bar 6: Café de l'Univers (Student spot) - 8 bières
(6, 7, 3.50),
(6, 8, 3.50),
(6, 23, 5.00),
(6, 3, 4.50),
(6, 27, 4.00),
(6, 1, 5.00),
(6, 35, 4.50),
(6, 10, 5.50),

-- Bar 7: Le Sherry Butt (Premium) - 8 bières
(7, 12, 9.00),
(7, 16, 9.50),
(7, 17, 8.00),
(7, 18, 10.00),
(7, 24, 9.50),
(7, 31, 8.50),
(7, 32, 9.50),
(7, 40, 9.00),

-- Bar 8: Antre II Mondes (Geek/Rock) - 8 bières
(8, 5, 6.50),
(8, 6, 7.00),
(8, 10, 6.50),
(8, 13, 6.00),
(8, 25, 7.50),
(8, 38, 7.00),
(8, 37, 6.50),
(8, 1, 6.50),

-- Bar 9: Le Blue Dog (Chill) - 8 bières
(9, 2, 7.50),
(9, 14, 7.50),
(9, 28, 7.50),
(9, 29, 8.00),
(9, 39, 7.00),
(9, 3, 6.00),
(9, 5, 7.00),
(9, 12, 7.50),

-- Bar 10: Byron Bay (Australian vibe) - 8 bières
(10, 23, 6.00),
(10, 22, 6.00),
(10, 7, 5.50),
(10, 8, 5.50),
(10, 21, 6.00),
(10, 13, 6.50),
(10, 2, 6.50),
(10, 39, 6.00),

-- Bar 11: Campus Bar (LE MOINS CHER) - 9 bières
-- IMPORTANT : Vend une IPA (ID 2 et ID 39) à très bas prix pour valider la requête n°2
(11, 7, 3.00),
(11, 8, 3.00),
(11, 3, 4.00),
(11, 9, 4.00),
(11, 22, 4.50),
(11, 34, 3.00),
(11, 2, 4.00),
(11, 39, 4.50),
(11, 1, 5.00),

-- Bar 12: Le Zinc (Neighborhood bar) - 8 bières
(12, 1, 6.00),
(12, 2, 7.00),
(12, 3, 5.50),
(12, 4, 5.50),
(12, 35, 6.00),
(12, 20, 5.50),
(12, 21, 5.50),
(12, 14, 6.50),

-- Bar 13: Montchapet Corner - 8 bières
(13, 5, 7.50),
(13, 24, 9.00),
(13, 26, 6.50),
(13, 38, 7.00),
(13, 30, 7.50),
(13, 11, 8.00),
(13, 1, 7.00),
(13, 3, 6.50),

-- Bar 14: The Red Lion (Pub) - 8 bières
(14, 1, 6.00),
(14, 2, 7.00),
(14, 14, 7.50),
(14, 29, 8.00),
(14, 30, 6.00),
(14, 11, 7.50),
(14, 20, 6.00),
(14, 12, 7.00),

-- Bar 15: Bar des Bourroches - 8 bières
(15, 7, 4.00),
(15, 8, 4.00),
(15, 37, 4.50),
(15, 36, 5.00),
(15, 35, 4.50),
(15, 21, 4.50),
(15, 1, 5.50),
(15, 2, 6.00),

-- Bar 16: Le Fontainois - 8 bières
(16, 8, 4.20),
(16, 3, 5.00),
(16, 4, 5.00),
(16, 9, 5.20),
(16, 27, 4.80),
(16, 34, 4.00),
(16, 20, 4.50),
(16, 5, 6.00),

-- Bar 17: Grésilles Pub - 8 bières
(17, 7, 3.80),
(17, 8, 3.80),
(17, 22, 5.00),
(17, 34, 4.00),
(17, 20, 4.50),
(17, 36, 5.00),
(17, 10, 6.00),
(17, 3, 5.50),

-- Bar 18: Le Wilson - 8 bières
(18, 5, 6.00),
(18, 6, 6.50),
(18, 12, 7.00),
(18, 32, 7.00),
(18, 33, 7.50),
(18, 25, 6.50),
(18, 1, 6.50),
(18, 14, 7.00),

-- Bar 19: Smart Bar - 8 bières
(19, 14, 6.00),
(19, 15, 6.00),
(19, 2, 6.00),
(19, 28, 6.00),
(19, 39, 5.50),
(19, 40, 5.50),
(19, 13, 6.00),
(19, 1, 6.00),

-- Bar 20: Tech Brew (LE BAR DE LUXE) - 9 bières
-- IMPORTANT : AUCUN prix en dessous de 6.00€ pour valider la requête n°4
(20, 16, 9.50),
(20, 18, 12.00),
(20, 24, 11.00),
(20, 2, 8.50),
(20, 14, 9.00),
(20, 29, 9.50),
(20, 32, 10.00),
(20, 30, 9.00),
(20, 1, 9.00);