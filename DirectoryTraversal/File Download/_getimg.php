<?php
    $src = $_GET["src"];
    $path = dirname(__FILE__)."/images/portret/";
    echo file_get_contents($path.$src);
?>