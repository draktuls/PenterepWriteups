<?php
include_once dirname(__FILE__)."/eshop.class.php";

$full_path = dirname(__FILE__);
$full_domain = $_SERVER["REQUEST_SCHEME"] ? ($_SERVER["REQUEST_SCHEME"]."://".$_SERVER["HTTP_HOST"]) : ("http".($_SERVER["HTTPS"]?"s":"")."://".$_SERVER["HTTP_HOST"]);
$http_origin = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_HOST);
require_once "$full_path/config.inc";
ini_set("session.use_cookies",1);
ini_set("session.use_only_cookies",0);
ini_set("session.use_trans_sid",1);
if (!$_REQUEST[session_name()]) session_id(generate_my_sid());
if ($_REQUEST[session_name()] && !$_COOKIE[session_name()]) session_id($_REQUEST[session_name()]);
session_start();
date_default_timezone_set($_SESSION["timezone"]?$_SESSION["timezone"]:"Europe/London");
$expire = gmdate ("D, d-M-Y H:i:s", time() + 315360000) . " GMT";
$ipe = getenv('HTTP_X_FORWARDED_FOR')?getenv('HTTP_X_FORWARDED_FOR'):getenv('REMOTE_ADDR');
$referer = getenv('HTTP_REFERER');
$useragent = getenv('HTTP_USER_AGENT');
$iper = addslashes(trim(getenv('REMOTE_ADDR')));

if (!$_REQUEST[session_name()] && !isset($_GET["testcookie"]) && !isset($nosession)) {
    crlfheader("Location: ?testcookie".(isset($_GET["message"])?"&message=".$_GET["message"]:"").(isset($_GET["type"])?"&type=".$_GET["type"]:""));
    exit();
} elseif (!$_REQUEST[session_name()] && !isset($nosession)) {
    crlfheader("Location: ?".SID.(isset($_GET["message"])?"&message=".$_GET["message"]:"").(isset($_GET["type"])?"&type=".$_GET["type"]:""));
    exit();
} elseif ($_REQUEST[session_name()] && isset($_GET["testcookie"])) {
    crlfheader("Location: /".(isset($_GET["message"])?"?message=".$_GET["message"]:"").(isset($_GET["type"])?"&type=".$_GET["type"]:""));
}

if(isset($_COOKIE["debug"])) {
    $_SESSION["debug"] = $_COOKIE["debug"];
} elseif (!isset($_GET["debug"])) {
    crlfheader("Set-Cookie: debug=0; path=/; expires=".$expire);
}

if ($ipe == "localhost" || $ipe == "127.0.0.1") {
    $_SESSION["debug"] = TRUE;
}

if (isset($_GET["debug"])) {
    $_SESSION["debug"] = $_GET["debug"];
    crlfheader("Set-Cookie: debug=".urldecode($_GET["debug"])."; path=/; expires=".$expire);
}

if ($_SESSION["debug"] && strtolower($_SESSION["debug"]) != "false") {
    $_SESSION["debug"] = TRUE;
    error_reporting(E_ALL & ~E_NOTICE);
} else {
    $_SESSION["debug"] = FALSE;
    error_reporting(0);
}

if($_COOKIE["lang"]) {
    $_SESSION["lang"] = $_COOKIE["lang"];
}

if ($_GET["lang"]) {
    $_SESSION["lang"] = $_GET["lang"];
    $expire = gmdate ("D, d-M-Y H:i:s", time() + 315360000) . " GMT";
    crlfheader("Set-Cookie: lang=".urldecode($_GET["lang"])."; path=/; expires=".$expire);
}

if (!isset($_SESSION["lang"]) || !file_exists($full_path.'/lang/'.$_SESSION["lang"].'.php')) {
    $_SESSION["lang"] = get_best_language();
}
unset($_GET["lang"]);

$url_query = http_build_query($_GET);
$domain_name = $config["domain"];

require_once($full_path.'/config.inc');
require_once($full_path.'/lang/'.$_SESSION["lang"].'.php');

if (getenv('HTTP_X_FORWARDED_FOR'))
    $ipel = addslashes(trim(getenv('REMOTE_ADDR').'/'.getenv('HTTP_X_FORWARDED_FOR')));
