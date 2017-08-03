CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllSpamFeature`()
BEGIN
	SELECT id, value, 
		IF((LOCATE('buy',text)=0 AND LOCATE('join',text)=0 AND LOCATE('free',text)=0 
								AND LOCATE('click',text)=0 AND LOCATE('discount',text)=0), 0, 1) AS hasSpamWords,
		IF((LOCATE('http',text)=0), 0, 1) AS hasHTTP,
		IF((LOCATE('html',text)=0), 0, 1) AS isHTML,
		LENGTH(text) AS textLength
    FROM spam_info;
END