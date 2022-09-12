<?php
	$rezultati = mysqli_query($lidhe003, "CALL umse_fillimi_faqes");
	while ($rreshti = mysqli_fetch_assoc($rezultati)) 
	{
		extract($rreshti);						  
		if($rezultati==null)
		mysqli_free_result($rezultati);
		?>
			<header id="header" class="alt">
				<span class="logo"><img src="<?php echo $Fajlli; ?>" alt="" /></span>
				<h1><?php echo $Shenimi; ?></h1>
				<p><?php echo $Pershkrimi; ?></p>
			</header>		
		<?php 
	} 
?>	
	