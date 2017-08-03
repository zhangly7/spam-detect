CREATE DEFINER=`root`@`localhost` PROCEDURE `spamDecisionTree`(
	IN isHTML INT,
    IN hasHTTP INT,
    IN hasSpamWords INT,
    IN textLength INT,
    OUT isSpam INT)
BEGIN
	IF hasSpamWords <=0 THEN
		IF textLength <= 1166 THEN SET isSpam = FALSE;
        ELSE
			IF isHTML <= 0 THEN SET isSpam = FALSE;
            ELSE
				IF hasHTTP <= 0 THEN SET isSpam = TRUE;
                ELSE
					IF textLength <= 7620 THEN SET isSpam = FALSE;
                    ELSE
						IF textLength >9349 THEN SET isSpam = FALSE;
                        ELSE
							IF textLength >8041 THEN SET isSpam = TRUE;
                            ELSE
								IF textLength <= 7931 THEN SET isSpam = TRUE;
                                ELSE SET isSpam = FALSE;
                                END IF;
                                END IF;
                                END IF;
                                END IF;
                                END IF;
                                END IF;
                                END IF;
                                
	ELSE
    IF isHTML <= 0 THEN
		IF hasHTTP <= 0 THEN
			IF textLength <= 2388 THEN SET isSpam = FALSE;
			else
				IF textLength > 29082 THEN SET isSpam = FALSE;
				ELSE
					IF textLength > 13002 THEN SET isSpam = TRUE;
					ELSE
						IF textLength > 6558 THEN SET isSpam = FALSE;
						ELSE SET isSpam =TRUE;
						END IF;
						END IF;
						END IF;
						END IF;
		ELSE
			IF textLength > 3524 THEN SET isSpam = false;
			else
				IF textLength > 811 THEN 
					IF textLength > 2401 THEN SET isSpam = TRUE;
					ELSE SET isSpam = FALSE;
					END IF;
				ELSE
					IF textLength > 285 THEN SET isSpam = TRUE;
					ELSE SET isSpam = FALSE;
					END IF;
				END IF;
			 END IF;
		END IF;
    ELSE
		IF textLength <=3425 THEN SET isSpam = TRUE;
		ELSE
			IF textLength <=4133 THEN SET isSpam = TRUE;
            ELSE
				IF textLength > 16129 THEN SET isSpam = TRUE;
                ELSE
					IF textLength > 11070 THEN SET isSpam = FALSE;
                    ELSE
						IF textLength > 4517 THEN SET isSpam = TRUE;
                        else
							IF textLength > 4435 THEN SET isSpam = FALSE;
                            else
								IF textLength > 4310 THEN SET isSpam = TRUE;
                                else SET isSpam = FALSE;
                                END IF;
							END IF;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	END IF;
END IF;

    
END