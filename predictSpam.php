<!DOCTYPE html>
<html>
<head>
    <title>Enter Content</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<?php
    include "dbconn.php";

	// Get input content and escape special characters
    $input = $_POST['toBeDetected'];
    $input = mysqli_real_escape_string($conn,$input);

	// Insert in to tabel and get generated ID
    $sqlInsert = "INSERT INTO userInputSpam (mailCode)
                   VALUES ('$input');";

    if (mysqli_query($conn,$sqlInsert)){
     $last_id = mysqli_insert_id($conn);
     echo "<div class='result'>Insert Complete. Input ID is: " . $last_id;
    }  else {
     echo "Error: " . $sqlInsert. "<br>" . mysqli_error($conn);
    }

    echo "</br>";

	// Use Stored Procedures
    $sqlCallSP1="CALL extractFeatures($last_id,@textL,@isHTML,@isHTTP,@hasSpamW)";
    $result1=$conn->query($sqlCallSP1);


    $sqlCallSP2="CALL spamDecisionTree(@isHTML,@isHTTP,@hasSpamW,@textL,@isSpam)";
    $result2=$conn->query($sqlCallSP2);


    $sqlFinal = "SELECT @isSpam AS spam";
    $resultFinal=$conn->query($sqlFinal);
?>

<?php
    if ($resultFinal->num_rows>0){
        while ($row = $resultFinal->fetch_assoc()){
            echo "</br>";
            $updateQuery="UPDATE userInputSpam SET prediction = ".$row['spam']." WHERE id = $last_id";
            if ($row['spam']==0){
                $conn->query($updateQuery);
                echo "Mail " .$last_id." is "."<strong>NOT SPAM</strong>";
            }
            else {
                $conn->query($updateQuery);
                echo "Mail " .$last_id." is "."<strong>SPAM</strong></div>";
            }
        }
    }
    mysqli_close($conn);
?>


</body>
</html>