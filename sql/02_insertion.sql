-- 02_insertion.sql
USE tifosi;
-- Exemple: INSERT INTO marque VALUES (1, 'Coca-Cola');

-- Marques
-- INSERT INTO marque (id_marque, nom_marque) VALUES (1, 'Coca-Cola');
-- INSERT INTO marque (id_marque, nom_marque) VALUES (2, 'Pepsi');

-- Ingrédients
-- INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (1, 'Tomate');
-- INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (2, 'Mozzarella');

-- Boissons
-- INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (1, 'Coca Zero', 1);
-- INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (2, 'Pepsi Max', 2);

-- Focaccias
-- INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (1, 'Raclatta', 8.50);
-- INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (2, 'Italiana', 9.20);

-- Association focaccia → ingrédients
-- INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (1, 1, 1);
-- INSERT INTO est_constitue (id_focaccia, id_ingredient, quantite) VALUES (1, 2, 1);