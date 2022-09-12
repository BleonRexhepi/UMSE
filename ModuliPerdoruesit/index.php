<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<?php include_once("konfiguro.php"); ?>
<html>
	<head>
		<title>Moduli i Perdoruesit</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
		<div id="wrapper">

			<!-- Header -->
			<?php include_once("fillimi_faqes.php");?>

			<!-- Nav -->
			<?php include_once("meny_perdoruesit.php");	?>

			<!-- Main -->
			<div id="main">

				<section id="intro" class="main">
					<div class="spotlight">
						<div class="content">
							<?php
								$vizita = 1;
								if (isset($_COOKIE["vizita"])) 
								{
									$vizita = (int)$_COOKIE["vizita"];
								}
								$muaji = 2592000 + time();
								setcookie("vizita", date("F jS - g:i a"), $muaji);
								if (isset($_COOKIE['vizita'])) 
								{
									$fundit = $_COOKIE['vizita'];
									echo "<p style='text-align:right;'>Vizita juaj e fundit ishte me: " . $fundit . "</p>";
								} 
								else 
								{
									echo "<p style='text-align:right;'>Vizita juaj e pare ne uebaplikacion tone! Ju deshirojme mireseardhje!</p>";
								}
							?>
						</div>
					</div>
				</section>

				<!-- Introduction -->	
				<?php
					$rezultati = mysqli_query($lidhe002,"CALL umseZgjedh_skuterelektrik_ballin()");
					while($rreshti=mysqli_fetch_array($rezultati))
					{
						extract($rreshti);
						if($rezultati==null)
						mysqli_free_result($rezultati);
						?>
							<section id="intro" class="main">
								<div class="spotlight">
									<div class="content">
										<header class="major">
											<h2><?php echo $Emri_SkuteritElektrik; ?></h2>
										</header>
										<h4>Shpejtsia: <?php echo $Shpejtsia_SkuteritElektrik; ?></h4>
										<p><?php echo $Pershkrimi_SkuteritElektrik; ?></p>
										<h4><b><?php echo $Emri_Llojit_te_SkuteritElektrik; ?></b></h4>
									</div>	
									<span class="image">
										<?php echo '<img src="data:Foto_SkuteritElektrik/jpeg;base64,'.base64_encode( $rreshti['Foto_SkuteritElektrik'] ).'" width="100%" height="100%">'; ?>
									</span>
								</div>
							</section>
                        <?php 
					} 
				?>
			</div>

			<!-- Footer -->
			<?php include_once("fundi_faqes.php");	?>
		</div>

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
	</body>
</html>