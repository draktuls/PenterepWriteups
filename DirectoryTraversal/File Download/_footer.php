</div>
</div>
<!-- MAIN section end -->

</div>

<!-- FOOTER section start -->
<div class="row py-2 show collapse mobile-collapse" id="footer">
    <div class="col-sm-6 col-lg-4 col-xl-3 text-center text-xl-left">
        <a href="/redir.php?url=<?php echo $config["external_url"]; ?>" target="_blank">&copy; <?php echo date("Y") ." ". $config["website"]; ?></a>
    </div>
    <div class="col-sm-6 col-lg-4 col-xl text-center text-xl-left">
        <a href="/inc/mobile.php"><?php echo $lang["footer_mobileapp"]; ?></a>
    </div>
    <div class="col-sm-6 col-lg-4 col-xl text-center">
        <a href="/inc/help.php"><?php echo $lang["footer_help"]; ?></a>
    </div>
    <div class="col-sm-6 col-lg-4 col-xl text-center text-xl-right">
        <a href="/inc/competition.php"><?php echo $lang["footer_competition"]; ?></a>
    </div>
    <div class="col-sm-6 col-lg-4 col-xl text-center text-xl-right">
        <a href="/e-shop"><?php echo $lang["footer_eshop"]; ?></a>
    </div>
    <div class="col-sm-6 col-lg-4 col-xl text-center text-xl-right">
        <a href="/inc/contactus.php"><?php echo $lang["footer_contact"]; ?></a>
        <a href="<?php echo $config["facebook"]; ?>" target="_blank" title="<?php echo $lang["footer_fb"]; ?>"><i class="fab fa-facebook-square ml-2"></i></a>
    </div>
</div>
<!-- FOOTER section end -->

<script src="<?php echo $full_domain; ?>/js/jquery-3.4.1.min.js"></script>
<script src="<?php echo $full_domain; ?>/js/popper.min.js"></script>
<script src="<?php echo $full_domain; ?>/js/bootstrap.min.js"></script>
<script src="<?php echo $full_domain; ?>/js/uploader/jquery.multifile.js"></script>
<script src="<?php echo $full_domain; ?>/js/base.js<?php echo SID?"?".SID:""; ?>"></script>
<?php if ($_SESSION["iduser"]) echo '<script src="'.$full_domain.'/js/websockets.js"></script>'; ?>
</body>
</html>