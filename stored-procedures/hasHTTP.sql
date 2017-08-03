CREATE DEFINER=`root`@`localhost` PROCEDURE `hasHTTP`()
BEGIN
	SELECT id, value, IF(LOCATE('http',text)=0, 0, 1) AS hasHTTP
    FROM spam_info; 
END