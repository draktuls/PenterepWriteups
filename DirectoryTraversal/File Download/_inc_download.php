<?php
require dirname(__FILE__)."/../base.php";

$path = dirname(__FILE__) . '/../files/';
if (!isset($_GET['file']) || empty($_GET['file'])) {
    header("Location: /?message=".$lang["message_file_not_found"]);
    exit();
}

$file=$_GET['file'];
$contenttype='application/octet-stream';

$name = $file;
$file = $path . $file;

if (file_exists($file)) {
  header("Pragma: ");
  header("Cache-Control: ");
  header("Expires: Mon, 26 Jul 1998 07:00:00 GMT");
  header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
  header("Cache-Control: no-store, no-cache, must-revalidate");
  header("Cache-Control: post-check=0, pre-check=0", false);
  header("Content-Type: $contenttype\n");
  header("Content-Disposition: attachment; filename=".$name);
  header("Content-transfer-encoding: binary\n");
  readfile($file);
  exit;
} else {
  header("Location: /?message=".$lang["message_file_not_found"]);
  exit();
}

?>
