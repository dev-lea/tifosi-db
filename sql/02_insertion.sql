-- 02_insertion.sql
-- Peuplement de la base Tifosi à partir des fichiers Excel (boisson.xlsx, focaccia.xlsx, ingredient.xlsx, marque.xlsx)

USE tifosi;

-- ======================
-- 1. Marques
-- ======================
INSERT INTO marque (id_marque, nom_marque) VALUES (1, 'Coca-Cola');
INSERT INTO marque (id_marque, nom_marque) VALUES (2, 'Pepsi');
INSERT INTO marque (id_marque, nom_marque) VALUES (3, 'San Pellegrino');

-- ======================
-- 2. Ingrédients
-- ======================
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (1, 'Tomate');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (2, 'Mozzarella');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (3, 'Ail');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (4, 'Champignons');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (5, 'Basilic');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (6, 'Jambon');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (7, 'Roquette');

-- ======================
-- 3. Boissons
-- ======================
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (1, 'Coca-Cola Zéro', 1);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (2, 'Pepsi Max', 2);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (3, 'San Pellegrino Citron', 3);

-- ======================
-- 4. Focaccias
-- ======================
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (1, 'Raclaccia', 8.50);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (2, 'Italiana', 9.00);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (3, 'Vegetariana', 8.00);

-- ======================
-- 5. Association focaccia + ingrédients
-- ======================

-- Raclaccia
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (1, 2, 1); -- Mozzarella
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (1, 6, 1); -- Jambon
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (1, 3, 1); -- Ail

-- Italiana
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (2, 1, 1); -- Tomate
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (2, 2, 1); -- Mozzarella
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (2, 5, 1); -- Basilic

-- Vegetariana
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (3, 1, 1); -- Tomate
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (3, 2, 1); -- Mozzarella
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (3, 4, 1); -- Champignons
INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (3, 7, 1); -- Roquette
