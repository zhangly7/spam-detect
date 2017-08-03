CREATE DEFINER=`root`@`localhost` PROCEDURE `extractFeatures`(
	IN inputID INT,
    OUT textLength INT,
    OUT isHTML iNT,
    OUT isHTTP INT,
    OUT hasSpamWords INT
)
BEGIN
	DECLARE mc text;
	SELECT mailCode INTO mc FROM userInputSpam WHERE id = inputID;
	SELECT length(mc) INTO textLength FROM userInputSpam WHERE id = inputID;
    SET isHTML = if(locate('html', mc)=0,0,1);
    SET isHTTP = if(locate('html', mc)=0,0,1);
    SET hasSpamWords = if((locate('buy', mc) = 0 AND
							locate('free', mc) = 0 AND
                            locate('join', mc) = 0 AND
                            locate('start', mc) = 0 AND
                            locate('click', mc) = 0 AND
                            locate('discount', mc) = 0), 0, 1);
END