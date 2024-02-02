USE `film_review`;

-- gets details about movie reviews
DELIMITER $$
CREATE PROCEDURE spGetMovieReviewsDetails(nSerie char(8))
BEGIN
	SELECT username, review, postDate FROM users JOIN review JOIN movies ON users.id = review.user_id AND movies.numSerie = review.numSerie WHERE movies.numSerie = nSerie;
END $$
DELIMITER ;