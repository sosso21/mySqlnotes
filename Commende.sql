
CD mysql\bin
mysql.exe -u root



#y'a  2 moteur de donnée principal
# InnoDB  : lecture lente , plus sécuriser pour ecrire
#MyISAM   : rapide , non sécuriser
#pour se connecter : mysql.exe -u root
/** voir les bases de donnée : SHOW DATABASES ;
    Pour voir les moteur :   SHOW ENGINES;
    pour changer de moteur : ---------
     alter table users ENGINE=InnoDB  ;
    crée database  : CREATE DATABASE IF NOT EXISTS  `test` ;
    utilier : USE `test`;
    supprimer : DROP DATABASE `test` ;
    */
    -- voir les tables
    Show TABLES ;

-- Crée une table --
CREATE TABLE `s_matable` 
(
    `id_user` int,
    `mytable_name` VARCHAR(65),
    `birthday` DATE 
)
ENGINE = MyISAM
CARACTER SET utf8mb4
COLATE utf8mb4_unicode_ci;

# --VOIR LES INFO  d'une table -- 
DESCRIBE s_matable``; -- desk | describe
ALTER TABLE `s_matable`; #modifier la table
ADD `my_follower`TYPEINT(5);
DROP `birthday`;
MODIFY `my_follower` SMALLINT;  #modifier le type de la colomn
CHANGE `ancien_nom_de_colomn` `NV_nom`  iny ; #changer le nom de la colomn .. le changemnt de type est facultatif
SHOW TABLE STATUS ; # voir le statut 
DROP TABLE IF EXISTS `my_follower` ; #supp ma table
-----------------------------------
--pour crée une table avc des contrainte

--NOT NULL 
--DEFAULT
* alter table `ma_table` 
* MODIFY `name_user ` VARCHAR(15)  NOT NULL ;
MODIFY `my_follower` BOOLEAN  DEFAULT `false`  ;

--pour supprimer la contrainte :
      * alter table `ma_table` 
      * ALTER `ma_ligne` DROP DEFAULT;

-- CHECK
-- Pour faire plusieurs CHECK
     * ALTER TABLE `my_table`
     * ADD CONSTRAINT chk_tobig CHECK( `user_age` >= 13 AND `price_product` >=0 );
--supp CHECK 
     * ALTER TABLE `my_table`
      *DROP CHECK chk_tobig ;
--UNIQUE
       * ALTER TABLE `ma_table`
       * ADD CONSTRAINT unq_user UNIQUE( `user_name` , `user_name`);
-- pour supp
   * ALTER TABLE `ma_table`
   * DROP INDEX unq_user;

   --- PRIMARY KEY -- >crée en auto increment un ID - elle est unique
    *ALTER TABLE `ma_table`
   *PRIMARY KEY  (`id_user`) ;

--FOREIGN KEY -- Faire reference a  une autre ligne d'un autre tableau
  * ALTER TABLE `article_table`
  *  ADD  FOREIGN KEY (`id_creator`) REFERENCES `s_table` (`id_user`);
--supprimer 
  * DROP  FOREIGN KEY (`id_creator`)

-- AUTO_INCREMENT 

--INDEX ---> c en qlq sorte une reference , ca accelere les recherche
  * ALTER TABLE `s_table`
   * CREATE INDEX `idx_user` ON `s_table` (`user_name`,`id_user`);
-- supp
   * DROP INDEX  `idx_user` ;


CREATE TABLE `s_matable` 
(
    `id_user` int NOT NULL AUTO_INCREMENT  ,
    `price_product` int NOT NULL CHECK( `price_product` >=0),
    `user_name` VARCHAR(65) NOT NULL,
    `birthday` DATE NOT NULL ,
    `authaurity_admin` BOOLEAN DEFAULT 0 ,
     UNIQUE ( `user_name`) ,
     PRIMARY KEY( ` id_name`) ,
);

CREATE TABLE `article_table`
(
    `article_name` TEXT NOT NULL,
    `publication_date` DATE NOT NULL,
    `id_creator` int NOT NULL ,

      PRIMARY KEY(`id_name`) ,
      FOREIGN KEY (`id_creator`) REFERENCES `s_table` (`id_user`)
);
--------------------------------------------------------------------------------------------

-- voir l'utilisteur courrent
   ** select current_user();
-- crée un user
    ** CREATE USER IF NOT EXISTS `sofiane`@`localhost` IDENTIFIED BY `0000`;
-- changer ou definir un mdp   
    ** SET PASSWORD FOR `sofiane`@`localhost`= `0001` ;
    ** alter USER  `sofiane`@`localhost` IDENTIFIED BY `0002`;
-- rename 
  ** RENAME USER `sofiane`@`localhost` TO `sosso`@`localhost`;

-- Supprimer :
  **  RENAME USER  `sosso`@`localhost`;

-- Privilege
   ** GRANT ALL ON s_table.*  TO   `sosso`@`localhost`;
   

-- Retirer des droits
--il peut pas supprimier la table s_table 

   **  REVOKE DROP TABLE 
   TO s_table.*
   FROM `sosso`@`localhost`;

   ---------------------------------------------------------------
   /* 
       video 9
-- recuperer des  données d'une base :
  SELECT  

*/

-- SELECT
 SELECT `product_name`  FROM `fv_products`; 

 SELECT `product_name` ,`product_amount` FROM `fv_products`;
 
  SELECT * FROM `fv_products`; --recuperer tt 
   
   SELECT DISTINCT `product_amount` FROM `fv_products`; -- NE PAS repeter le meme nom 

   SELECT `product_name` AS `Nom du produit`  FROM `fv_products`;  --faire un alias

