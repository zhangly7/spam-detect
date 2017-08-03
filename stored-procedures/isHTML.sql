CREATE DEFINER=`root`@`localhost` PROCEDURE `isHTML`()
BEGIN
	SELECT id, value, IF(LOCATE('html',text)=0, 0, 1) AS isHTML
    FROM spam_info;
END