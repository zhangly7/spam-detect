CREATE DEFINER=`root`@`localhost` PROCEDURE `textLengthCompute`()
BEGIN
	SELECT id, value, LENGTH(text) AS textLength
    FROM spam_info;
END