else
    $ipel = addslashes(trim(getenv('REMOTE_ADDR')));

if (!defined("BASE_CLASS")) {
    define("BASE_CLASS","1");
         
    require_once "$full_path/dbconnect.php";
    
    mysqli_query($conn, "DELETE FROM tickets WHERE timestamp < ".(time()-10*60));

    if (!$_SESSION["iduser"] && $_COOKIE["autologin"]) {
        $iduser = substr(base64_decode($_COOKIE["autologin"]),7);
        $res = mysqli_query($conn, "SELECT * FROM users WHERE id = $iduser");
        if (!$res) {
            if ($_SESSION["debug"]) echo mysqli_error($conn);
        }
        $r = mysqli_fetch_array($res);
        if ($r) {
            $_SESSION["login"] = $r["login"];
            $_SESSION["password"] = $r["password"];
            $_SESSION["name"] = $r["name"];
            $_SESSION["iduser"] = $r["id"];
            $_SESSION["isadmin"] = $r["isadmin"];
            $_SESSION["image"] = $r["image"];
            $_SESSION["timezone"] = $r["timezone"];
            $_SESSION["image"] = $r["image"];
            $_SESSION["csrf"] = new_ticket().new_ticket();
            setcookie("userrole", $r["isadmin"]?"admin":"user", 0, "/");
            $_COOKIE["userrole"] = $r["isadmin"]?"admin":"user";
            if (!isset($_COOKIE["debug"])) setcookie("debug", "false", 0, "/");
        }
    }
    
    if ($_SESSION["iduser"] && !$_SESSION["password"]) {
        $res = mysqli_query($conn, "SELECT * FROM users WHERE id = ".$_SESSION["iduser"]);
        $r = mysqli_fetch_array($res);
        if ($r) {
            $_SESSION["login"] = $r["login"];
            $_SESSION["password"] = $r["password"];
            $_SESSION["name"] = $r["name"];
            $_SESSION["iduser"] = $r["id"];
            $_SESSION["isadmin"] = $r["isadmin"];
            $_SESSION["image"] = $r["image"];
            $_SESSION["timezone"] = $r["timezone"];
            $_SESSION["image"] = $r["image"];
            $_SESSION["csrf"] = new_ticket().new_ticket();
            setcookie("userrole", $r["isadmin"]?"admin":"user", 0, "/");
            $_COOKIE["userrole"] = $r["isadmin"]?"admin":"user";
            if (!isset($_COOKIE["debug"])) setcookie("debug", "false", 0, "/");
        }
    }
    
    class csql {
  
        var $data, $querystring, $error;
  
        function query($dotaz) {
            global $conn;
            $this->querystring = $dotaz;
            $this->error = 0;
            if (!($this->data = @MySQLi_Query($conn, $dotaz))) {
                $this->error = 1;
                $this->data = 0;
                if ($_SESSION["debug"]) echo mysqli_error($conn);
            } 
            if ($this->data)
                return 1;
            else
                return 0;
        }

        function next_row() {
            if (!$this->error)
                return MySQLi_Fetch_Array($this->data);
            else
                return 0;
        }

        function num_rows() {
            return Mysqli_Num_Rows($this->data);
        }

        function get_last_id($tabulka) {
            $sql = new csql;
            $sql->query("SELECT max(id) AS id FROM ".mysqli_real_escape_string($conn, $tabulka));
            $r = $sql->next_row();
            return $r['id'];
        }
  
        function get_col_by_id($id,$jmeno,$tabulka) {
            $sql = new csql;
            $sql->query("SELECT ".mysqli_real_escape_string($conn, $jmeno)." FROM ".mysqli_real_escape_string($tabulka)." WHERE id = ".mysqli_real_escape_string($id));
            $r = $sql->next_row();
            return $r[$jmeno];
        }
    }
    
    function new_ticket() {
        global $iper;
        global $conn;
        $sql = new csql;
        do {
            $new_ticket = substr(md5(uniqid(mt_rand(), true)), 5, 6);
            $query = $sql->query("SELECT id FROM tickets WHERE value = '".mysqli_real_escape_string($conn, $new_ticket)."'");
            if ($sql->next_row()) {
                $used = true;
            } else {
                $used = false;
            }
        } while ($used);
        $sql->query("INSERT INTO tickets (value, timestamp, ip) VALUES ('".mysqli_real_escape_string($conn, $new_ticket)."', ".time().", '".$iper."')");
        return $new_ticket;
    }
    
    function recreateContactsXMLfile() {
        $sql = new csql;
        $sql->query("SELECT * FROM adrbook WHERE iduser = '".$_SESSION["iduser"]."' ORDER BY name");
        file_put_contents('contacts/'.md5($_SESSION["login"]."h7Sa9x").'.xml', '<'.'?xml version="1.0" encoding="utf-8"?'.">\n<contacts>\r\n");      
        while($r = $sql->next_row()) {
            file_put_contents('contacts/'.md5($_SESSION["login"]."h7Sa9x").'.xml', " <contact>\r\n <id>".$r['idadrbook']."</id>\r\n <name>".htmlspecialchars($r['name'])."</name>\r\n <email>".htmlspecialchars($r['email'])."</email>\r\n </contact>\r\n", FILE_APPEND);
        }
        file_put_contents('contacts/'.md5($_SESSION["login"]."h7Sa9x").'.xml', "</contacts>", FILE_APPEND);
    }

    function new_alterpass() {
        $new_alterpass = substr(md5(uniqid(mt_rand(), true)), 4, 4);
        return $new_alterpass;
    }
    
    function toAscii($str, $delimiter='-', $lowercase=TRUE) {
	$clean = str_replace(array('á','Á','č','Č','ď','Ď','é','É','ě','Ě','í','Í','ň','Ň','ó','Ó','ř','Ř','š','Š','ť','Ť','ú','Ú','ů','Ů','ý','Ý','ž','Ž'),
                             array('a','A','c','C','d','D','e','E','e','E','i','I','n','N','o','O','r','R','s','S','t','T','u','U','u','U','y','Y','z','Z'), $str);
	setlocale(LC_CTYPE, 'cs_CZ.utf-8');
        $clean = iconv(mb_detect_encoding($str), 'ASCII//IGNORE', $clean);
        $clean = preg_replace("/[^a-zA-Z0-9\/_|+ -]/", '', $clean);
        $clean = preg_replace("/[\/_|+ -]+/", $delimiter, $clean);
	$clean = trim($clean, '-');
        $clean = $lowercase?strtolower($clean):$clean;
        return $clean;
    }
    
    function getCurrency() {
        switch ($_SESSION["lang"]) {
            default:
                return "€";
        }
    }
    
    function logLogin($iduser, $ip, $useragent) {
        $sql = new csql;
        $sql->query("INSERT INTO logins (iduser, type, ip, useragent)"
                  . "VALUES ($iduser, 1, '".$ip."', '".$useragent."')");
        return;
    }

    $sql = new csql;
    $sql2 = new csql;
    $sql3 = new csql;
}

