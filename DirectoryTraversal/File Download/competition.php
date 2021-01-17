<?php
  include_once dirname(__FILE__)."/../header.php";
  mysqli_query($conn, "UPDATE statistics SET visitors=visitors+1 WHERE url='".urldecode($_SERVER["REQUEST_URI"])."'");
?>

<div class="text-center lead">
    <h1 class="mb-4"><?php echo $lang["competition_title"]; ?></h1>

    <p><?php echo $lang["competition_text"]; ?></p>
    <div class="font-weight-bold">
        <div>
            <div class="d-block d-md-inline">
                1. <?php echo $lang["competition_award"]; ?>:
            </div>
            <div class="d-block d-md-inline">
                <?php echo $lang["competition_award1"]; ?>
            </div>
        </div>
        <div>
            <div class="d-block d-md-inline">
                2. <?php echo $lang["competition_award"]; ?>:
            </div>
            <div class="d-block d-md-inline">
                <?php echo $lang["competition_award2"]; ?>
            </div>
        </div>
        <div>
            <div class="d-block d-md-inline">
                3. <?php echo $lang["competition_award"]; ?>:
            </div>
            <div class="d-block d-md-inline">
                <?php echo $lang["competition_award3"]; ?>
            </div>
        </div>
    </div>

    <div class="my-4">
        <canvas id='game' width='310' height='240' class="border border-secondary"></canvas>
        <script src='/plugins/alienInvasion/engine.js'></script>
        <script src='/plugins/alienInvasion/game.js'></script>
    </div>
    
    <div class="modal" tabindex="-1" role="dialog" id="askForName">
        <div class="modal-dialog" role="document">
            <div class="modal-content text-center">
                <div class="modal-body">
                    <form action="/inc/competition_best.php" method="post">
                        <h3 class="modal-title"><?php echo $lang["competition_your_score"]; ?>: <span id="score2"></span></h3>
                        <input type="text" class="form-control my-4 text-center" name="player" placeholder="<?php echo $lang["competition_insert_name"]; ?>">
                        <input type="hidden" name="score" id="score" value="">
                        <input type="hidden" name="hash" id="hash" value="">
                        <button type="submit" class="btn btn-primary btn-block"><?php echo $lang["competition_send_score"]; ?></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</div>

<?php
  include_once dirname(__FILE__)."/../footer.php";
?>
