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
						<h2>MENAXHIMI I TE DHENAVE TE PERDORUESVE</h2>
					</header>
					<ul class="features">
						<li>
							<span class="icon major style3 fa-copy"></span>
							<a href="shto_perdorues.php"><h3>SHTO PERDORUES</h3></a>
							<p>Forma per shtimin e perdoruesve ne uebaplikacion</p>
						</li>
						<li>
							<span class="icon major style3 fa-copy"></span>
							<a href="modifiko_perdoruesin.php"><h3>MODIFIKO PERDORUES</h3></a>
							<p>Forma per modifikimin e perdoruesve ne uebaplikacion</p>
						</li>
						<li>
							<span class="icon major style3 fa-copy"></span>
							<a href="fshij_perdorues.php"><h3>FSHIJ PERDORUES</h3></a>
							<p>Forma per fshirjen e perdoruesve ne uebaplikacion</p>
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