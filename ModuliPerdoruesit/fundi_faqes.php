<footer id="footer">
	<section>
		<?php
            $rezultati = mysqli_query($lidhe004, "CALL umse_fundi_pershkrimi");
			while ($rreshti = mysqli_fetch_assoc($rezultati)) 
			{
				extract($rreshti);		  
				if($rezultati==null)
				mysqli_free_result($rezultati);
				?>
					<h2><?php echo $Shenimi; ?></h2>
					<?php echo $Pershkrimi; ?>
				<?php 
			} 
		?>	
	</section>
	<section>
        <h2>Te dhenat</h2>
		<dl class="alt">
			<?php
            	$rezultati = mysqli_query($lidhe005, "CALL umse_fundi_tedhenat");
				while ($rreshti = mysqli_fetch_assoc($rezultati)) 
				{
					extract($rreshti);	  
					if($rezultati==null)
					mysqli_free_result($rezultati);
					?>
						<?php echo $Pershkrimi; ?>
					<?php 
				} 
			?>	
		</dl>
		<ul class="icons">
			<?php
            	$rezultati = mysqli_query($lidhe006, "CALL umse_fundi_rrjetetsociale");
				while ($rreshti = mysqli_fetch_assoc($rezultati)) 
				{
					extract($rreshti);
					if($rezultati==null)
					mysqli_free_result($rezultati);
					?>
						<?php echo $Pershkrimi; ?>
					<?php 
				} 
			?>	
		</ul>
	</section>
	<p class="copyright">
		<?php
            $rezultati = mysqli_query($lidhe007, "CALL umse_funditedrejtatautoriale");
			while ($rreshti = mysqli_fetch_assoc($rezultati)) 
			{
				extract($rreshti);
				if($rezultati==null)
				mysqli_free_result($rezultati);
				?>
					<?php echo $Pershkrimi; ?>
				<?php 
			} 
		?>	
	</p>
</footer>