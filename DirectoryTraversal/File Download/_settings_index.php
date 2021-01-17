<?php
    include_once dirname(__FILE__)."/../base.php";
    
    if (!$_SESSION["login"]) { header("Location: /?message=".$lang["message_login_required"]); exit(); }

    $lg_login = $_SESSION["login"];
    $lg_iduser = $_SESSION["iduser"];
  
    if (!$_POST["timezone"]) {
        $_POST["timezone"] = $_SESSION["timezone"];
    }
    
    if (isset($_POST["name"])) {
        $name = $_POST["name"];    
        $email = $_POST["email"];
        $www = $_POST["www"];
        $about = $_POST["about"];
        $timezone = $_SESSION["timezone"] = $_POST["timezone"];
        
        $sql->query("SELECT * FROM users WHERE name = '".mysqli_real_escape_string($conn, $name)."'");
        if (($sql->num_rows()) && ($name != $_SESSION["name"])) {
            header("Location: ?message=".$lang["message_username_unavailable"].(SID?"&".SID:""));
            exit();
        }

        if ((!$name) || (trim($name, " \t\n\r\0\x0B\xA0") == "")) {
            header("Location: ?message=".$lang["message_username_required"].(SID?"&".SID:""));
            exit();
        }   

        $ticket = trim(addslashes($_POST['ticket']), " \t\n\r\0\x0B\xA0");
        $sql2->query("SELECT timestamp, ip FROM tickets WHERE value = '$ticket'");
        $r2 = $sql2->next_row();
        $sql2->query("DELETE FROM tickets WHERE value = '$ticket' LIMIT 1");    
        if (empty($ticket) || empty($r2['timestamp']) || $iper != $r2['ip']) {
            header("Location: ?message=".$lang["message_invalit_token"]);
            exit();
        }

        $sql->query("UPDATE users SET name = '".mysqli_real_escape_string($conn, $name)."', secondmail = '$email', www = '$www', about = '$about', timezone = '".mysqli_real_escape_string($conn, $timezone)."' WHERE id = '$lg_iduser'");
        $sql->query("SELECT * FROM users WHERE id = '$lg_iduser'");
        $r = $sql->next_row();
        $_SESSION["name"] = $r["name"];
        
        header("Location: ?message=".$lang["message_change_saved"]."&type=success".(SID?"&".SID:""));
        exit;
    } else {
        $sql->query("SELECT * FROM users WHERE id = '$lg_iduser'");
        $r = $sql->next_row();
        $email = $r["secondmail"];
        $www = $r["www"];
        $about = $r["about"];
    }

    $portret_name = urldecode($_FILES["portret"]["name"]); 
    $portret = ($_FILES["portret"]["tmp_name"]);
    if ($portret) {
        if (strtolower(substr($_FILES["portret"]["name"], -4, 4)) != ".php") {
            if (!file_exists("../images/portret/user$lg_iduser")) {
                mkdir("../images/portret/user$lg_iduser");
            }
            if (!file_exists("../images/portret/user$lg_iduser/.htaccess")) {
                file_put_contents($full_path."/images/portret/user$lg_iduser/.htaccess", "php_flag engine off");
            }
            if ($_FILES['portret']['type'] == "image/jpeg" || $_FILES['portret']['type'] == "image/png" || $_FILES['portret']['type'] == "image/gif" || $_FILES['portret']['type'] == "image/svg+xml") {
                if (move_uploaded_file($portret, "../images/portret/user".$_SESSION["iduser"]."/".$portret_name)) {
                    chmod ("../images/portret/user".$_SESSION["iduser"]."/$portret_name", 0777);
                    $sql->query("UPDATE users SET image = '$portret_name' WHERE id = '$lg_iduser'");
                    $err_message = $lang["message_upload_success"]." (".$portret_name.")";
                    $message_type = "success";
                    $_SESSION["image"] = $r["image"] = $portret_name;
                } else {
                    $err_message = $lang["message_upload_failed"]." (".$portret_name.")";
                }
            } else {
                $err_message = $lang["message_upload_contenttype"]." (".$_FILES['portret']['type'].")";
            }
        } else {
            $err_message = $lang["message_upload_php"];
        }
    }
       
    include_once dirname(__FILE__)."/../header.php";
?>

<!-- ===== FrameKiller  ===== -->
<script>if (top.location != self.location) top.location = self.location;</script>

<h1 class="text-center mb-4"><?php echo $lang["settings_title"]; ?></h1>

