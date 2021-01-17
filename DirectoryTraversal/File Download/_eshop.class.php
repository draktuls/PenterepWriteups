<?php
class eshopBasket {
    
    public $goods = array();
    public $tmpPath;
    public $archivePath;
    public $filename;
    public $email;
    public $idhdok;
    
    function __construct() {
        $this->tmpPath = "/tmp/";
        $this->archivePath = "/archive/";
    }
    
    function get_items() {
        return $this->goods;
    }
    
    function add_item($id, $price, $amount) {
        $item = array(
            id => intval($id),
            price => $price,
            amount => $amount);
        $this->goods[] = $item;
        setcookie("eshopbasket", serialize($this->goods), time()+315360000, "/");
        return $this->goods;
    }
    
    function del_item($id) {
        unset($this->goods[$id]);
        setcookie("eshopbasket", serialize($this->goods), time()+315360000, "/");
        return $this->goods;
    }
    
    function del_all() {
        unset($this->goods);
        if (isset($_COOKIE["eshopbasket"])) setcookie("eshopbasket", '', time()-86400, "/");
        return $this->goods;
    }
    
    function save_order($conn) {
        $res = mysqli_query($conn, "INSERT INTO eshop_hdok (status,name,street,city,country,email,transport,payment,cardno,carddate,cardcode)"
                          . "VALUES (".$_SESSION["eshop_payment"].",'".$_SESSION["eshop_name"]."','".$_SESSION["eshop_street"]."','".$_SESSION["eshop_city"]."',".$_SESSION["eshop_country"].",'".$_SESSION["eshop_email"]."',".$_SESSION["eshop_delivery"].",".$_SESSION["eshop_payment"].",'".$_SESSION["cardno"]."','".$_SESSION["carddate"]."','".$_SESSION["cardcode"]."')");
        if (!$res) {
            if ($_SESSION["debug"]) die(mysqli_error($conn));
        }
        $idhdok = mysqli_insert_id($conn);
        if ($_SESSION["eshop_payment"] == 2) {
            mysqli_query($conn, "UPDATE eshop_hdok SET paymentdate=NOW() WHERE idhdok=$idhdok");
        }
        $items = $this->goods;
        if (!empty($items)) {
            foreach ($items as $item) {
                $res = mysqli_query($conn, "INSERT INTO eshop_sdok (idhdok,idgoods,amount, price)"
                          . "VALUES ($idhdok,".$item["id"].",".$item["amount"].",".$item["price"].")");
                if (!$res) {
                    if ($_SESSION["debug"]) die(mysqli_error($conn));
                }
            }
        }
        $this->idhdok = $idhdok;
        $this->filename = "invoice".$idhdok.".pdf";
        $this->email = $_SESSION["eshop_email"];
        return $idhdok;
    }
    
    function create_invoice($idhdok, $lang) {
        require dirname(__FILE__)."/plugins/mpdf/mpdf.php";
        $url = "http://".$_SERVER["HTTP_HOST"]."/inc/eshop-invoice.php?invoice_no=$idhdok&lang=".$lang;
        $html = file_get_contents($url);
        $mpdf = new mPDF();
        $mpdf->WriteHTML($html);
        $mpdf->Output($_SERVER['DOCUMENT_ROOT'].$this->tmpPath."/".$this->filename);
        $this->idhdok = $idhdok;
        return $this->filename;
        
    }
    
    function __destruct() {
        if ($this->filename && file_exists($_SERVER['DOCUMENT_ROOT'].$this->tmpPath.$this->filename)) {
            require_once(dirname(__FILE__).'/plugins/phpmailer/class.phpmailer.php');
            require_once(dirname(__FILE__).'/plugins/phpmailer/class.smtp.php');
            $mail = new PHPMailer;
            $mail->IsHTML(true);
            $mail->CharSet = 'UTF-8';
            $mail->setFrom('eshop@penterepmail.loc', 'PenterepMail Eshop');
            $mail->addAddress($this->email);
            $mail->Subject = 'Your invoice';
            $mail->Body = "Hello,\nthank you for your order. Your invoice is attached.\nYou can see status of your order on http://www.penterepmail.loc/e-shop/order/".($this->idhdok + 10000)."\n\nYour PenterepMail team";
            $mail->addStringAttachment(file_get_contents($_SERVER['DOCUMENT_ROOT'].$this->tmpPath.$this->filename), $this->filename);
            $mail->send();
            copy($_SERVER['DOCUMENT_ROOT'].$this->tmpPath.$this->filename, $_SERVER['DOCUMENT_ROOT'].$this->archivePath.$this->filename);
            unlink($_SERVER['DOCUMENT_ROOT'].$this->tmpPath.$this->filename);
        }
    }
    
}
?>