---------------------------------------------------------------------------------------------------------------------------------------------
/*
 video 10
   les filtres
     = 
     !=
     > < >=  <=
  -- on peut aussi faire 
      AND  
      OR 


*/
   SELECT * FROM `fv_games` WHERE `game_stock` > 1  ; 

      SELECT * FROM `fv_games` WHERE `game_stock` > 1  AND `game_stock` <= 5  ; 
     
     C pareil que 'stock = 1 or 2 or 3 '
      SELECT * FROM `fv_games` WHERE `game_stock` IN(1,2,3); 
       
      SELECT * FROM `fv_games` WHERE `game_price` BETWEEN 0 AND 44.39; 

     SELECT * FROM `fv_games` WHERE `game_title` LIKE 'Tekken%';
     -- c possible de faire '%Tekken%' 
     -- le % signifit n'importe quoi 
     -- exemple blabla bla Tekken bla bla

       SELECT * FROM `fv_games` WHERE `game_title` LIKE 'Tekken_';
          -- c pareil que % mais il accepte que 1 caractere
          -- exemple teken1 

         SELECT * FROM `fv_games` WHERE `game_price` IS NOT NULL ;
                                                      IS NULL
        
         SELECT * FROM `fv_games` ORDER BY `game_title` ; 

          SELECT * FROM `fv_games` ORDER BY `game_title` DESC ;
            --  c pareil mais avc un ordrre decroissant
            -- l'ordre croissant est   ASC

     SELECT * FROM `fv_games` ORDER BY `game_title` `game_price` DESC ;
            -- si deux jeux on le mm nom 
            -- on les ordonent par prix

SELECT * FROM `fv_games`LIMIT 10  ;
-- LIMITER LES AFFICHAGE

SELECT * FROM `fv_games`LIMIT 5 OFFSET 3  ;
  -- LIMITER AFFICHAGE A 5 mais commencer par le 4 em element
  -- oui j sais qu'il y a ecrit  3
  -- mais ... informatique .. on compte a partir de 0 tt ca tt ca

SELECT * FROM `fv_games`LIMIT 3,5  ;
-- c vraiment pareil que la commende precedente

-------------------------------------------------------------------------
/* 
   video 11
  
  --Ajourer des valeur au tableau
    -- j'utilise tjr base 2


*/

  INSERT INTO `fv_games` (`game_title`,`game_releaseDate`,`game_price`,`game_stock`)
VALUES('Grand Theft Auto  V', '2013-10-29', 66.58, 5);

-- Pr faire un enregistremnt de bcp de ligne 

  INSERT INTO `fv_games` (`game_title`,`game_releaseDate`,`game_price`,`game_stock`)
VALUES('Assasins creed odicé', '2017-10-29', 61.8, 3),
('RED SHADOW LEGEND', '2018-07-29', 10 , 3),
('RULE OF SURVIVAL', '2018-01-24', 20, 7) ;

----------------------------------------------------
--  video 12 *-*

 --modifier des donnée

  UPDATE  `fv_games`
  SET game_stock  = 10
  WHERE id_game = 25 ;

--  modifier plusieurs :

  UPDATE  `fv_games`
 SET game_stock  = 10 ,   game_price  = 39.99
  WHERE id_game = 25 ;

-- supprimer une ligne 

  DELETE FROM  `fv_games`
  WHERE id_game = 22  ;

  -------------------------------------------------------------------
/* video 13 
*/ 
-- fenction pour compter le nombre de données
  SELECT count(*) FROM fv_games ;  

-- la moyenne :
   SELECT AVG(`game_price`) FROM fv_games ;

--  afficher le prix max / le nom le plus proche de  A
   SELECT max(`game_price`) FROM fv_games ;

--  afficher le prix min / le nom le plus proche de z
   SELECT min(`game_price`) FROM fv_games ;

-- voir la somme de jeu qu'on a  ( 1+5+4+1.... )=101
      SELECT sum(`game_stock`) FROM fv_games ;
     
     
      -----------------------------------------------------------------------------------------------------
--shpprimer une ligne
*DELETE FROM `ma_table` WHERE (` name` =``adolph` );



/* Seance 14 ------ Group By

# -- 1 -- Retourner un tableau du genre  :
            # 3 jeux ou on a 1 seul boite
            #  6 jeux ou on  as 2 boites ....
            #7 ou on as 3 boites  
            */

             SELECT  COUNT(*) AS 'Nombre_de_resultat ' , game_stock FROM fv_games GROUP BY game_stock ;

            

        # ---- 2
             /*  Retourné La somme des Prix des JEux  
                 #  60€ De 4 Boites 
                 # 100€ de 6 boites  
                */ 
          
   SELECT SUM(game_price)  , game_stock 
   FROM fv_games   
   GROUP BY game_stock  WITH ROLLUP ;
          
          # 3 
           
             /*  Retourné La somme des Prix des JEux  QD le SUM(Strock) > 41
                 #  60€ De 4 Boites 
                 # 100€ de 6 boites  
                */ 

      
   SELECT SUM(game_price)  , game_stock 
   FROM fv_games   
   GROUP BY game_stock 
   HAVING SUM(game_price) > 41 ;


/*----------- video  17 - JOIN  */

   # 1  joindre  categ et id categ et post 

   SELECT * from  categorie_post 
   INER JOIN post ON categorie_post.id_post = post.id
    where categorie_post.id_categorie = 1 ;

    -- 2 pareil mais avec ontrainte

     SELECT * from  categorie_post    LEFT JOIN post ON categorie_post.id_post = post.id     where categorie_post.id_categorie = 2 and post.prix > 11 ;

-- Methode  
SELECT * from TABLE 1 
LEFT JOIN t2 ON t2.id = t1.id Where t1.id = 1  and ( t2 )






   