<div class="alert alert-danger mt-2 collapse hide" id="alert-ping" role="alert"><button type="button" class="close align-top" aria-label="Close" data-toggle="collapse" href="#alert-ping"><span aria-hidden="true">&times;</span></button><span id="alert-ping-text"></span></div>
<div class="mb-4" id="settings">
    <form method="post">
        <div class="form-group form-row mb-3">
            <label for="name" class="col-md-3 col-form-label"><?php echo $lang["settings_name"]; ?>:</label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="name" id="name" maxlength="30" value="<?php echo htmlspecialchars($_SESSION["name"]); ?>">
            </div>
        </div>
        <div class="form-group form-row mb-3">
            <label for="email" class="col-md-3 col-form-label"><?php echo $lang["settings_email"]; ?>:</label>
            <div class="col-md-9">
                <input type="email" class="form-control" name="email" id="email" maxlength="70" value="<?php echo htmlspecialchars($email); ?>">
            </div>
        </div>
        <div class="form-group form-row mb-3">
            <label for="www" class="col-md-3 col-form-label">www</label>
            <div class="col-md-9">
                <input type="www" class="form-control" name="www" id="www" maxlength="70" value="<?php echo htmlspecialchars($www); ?>">
            </div>
        </div>
        <div class="form-group form-row mb-3">
            <label for="about" class="col-md-3 col-form-label"><?php echo $lang["settings_about"]; ?>:</label>
            <div class="col-md-9">
                <textarea class="form-control" id="about" name="about" rows="3"><?php echo $about; ?></textarea>
            </div>
        </div>
        <div class="form-group form-row mb-3">
            <label for="timezone" class="col-md-3 col-form-label"><?php echo $lang["settings_timezone"]; ?>:</label>
            <div class=" col col-md-9">
                <select class="custom-select" name="timezone" required>
                    <option class="d-none" disabled selected></option>
                    <?php
                    $sql->query("SELECT * FROM timezones ORDER BY zone_name");
                    while($zone = $sql->next_row()) {
                        echo '<option value="'.$zone["zone_name"].'"'.($zone["zone_name"]==$_POST["timezone"]?" selected":"").'>'.$zone["zone_name"].'</option>';
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="form-group form-row mb-3 justify-content-end">
            <div class="col-md-9">
                <input type="submit" value="<?php echo $lang["save"]; ?>" class="btn btn-primary btn-block">
            </div>
        </div>
        <input type="hidden" name="ticket" maxlength="70" value="<?php echo new_ticket(); ?>">
    </form>
</div>

<div>&nbsp;</div>

<div class="mb-4">
    <div class="form-group form-row mb-3">
        <label for="imageurl" class="col-3 col-form-label d-none d-md-flex"><?php echo $lang["settings_photo"]; ?>:</label>
        <div class="input-group col col-md-9">
            <input type="text" class="form-control" name="imageurl" id="imageurl" placeholder="<?php echo $lang["settings_image_download_placeholder"]; ?>" onfocus="if (!this.value) this.value='http://'">
            <button type="button" class="input-group-append btn btn-primary btn-sm btn-adrbook" data-toggle="modal" data-target="#addressbook" title="<?php echo $lang["settings_image_download"]; ?>" onclick="downloadPortret()">
                <i class="fas fa-download"></i>
            </button>
        </div>
    </div>
    <form method="post" enctype="multipart/form-data">
        <div class="form-group form-row mb-3">
            <div class="col-3 col-form-label d-none d-md-flex portret portret-rounded">
                <?php
                    echo '<div id="portret"'.($r["image"]?'':'class="d-none"').'>';
                        echo '<img src="/getimg.php?src=user'.$lg_iduser.'/'.$r["image"].'">';
                        echo '<span class="fas fa-times text-danger cur-pointer" style="position:relative; top:30px;" onclick="deletePortret()"></span>';
                    echo '</div>';
                ?>
            </div>
            <div class="col col-md-9 px-0 mx-0">
                <div class="custom-file mb-3">
                    <input type="file" class="custom-file-input" name="portret">
                    <label class="custom-file-label mx-1" for="portret" aria-describedby="submit"><?php echo $lang["messages_choose_file"]; ?></label>
                </div>
                <div class="mx-1">
                    <input type="submit" value="<?php echo $lang["save"]; ?>" class="btn btn-primary btn-block">
                </div>
            </div>
        </div>
    </form>
</div>

<?php
  include_once dirname(__FILE__)."/../footer.php";
?>
