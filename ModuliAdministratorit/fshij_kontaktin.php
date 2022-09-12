<?php
    include("konfiguro.php");

    $ID_Kontakti = $_GET['ID_Kontakti'];

    $rezultati = mysqli_query($lidhe,"CALL umseFshije_kontakt ('$ID_Kontakti')");

    header("Location:fshij_kontakt.php");
?>

