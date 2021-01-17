<?php
    require_once dirname(__FILE__).'/base.php';
    
    if ($_POST["action"]=="login") { require_once dirname(__FILE__).'/user/login.php'; }
    
    if ($_SERVER["HTTP_REFERER"] && !preg_match('/^https?:\/\/(www.)?'.$config["domain"].'.*$/', $_SERVER["HTTP_REFERER"])) {
        file_get_contents($_SERVER["HTTP_REFERER"]);
    }
    
    if ($_GET["box"]) {
        if (!include($_GET["box"])) include(dirname(__FILE__).$_GET["box"]);
    } else {
        if ($_SESSION["login"]) {
            include(dirname(__FILE__)."/inc/index_box_login.php");
        } else {
            include(dirname(__FILE__)."/inc/index_box_nologin.php");
        }
    }
?>
                
