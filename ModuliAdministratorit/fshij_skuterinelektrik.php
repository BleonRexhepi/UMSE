<?php
    include("konfiguro.php");

    $ID_SkuteriElektrik = $_GET['ID_SkuteriElektrik'];

    $rezultati = mysqli_query($lidhe,"CALL umseFshije_skuterelektrik ('$ID_SkuteriElektrik')");

    header("Location:menaxho_skuteretelektrik.php");
?>

