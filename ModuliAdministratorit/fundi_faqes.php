<footer id="footer">
	<section>
		<?php
            $rezultati = mysqli_query($lidhe15, "CALL umse_fundi_pershkrimi");
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
            	$rezultati = mysqli_query($lidhe16, "CALL umse_fundi_tedhenat");
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
            	$rezultati = mysqli_query($lidhe17, "CALL umse_fundi_rrjetetsociale");
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
            $rezultati = mysqli_query($lidhe18, "CALL umse_funditedrejtatautoriale");
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