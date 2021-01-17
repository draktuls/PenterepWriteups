<?php
require_once dirname(__FILE__).'/../base.php';

$sql = "INSERT INTO logins (iduser, type, ip, useragent) VALUES (".$_SESSION["iduser"].", 2, '".$ipe."', '".$useragent."')";
mysqli_query($conn, $sql);

if (isset($_COOKIE["userrole"])) setcookie("userrole", '', time()-86400, "/");
if (isset($_COOKIE["autologin"])) setcookie("autologin", '', time()-86400, "/");
if (isset($_COOKIE[session_name()])) setcookie(session_name(), generate_my_sid(),0,"/");

$parameters = explode("&", $_SERVER["QUERY_STRING"]);
foreach ($parameters as $parameter) {
    $parts = explode("=", $parameter);
    if ($parts[0] == "return") {
        $return = $parts[1];
        break;
    }
}

$return = $return?$return:"/";
if (substr($return,0,1) != "/") $_GET["return"] = "/";

crlfheader("Location: ".$_GET["return"]."?message=".$lang["message_logout_success"]."&type=success");

if (!$res) {
    echo mysqli_error($conn);
}
?>