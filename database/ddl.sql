DROP DATABASE IF EXISTS `film_review`;
CREATE DATABASE `film_review`; 
USE `film_review`;

CREATE TABLE IF NOT EXISTS`film_review`.`users`(
	`id`			int 		 NOT NULL auto_increment,
    `username` 		varchar(128) NOT NULL,
    `email` 		varchar(128) NOT NULL UNIQUE,
    `isAdmin`		tinyint		 NOT NULL DEFAULT 0,
    `passwordHash` 	varchar(256) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `film_review`.`movies`(
	`numSerie` 		char(8) 	 NOT NULL,
    `title`  		varchar(255) NOT NULL,
    `genre` 		varchar(128) NOT NULL,
    `releaseDate`	date 		 NOT NULL DEFAULT(current_date()),
    `producer`		varchar(128) NOT NULL,
	PRIMARY KEY(`numSerie`),
    CHECK(length(`numSerie`) = 8) 
);

CREATE TABLE IF NOT EXISTS `film_review`.`rating`(
	`user_id`		int			 NOT NULL,
    `numSerie`		char(8) 	 NOT NULL,
    `rating`		int 		 NOT NULL,
    PRIMARY KEY(`user_id`,`numSerie`)
);

CREATE TABLE IF NOT EXISTS `film_review`.`review`(
	`review_id`		int			 NOT NULL auto_increment,
	`user_id`		int			 NOT NULL,
    `numSerie`		char(8) 	 NOT NULL,
    `review`		varchar(256) NOT NULL,
    `postDate`		datetime	 NOT NULL DEFAULT NOW(),
    PRIMARY KEY(`review_id`,`user_id`,`numSerie`)
);

ALTER TABLE `film_review`.`rating`
ADD CONSTRAINT FK_rating_userID
FOREIGN KEY (user_id) REFERENCES `film_review`.`users`(id) ON DELETE CASCADE;

ALTER TABLE `film_review`.`rating`
ADD CONSTRAINT FK_rating_numSerie
FOREIGN KEY (numSerie) REFERENCES `film_review`.`movies`(numSerie) ON DELETE CASCADE;

ALTER TABLE `film_review`.`review`
ADD CONSTRAINT FK_review_userID
FOREIGN KEY (user_id) REFERENCES `film_review`.`users`(id) ON DELETE CASCADE;

ALTER TABLE `film_review`.`review`
ADD CONSTRAINT FK_review_numSerie
FOREIGN KEY (numSerie) REFERENCES `film_review`.`movies`(numSerie) ON DELETE CASCADE;