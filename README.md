# Tifosi DB

Projet MySQL.

Base de données relationnelle pour le restaurant **Le Tifosi** (street-food italien).  
Projet réalisé dans le cadre du devoir de base de données.

---

# Structure du projet

- **sql/**
  - `01_schema.sql` → création de la base `tifosi`, tables, contraintes et utilisateur dédié
  - `02_insertion.sql` → insertion des données issues des fichiers Excel
  - `03_requetes.sql` → 10 requêtes de test commentées

- **data/**
  - `boisson.xlsx`
  - `focaccia.xlsx`
  - `ingredient.xlsx`
  - `marque.xlsx`

- **results/**
  - `tests.md` → résultats attendus / obtenus des requêtes

---

#  Instructions

1. **Créer la base et les tables**
   ```sql
   SOURCE sql/01_schema.sql;
   
# Insérer les données
SOURCE sql/02_insertion.sql;

# Lancer les requêtes de test
SOURCE sql/03_requetes.sql;

# Fonctionnalités

- Gestion des focaccias, ingrédients, marques et boissons
- Scripts SQL pour la création et le peuplement de la base
- 10 requêtes de test avec résultats commentés

# Auteur
dev-lea
