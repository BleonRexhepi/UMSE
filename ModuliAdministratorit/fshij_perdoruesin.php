<?php
    include("konfiguro.php");

    $ID_p = $_GET['ID_p'];

    $rezultati = mysqli_query($lidhe,"CALL umseFshije_perdoruesit ('$ID_p')");

    header("Location:perdoruesit.php");
?>

