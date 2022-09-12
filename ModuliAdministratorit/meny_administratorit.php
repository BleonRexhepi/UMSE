<?php
  $rezultati = mysqli_query($lidhe21, "CALL umse_meny_administratorit");
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