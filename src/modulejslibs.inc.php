<?php
if(isset($additionalJs)) {
    foreach ($additionalJs as $js) {
        ?>
        <script type="text/javascript" src="<?php echo  $js ?>"></script>
    <?php
    }
}
?>
<script type="text/javascript" src="<?php echo BASE_URL.'/'.$group.'/'.$name.'/'?>lib.js?v=<?php echo $jsVersion?>"></script>