/*
----------------------------------------------------------------------------------------------------------------
-- FICHIER SQL POUR LA SÉANCE #11 (youtube.com/formationvideo8)
-- Jason CHAMPAGNE
----------------------------------------------------------------------------------------------------------------
-- Re-création de la base de données ----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
*/
DROP DATABASE IF EXISTS `fv_database`;
CREATE DATABASE IF NOT EXISTS `fv_database`;
USE `fv_database`;

/*
----------------------------------------------------------------------------------------------------------------
-- Création des tables -----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
*/
CREATE TABLE IF NOT EXISTS `fv_clients`
(
	`id_client` INT NOT NULL AUTO_INCREMENT, 
	`client_firstname` VARCHAR(65) NOT NULL, 
	`client_lastname` VARCHAR(65) NOT NULL, 
	`client_birthday` DATE NOT NULL, 
	`client_loyalty` INT NOT NULL, 
	PRIMARY KEY(`id_client`)
);
-------------------
---------------------
-
--------------------------

CREATE TABLE IF NOT EXISTS `blog_post`
(
		`id_post` INT NOT NULL AUTO_INCREMENT, 
		`user_name`VARCHAR(15) NOT NULL ,
		`date_publication` DATE NOT NULL, 
		`content_post`TEXT NOT NULL ,
		PRIMARY KEY(`id_post`)
);


-----------------

INSERT INTO `blog_post`(`user_name`, `date_publication`, `content_post`)
VALUES
('moh_most', '2019-12-17', 'fihom discord a mes frear ? '), 
('nabil salfils', '2019-12-18','irwas ar la hunt' ), 
( 'paul alois ', '2019-12-19', 'arjo g pas terminer la brallette' ), 
 (' sofiane  ', '2019-12-20', ' andat le btn d appelle ? '  );
