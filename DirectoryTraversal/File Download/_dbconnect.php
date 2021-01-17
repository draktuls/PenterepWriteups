<?php
    require_once dirname(__FILE__)."/config.inc";
    $conn = mysqli_connect($config["mysqlServer"], $config["mysqlUser"], $config["mysqlPassword"], false, 128);
    if (!$conn) {
        die($lang["error_db_connect"]);
    }

    if (@mysqli_select_db($conn, $config["mysqlName"]) == false) {
        unset($mysqlName);
        die($lang["error_db_select"]);
    }

    @mysqli_query($conn, "SET NAMES 'UTF8'");
?>