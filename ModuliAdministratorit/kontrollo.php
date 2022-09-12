<?php
    include('konfiguro.php');

    session_start();

    $kontrollo_perdorues=$_SESSION['Emri'];

    $kontrollo_sql = mysqli_query($lidhe11,"CALL umseKontrollo_perdorues('$kontrollo_perdorues') ");

    $rreshti=mysqli_fetch_array($kontrollo_sql,MYSQLI_ASSOC);

    $perdoruesi=$rreshti['Emri'];
    
    if(!isset($kontrollo_perdorues)){ 
        header("Location: index.php");
    } 
?>