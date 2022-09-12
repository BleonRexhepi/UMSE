<?php include_once("konfiguro.php");

    $rezultati = mysqli_query($lidhe001, "CALL umse_meny_perdoruesit()");
    while ($rreshti = mysqli_fetch_assoc($rezultati)) 
    {
        extract($rreshti);
        if($rezultati==null)
        mysqli_free_result($rezultati);
        ?>
            <nav id="nav">
                <ul> 				
                    <?php echo $Pershkrimi ?>
                </ul> 
            </nav>    			 

          <?php
    } 
?>