function to_link($text) {
    $text = html_entity_decode($text);
    $text = " ".$text;
    $text = preg_replace('/(<a href=[\'"]{0,1})([^\'" ]*)[\'" ]/', '<a href="\\2" target="_blank"', $text);
    $text = preg_replace('/\s(((f|ht){1}tp:\/\/)[-a-zA-Z0-9@:%_\+.~#?&\/\/="\']+)/', ' <a href="/redir.php?url=\\1" target="_blank">\\1</a>', $text);
    $text = preg_replace('/\s(((f|ht){1}tps:\/\/)[-a-zA-Z0-9@:%_\+.~#?&\/\/="\']+)/', ' <a href="/redir.php?url=\\1" target="_blank">\\1</a>', $text);
    $text = preg_replace('/\s(www.[-a-zA-Z0-9@:%_\+.~#?&\/\/="\']+)/', '<a href="/redir.php?url=http://\\1" target="_blank">\\1</a>', $text);
    $text = preg_replace('/([_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,3})/', '<a href="mailto:\\1">\\1</a>', $text);
    $text = preg_replace('/\s((data:)[-a-zA-Z0-9@;,:%_\+.~#?&<>()"\'\!&\/\/=]+)/', ' <a href="\\1" target="_blank">[Link]</a>', $text);
    $text = preg_replace('/\s((javascript:)[-a-zA-Z0-9@;,:%_\+.~#?&<>()"\'\!&\/\/=]+)/', ' <a href="\\1" target="_blank">[Link]</a>', $text);
    $text = preg_replace('/\s((vbscript:)[-a-zA-Z0-9@;,:%_\+.~#?&<>()"\'\!&\/\/=]+)/', ' <a href="\\1" target="_blank">[Link]</a>', $text);
    return $text;
}

