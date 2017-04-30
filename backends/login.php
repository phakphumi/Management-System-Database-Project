<?php

    session_start();

    if(isset($_POST["id"]) && isset($_POST["user_type"])) {

        $_SESSION["id"] = $_POST["id"];
        $_SESSION["user_type"] = $_POST["user_type"];
        
    }

?>
