<?php
	include("kontrollo.php");	
?>

<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Moduli i Administratorit</title>
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
				<?php include_once("meny_administratorit.php");	?>

				<!-- Main -->
				<div id="main">

					<!-- Introduction -->
					<section id="intro" class="main">
						<div class="spotlight">
							<div class="content">
								<p style="text-align:right;">Përshëndetje, <em><?php  echo $perdoruesi;?>!</em></p>	
							</div>
						</div>
					</section>

					<!-- First Section -->
					<section id="first" class="main special">
						<header class="major">
							<h2>MENAXHIMI I TE DHENAVE TE BALLINES</h2>
						</header>
						<ul class="features">
							<li>
								<span class="icon major style3 fa-copy"></span>
								<a href="menaxho_llojin_skuteritelektrik.php"><h3>MENAXHO LLOJIN E SKUTERIT ELEKTRIK</h3></a>
								<p>Forma per menaxhimin e llojit te skutereve elektrik ne uebaplikacion</p>
							</li>
							<li>
								<span class="icon major style3 fa-copy"></span>
								<a href="menaxho_skuteretelektrik.php"><h3>MENAXHO SKUTER ELEKTRIK</h3></a>
								<p>Forma per menaxhimin e skutereve elektrik ne uebaplikacion</p>
							</li>
							<li>
								<span class="icon major style3 fa-copy"></span>
								<a href="menaxho_tedhenat.php"><h3>MENAXHO TE DHENA</h3></a>
								<p>Forma per menaxhimin e te dhenave ne uebaplikacion</p>
							</li>
						</ul>
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