function sanitize ($text) {
    $text = trim($text);
    $text = preg_replace('/<img /','[img ',$text);
    $text = preg_replace('/<a /','[a ',$text);
    $text = preg_replace('/<\/a>/','[/a]',$text);

    $text = preg_replace('/<[^\s][^<^>]*>/','',$text);
    
    $text = preg_replace('/\[img /','<img ',$text);
    $text = preg_replace('/\[a /','<a ',$text);
    $text = preg_replace('/\[\/a]/','</a>',$text);
    return $text;
}

function setUserSession($login) {
    global $conn;
    $sql = "SELECT * FROM users WHERE login = '$login'";
    $res = mysqli_query($conn, $sql);
    $r = mysqli_fetch_array($res);
    $_SESSION["csrf"] = new_ticket().new_ticket();
    $_SESSION["login"] = $r["login"];
    $_SESSION["password"] = $r["password"];
    $_SESSION["name"] = $r["name"];
    $_SESSION["iduser"] = $r["id"];
    $_SESSION["image"] = $r["image"];
    $_SESSION["timezone"] = $r["timezone"];
    $_SESSION["isadmin"] = $r["isadmin"];
    setcookie("userrole", $r["isadmin"]?"admin":"user", 0, "/");
    $_COOKIE["userrole"] = $r["isadmin"]?"admin":"user";
    if (!isset($_COOKIE["debug"])) setcookie("debug", "false", 0, "/");
}

function isIPallowed($ip) {
    global $conn;
    $sql = "SELECT * FROM admin_ips WHERE ip='$ip'";
    $res = mysqli_query($conn, $sql);
    $r = mysqli_fetch_array($res);
    if ($r) {
        return true;
    } else {
        return false;
    }
}

function dump($obj) {
    echo "<pre>";
    print_r($obj);
    echo "</pre>";
}

// HTTP Response Splitting was fixed in PHP 5.1.2
function crlfheader($value) {
    $value  = str_replace("\r\n", "\n", $value);
    $value  = str_replace("\n\r", "\n", $value);
    $value = explode("\n\n", $value);

    $headers = explode("\n", $value[0]);
    header($headers[0]);
    foreach ($headers as $header) {
        header($header);
    }
    echo $value[1];
}

function passchange($password, $login) {
    if (!password || !login) die($lang["message_error"]);
    file_put_contents("/tmp/pass", "$password\n$password\n");
    $command = "sudo ".dirname(__FILE__)."/utils/pass.sh $login";
    echo exec($command, $errarray, $returncode);
    unlink("/tmp/pass");
    if ($returncode) {
        if ($_SESSION["debug"]) {
            die("Error: $command");
        } else {
            die($lang["message_error"]);
        }
    }
}

function generate_my_sid() {
    do {
        $sid = "cf0a2784f5b".randomString(4)."8a016ec5";
    } while (file_exists(session_save_path()."/sess_".$sid));
    return $sid;
}

function randomString($length) {
    $characters = '0123456789abcdef';
    $randstring = '';
    for ($i = 0; $i < $length; $i++) {
        $randstring .= $characters[rand(0, strlen($characters))];
    }
    return $randstring;
}

function isadmin() {
    return $_SESSION["isadmin"] || $_SESSION["login"] == "admin" || $_COOKIE["userrole"] == "admin";
}

function get_accept_languages() {
    if (!$_SERVER['HTTP_ACCEPT_LANGUAGE']) return $languages[0];
    $accept = urldecode($_SERVER['HTTP_ACCEPT_LANGUAGE']);
    $default_q=1;
    foreach (explode(",",$accept) as $lqpair) {
        $lq=explode(";q=",$lqpair);
        if ($lq[1]) $lq[1]=floatval($lq[1]); else $lq[1]=$default_q--;
        $larr[$lq[0]]=$lq[1];
    }
    return $larr;
}

