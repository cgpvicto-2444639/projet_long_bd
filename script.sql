DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE clients (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50),
    num_telephone VARCHAR(20),
    adresse_livraison VARCHAR(100)
);

CREATE TABLE commandes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    date_commande DATETIME,
    date_livraison DATETIME,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE attente_livraisons(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    commande_id INT,
    FOREIGN KEY (commande_id) REFERENCES commandes(id)
);

CREATE TABLE croutes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_croute VARCHAR(50)
);

CREATE TABLE sauces(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_sauce VARCHAR(50)
);

CREATE TABLE pizzas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50),
    commande_id INT,
    croute_id INT,
    sauce_id INT,
    FOREIGN KEY (commande_id) REFERENCES commandes(id),
    FOREIGN KEY (croute_id) REFERENCES croutes(id),
    FOREIGN KEY (sauce_id) REFERENCES sauces(id)
);

CREATE TABLE garnitures(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_garniture VARCHAR(50)
);

CREATE TABLE pizzas_garnitures(
	pizza_id INT,
    garniture_id INT,
    PRIMARY KEY(pizza_id, garniture_id),
    FOREIGN KEY(pizza_id) REFERENCES pizzas(id),
    FOREIGN KEY(garniture_id) REFERENCES garnitures(id)
);
    
# ***************************** INSERTIONS ***************************** #

INSERT INTO clients (nom, num_telephone, adresse_livraison)
VALUES
('Christine', '819-300-3941', '3-11 rue Bissonnette Warwick');

INSERT INTO commandes (date_commande, date_livraison, client_id)
VALUES 
('2025-11-7', '2025-11-8', 1);

INSERT INTO attente_livraisons(commande_id)
VALUES
(1);

INSERT INTO croutes (nom_croute)

