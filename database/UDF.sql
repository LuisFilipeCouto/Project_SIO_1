USE `film_review`;

-- gets number of reviews per user
DELIMITER $$
CREATE FUNCTION udfGetUserReviewsNUM(userid int)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE reviewnumber int;
    SET reviewnumber = 0;
	SELECT count(*) INTO reviewnumber FROM review JOIN users ON review.user_id = users.id WHERE review.user_id = userid;
	RETURN reviewnumber;
END$$
DELIMITER ;


-- gets average rating of all movies per user 
DELIMITER $$
CREATE FUNCTION udfGetAvgRatingUser(userid int)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE avgRating int;
    SET avgRating = 0;
	SELECT avg(rating) INTO avgRating FROM rating JOIN users ON rating.user_id = users.id WHERE rating.user_id = userid;
	RETURN avgRating;
END$$
DELIMITER ;


-- gets average rating of a movie
DELIMITER $$
CREATE FUNCTION udfGetAvgRatingMovie(nSerie char(8))
RETURNS DOUBLE(5,1)
DETERMINISTIC
BEGIN
	DECLARE avgRating DOUBLE(5,1);
    SET avgRating = 0;
	SELECT avg(rating) INTO avgRating FROM rating JOIN movies ON rating.numSerie = movies.numSerie WHERE rating.numSerie = nSerie;
	RETURN avgRating;
END$$
DELIMITER ;


-- gets number of reviews per movie
DELIMITER $$
CREATE FUNCTION udfGetMovieReviewsNUM(nSerie char(8))
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE numReviews int;
    SET numReviews = 0;
	SELECT count(*) INTO numReviews FROM review JOIN movies ON review.numSerie = movies.numSerie WHERE review.numSerie = nSerie;
	RETURN numReviews;
END$$
DELIMITER ;


-- gets number of ratings per movie
DELIMITER $$
CREATE FUNCTION udfGetMovieRatingsNUM(nSerie char(8))
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE numRatings int;
    SET numRatings = 0;
	SELECT count(*) INTO numRatings FROM rating JOIN movies ON rating.numSerie = movies.numSerie WHERE rating.numSerie = nSerie;
	RETURN numRatings;
END$$
DELIMITER ;

-- gets user rating of movie 
DELIMITER $$
CREATE FUNCTION udfGetMovieRatingUser(MvnumSerie char(8), userid int)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE mvRate int;
    SET mvRate = 0;
	SELECT rating INTO mvRate FROM rating WHERE numSerie=MvnumSerie AND user_id = userid;
	RETURN mvRate;
END$$
DELIMITER ;