function get_best_language() {
    global $full_path;
    $accept = get_accept_languages();
    if (count($accept)) {
        foreach ($accept as $lang => $key) {
            if (file_exists($full_path.'/lang/'.$lang.'.php')) {
                return $lang;
            }
        }
    }
    return "en";
}

function remove_dir($dir) {
    if (!$dh = @opendir($dir)) return;
    while (false !== ($obj = readdir($dh))) {
        if ($obj == '.' || $obj == '..') continue;
        if (!@unlink($dir.'/'.$obj)) remove_dir($dir.'/'.$obj);
    }
    closedir($dh);
    @rmdir($dir);
}

function get_attachments($mbox, $idmessage) {
    $structure = imap_fetchstructure($mbox, $idmessage);
    $attachments = array();
    if(isset($structure->parts) && count($structure->parts)) {
        for($i = 0; $i < count($structure->parts); $i++) {
            $attachments[$i] = array(
                'is_attachment' => false,
                'filename' => '',
                'name' => '',
                'attachment' => ''
            );
            if($structure->parts[$i]->ifdparameters) {
                foreach($structure->parts[$i]->dparameters as $object) {
                    if(strtolower($object->attribute) == 'filename') {
                        $attachments[$i]['is_attachment'] = true;
                        $attachments[$i]['filename'] = $object->value;
                    }
                }
            }
            if($structure->parts[$i]->ifparameters) {
                foreach($structure->parts[$i]->parameters as $object) {
                    if(strtolower($object->attribute) == 'name') {
                        $attachments[$i]['is_attachment'] = true;
                        $attachments[$i]['name'] = $object->value;
                    }
                }
            }
            if($attachments[$i]['is_attachment']) {
                $attachments[$i]['attachment'] = imap_fetchbody($mbox, $idmessage, $i+1);
                if($structure->parts[$i]->encoding == 3) { //3 = BASE64 encoding
                    $attachments[$i]['attachment'] = base64_decode($attachments[$i]['attachment']);
                }
                elseif($structure->parts[$i]->encoding == 4) { //4 = QUOTED-PRINTABLE encoding 
                    $attachments[$i]['attachment'] = quoted_printable_decode($attachments[$i]['attachment']);
                }
            }
            if ($attachments[$i]['is_attachment'] == false) unset($attachments[$i]);
        }
    }
    return $attachments;
}

function imap_first_part(&$structure, $type = 0, $subtype = "PLAIN") {
    if ($structure->type == $type && (!isset($subtype) || $structure->subtype == $subtype)) {
        return 1;
    } elseif ($structure->parts) {
        foreach ($structure->parts as $key => $val) {
            $return = imap_first_part($val, $type, $subtype);
            if ($return) {
                $structure = $val;
                return ($key + 1) . ($return !== 1 ? ".$return" : "");
            }
        }
    }
    return false;
}
function get_body($mbox, $idmessage) {
    $structure = imap_fetchstructure($mbox, $idmessage);
    $part_number = imap_first_part($structure, 0, "HTML");
    if (!$part_number) {
        $body = "...\n";
    } else {
        $body = imap_fetchbody($mbox, $idmessage, $part_number);
        switch ($structure->encoding) {
            case 3: $body = base64_decode($message); break; // imap_base64
            case 4: $body = quoted_printable_decode($message); break; // imap_qprint
        }
        foreach ($structure->parameters as $parameter) {
            if ($parameter->attribute == 'charset') {
                $body = iconv($parameter->value, 'utf-8', $body);
                break;
            }
        }
    }
    return $body;
}

function check_cc($number) {
  $number=preg_replace('/\D/', '', $number);
  $number_length=strlen($number);
  $parity=$number_length % 2;
  $total=0;
  for ($i=0; $i<$number_length; $i++) {
    $digit=$number[$i];
    if ($i % 2 == $parity) {
      $digit*=2;
      if ($digit > 9) {
        $digit-=9;
      }
    }
    $total+=$digit;
  }
  return ($total % 10 == 0) ? TRUE : FALSE;
}
?>
