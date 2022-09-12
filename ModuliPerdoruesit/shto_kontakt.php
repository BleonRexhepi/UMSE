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

				<!-- Introduction -->
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

				<!-- First Section -->
				<section id="first" class="main special">
					<h2 style="text-align:left;">Forma e kontaktit</h2>
					<form method="post" action="shto_kontaktin.php">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="Subjekti" id="demo-name" placeholder="Subjekti" />
								<br>
								<textarea name="Mesazhi" id="demo-message" placeholder="Mesazhi" rows="6"></textarea>
								<br>
								<input type="email" name="Email" id="demo-name" placeholder="Email" />
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" name="shto_kontaktin" value="Dergo" class="primary" /></li>
								</ul>
							</div>
						</div>
					</form>
				</section>
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