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

CREATE TABLE pizzas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50),
    commande_id INT,
    FOREIGN KEY (commande_id) REFERENCES commandes(id)
);

CREATE TABLE croutes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_croute VARCHAR(50),
    pizza_id INT,
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id)
);

CREATE TABLE sauces(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom_sauce VARCHAR(50),
    pizza_id INT,
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id)
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
    
    
