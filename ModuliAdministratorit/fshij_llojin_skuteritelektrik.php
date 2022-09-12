<?php

    include("konfiguro.php");

    $ID_LlojiSkuteritElektrik = $_GET['ID_LlojiSkuteritElektrik'];

    $rezultati = mysqli_query($lidhe,"CALL umseFshije_llojiskutereve_elektrik ('$ID_LlojiSkuteritElektrik')");

    header("Location:menaxho_llojin_skuteritelektrik.php");
?>

