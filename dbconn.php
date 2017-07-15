<?php
    // create connection
    $conn = mysqli_connect("localhost", "root", "335506mysql", "623_spam");

    //check connection
    if (!$conn) {
        die("connection failed: " . mysqli_connect_error());
    }
?>