-- 01_schema.sql
DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tifosi;

-- --- utilisateur d'application pour administrer la base ---
DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'Tifosi2025!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;
-- --- fin utilisateur ---

CREATE TABLE marque (
  id_marque INT PRIMARY KEY,
  nom_marque VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE ingredient (
  id_ingredient INT PRIMARY KEY,
  nom_ingredient VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE boisson (
  id_boisson INT PRIMARY KEY,
  nom_boisson VARCHAR(100) NOT NULL,
  id_marque INT NOT NULL,
  CONSTRAINT uq_boisson UNIQUE (nom_boisson, id_marque),
  CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

CREATE TABLE focaccia (
  id_focaccia INT PRIMARY KEY,
  nom_focaccia VARCHAR(100) NOT NULL UNIQUE,
  prix DECIMAL(6,2) NOT NULL CHECK (prix >= 0)
);

CREATE TABLE est_constitue (
  id_focaccia INT NOT NULL,
  id_ingredient INT NOT NULL,
  quantite INT NOT NULL DEFAULT 1,
  PRIMARY KEY (id_focaccia, id_ingredient),
  CONSTRAINT fk_ec_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
  CONSTRAINT fk_ec_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

CREATE TABLE menu (
  id_menu INT PRIMARY KEY,
  nom_menu VARCHAR(100) NOT NULL UNIQUE,
  prix DECIMAL(6,2) NOT NULL CHECK (prix >= 0)
);

CREATE TABLE comprend (
  id_menu INT NOT NULL,
  id_focaccia INT NOT NULL,
  quantite INT NOT NULL DEFAULT 1,
  PRIMARY KEY (id_menu, id_focaccia),
  CONSTRAINT fk_cm_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
  CONSTRAINT fk_cm_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

CREATE TABLE contient (
  id_menu INT NOT NULL,
  id_boisson INT NOT NULL,
  quantite INT NOT NULL DEFAULT 1,
  PRIMARY KEY (id_menu, id_boisson),
  CONSTRAINT fk_ct_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
  CONSTRAINT fk_ct_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);

CREATE TABLE client (
  id_client INT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE,
  code_postal VARCHAR(10)
);

CREATE TABLE achete (
  id_client INT NOT NULL,
  id_menu INT NOT NULL,
  date_achat DATE NOT NULL,
  PRIMARY KEY (id_client, id_menu, date_achat),
  CONSTRAINT fk_ac_client FOREIGN KEY (id_client) REFERENCES client(id_client),
  CONSTRAINT fk_ac_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);
