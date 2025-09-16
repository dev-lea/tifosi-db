-- 03_requetes.sql
USE tifosi;

-- 1. Liste des noms des focaccias par ordre alphabétique croissant
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;

-- Attendu : Italiana, Raclaccia, Vegetariana
-- Obtenu  : Italiana, Raclaccia, Vegetariana
-- Commentaire : OK

-- 2. Nombre total d'ingrédients
SELECT COUNT(*) AS nb_ingredients
FROM ingredient;

-- Attendu : 7
-- Obtenu  : 7
-- Commentaire : OK

-- 3. Prix moyen des focaccias (2 décimales)
SELECT ROUND(AVG(prix), 2) AS prix_moyen_focaccia
FROM focaccia;

-- Attendu : 8.50
-- Obtenu  : 8.50
-- Commentaire : OK

-- 4. Liste des boissons avec leur marque, triée par nom de boisson
SELECT b.nom_boisson, m.nom_marque
FROM boisson b
JOIN marque m ON m.id_marque = b.id_marque
ORDER BY b.nom_boisson ASC;

-- Attendu :
--   Coca-Cola Zéro | Coca-Cola
--   Pepsi Max      | Pepsi
--   San Pellegrino Citron | San Pellegrino
-- Obtenu  : identique
-- Commentaire : OK

-- 5. Ingrédients de la focaccia "Raclaccia"
SELECT i.nom_ingredient
FROM focaccia f
JOIN est_constitue ec ON ec.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = ec.id_ingredient
WHERE LOWER(f.nom_focaccia) = LOWER('Raclaccia')
ORDER BY i.nom_ingredient;

-- Attendu : Ail, Jambon, Mozzarella
-- Obtenu  : Ail, Jambon, Mozzarella
-- Commentaire : OK

-- 6. Le nom et le nombre d'ingrédients pour chaque focaccia
SELECT f.nom_focaccia, COUNT(ec.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN est_constitue ec ON ec.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
ORDER BY f.nom_focaccia;

-- Attendu :
--   Italiana   | 3
--   Raclaccia  | 3
--   Vegetariana| 4
-- Obtenu  : identique
-- Commentaire : OK

-- 7. La focaccia qui a le plus d'ingrédients
SELECT f.nom_focaccia
FROM focaccia f
JOIN est_constitue ec ON ec.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
ORDER BY COUNT(ec.id_ingredient) DESC
LIMIT 1;

-- Attendu : Vegetariana
-- Obtenu  : Vegetariana
-- Commentaire : OK

-- 8. Liste des focaccias qui contiennent de l'ail
SELECT DISTINCT f.nom_focaccia
FROM focaccia f
JOIN est_constitue ec ON ec.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = ec.id_ingredient
WHERE LOWER(i.nom_ingredient) LIKE '%ail%'
ORDER BY f.nom_focaccia;

-- Attendu : Raclaccia
-- Obtenu  : Raclaccia
-- Commentaire : OK

-- 9. Ingrédients inutilisés
SELECT i.nom_ingredient
FROM ingredient i
LEFT JOIN est_constitue ec ON ec.id_ingredient = i.id_ingredient
WHERE ec.id_ingredient IS NULL
ORDER BY i.nom_ingredient;

-- Attendu : (aucun)
-- Obtenu  : (aucun)
-- Commentaire : OK

-- 10. Focaccias qui n'ont pas de champignons
SELECT f.nom_focaccia
FROM focaccia f
WHERE f.id_focaccia NOT IN (
  SELECT ec.id_focaccia
  FROM est_constitue ec
  JOIN ingredient i ON i.id_ingredient = ec.id_ingredient
  WHERE LOWER(i.nom_ingredient) LIKE '%champignon%'
)
ORDER BY f.nom_focaccia;

-- Attendu : Italiana, Raclaccia
-- Obtenu  : Italiana, Raclaccia
-- Commentaire : OK

