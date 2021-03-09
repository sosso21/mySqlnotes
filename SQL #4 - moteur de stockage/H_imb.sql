/*
----------------------------------------------------------------------------------------------------------------
-- FICHIER SQL POUR LA SÉANCE #11 (youtube.com/formationvideo8)
-- Jason CHAMPAGNE
----------------------------------------------------------------------------------------------------------------
-- Re-création de la base de données ----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
*/
DROP DATABASE IF EXISTS `h_imb`;
CREATE DATABASE IF NOT EXISTS `h_imb`;
USE `h_imb`;

/*
----------------------------------------------------------------------------------------------------------------
-- Création des tables -----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
*/
CREATE TABLE IF NOT EXISTS `h_imb`
(
	`id_bien` INT NOT NULL AUTO_INCREMENT, 
	`imb_name` VARCHAR(25) NOT NULL, 
	`price` INT NOT NULL, 
	`adress` VARCHAR(50) NOT NULL, 
	`city` VARCHAR(20) NOT NULL, 
	PRIMARY KEY(`id_bien`)
	
);
--ENGINE = MyISAM 
-------------------
---------------------
-

-----------------

INSERT INTO h_imb (`imb_name`, `price`, `adress` , `city` )
VALUES

('studio', '30000', 'Bordj mnayel','Boumerdes'), 
('appart F4', '50000', 'djborland','tizi ouzou'), 
('maison avec garage', '80000', 'bab zouar' ,'Alger'), 
('garage', '50000', 'draa ben khedda','tizi ouzou'), 
('magazin', '30000', 'Daily brahim','Alger'), 
('cafeteria', '10000', 'Azazga','tizi ouzou' ), 
('appartement f3', '40000', 'djborland','tizi ouzou'), 
('garage', '30000', 'draa ben khedda','tizi ouzou' ), 
('boutique spacieuse', '80000', 'Azazga','tizi ouzou' ), 
('salle machine', '50000', 'Bordj mnayel','Boumerdes' ), 
('garage', '30000', 'Daily brahim','Alger' ), 
('appartement', '40000', 'djborland','tizi ouzou' ), 
('studio', '80000', 'djborland','tizi ouzou' ), 
('appartemnt f2', '30000', 'Daily brahim','Alger' ), 
('sale de sport', '450000', 'Azazga','tizi ouzou' ), 
('pempe à essence', '40000', 'Daily brahim','Alger' ), 
('restorant', '80000', 'draa ben khedda','tizi ouzou' ), 
('maison avec garage', '30000', 'Daily brahim','Alger' ), 
('appartemnt f4', '40000', 'bab zouar',' Alger' ), 
('maison', '80000', 'bab zouar' ,'Alger'), 
('garage', '50000', 'draa ben khedda','tizi ouzou'), 
('magazin', '30000', 'Daily brahim','Alger'), 
('cafeteria', '10000', 'Azazga','tizi ouzou' ), 
('appartement f3', '40000', 'djborland','tizi ouzou'), 
('garage', '30000', 'draa ben khedda','tizi ouzou' ), 
('boutique spacieuse', '80000', 'Azazga','tizi ouzou' ), 
('salle machine', '50000', 'Bordj mnayel','Boumerdes' ), 
('garage', '30000', 'Daily brahim','Alger' ), 
('appartement', '40000', 'djborland','tizi ouzou' ), 
('studio', '80000', 'djborland','tizi ouzou' ), 
('appartemnt f2', '30000', 'Daily brahim','Alger' ), 
('sale de sport', '450000', 'Azazga','tizi ouzou' ), 
('pempe à essence', '40000', 'Daily brahim','Alger' ), 
('restorant', '80000', 'draa ben khedda','tizi ouzou' ), 
('maison avec garage', '30000', 'Daily brahim','Alger' ), 
('appartemnt f4', '40000', 'bab zouar',' Alger' ), 
('cafeteria', '18000', 'Azazga','tizi ouzou' ), 
('studio', '30000', 'Bordj mnayel','Boumerdes'), 
('appart F4', '50000', 'djborland','tizi ouzou'), 
('maison avec garage', '80000', 'bab zouar' ,'Alger'), 
('garage', '50000', 'draa ben khedda','tizi ouzou'), 
('magazin', '30000', 'Daily brahim','Alger'), 
('cafeteria', '10000', 'Azazga','tizi ouzou' ), 
('appartement f3', '40000', 'djborland','tizi ouzou'), 
('garage', '30000', 'draa ben khedda','tizi ouzou' );

----------------------
-----------------------
drop table `users` ;
CREATE TABLE IF NOT EXISTS `users`
(
	`id_user` INT NOT NULL AUTO_INCREMENT, 
	`user_name` VARCHAR(20) NOT NULL UNIQUE , 
	`pass`  VARCHAR(64) NOT NULL, 
	`is_admin` BOOLEAN  DEFAULT 0 ,
	PRIMARY KEY(`id_user`)
);
alter table `users` ENGINE = MyISAM ;
-------------------
---------------------
INSERT INTO users (`user_name`, `pass`, `is_admin`   )
VALUES
('user', sha2('user',256), 0), 
('admin',  sha2('admin',256), 1 );
-----------------
