CREATE DEFINER=`root`@`localhost` PROCEDURE `hasSpamWords`()
BEGIN
	SELECT id, value, IF((LOCATE('buy',text)=0 AND LOCATE('join',text)=0 AND LOCATE('free',text)=0 
							AND LOCATE('click',text)=0 AND LOCATE('discount',text)=0), 0, 1) 
	AS hasSpamWords
    FROM spam_info;
END