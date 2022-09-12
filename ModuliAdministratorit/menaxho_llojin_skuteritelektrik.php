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
					<h2 style="text-align:left;">Shto Llojin e Skuterit Elektrik</h2>
					<form method="post" action="shto_llojin_skuteritelektrik.php">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="Emri_Llojit_te_SkuteritElektrik" id="demo-name" placeholder="Emri i llojit" />
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" name="shto_llojin_skuteritelektrik" value="Shto" class="primary" /></li>				
								</ul>
							</div>
						</div>
					</form>
				</section>

				<!-- Second Section -->
				<section id="second" class="main special">				
					<form action="" method="post">
						<div class="table-wrapper">
							<table>
								<tr>
									<h3>Kërko të dhënat e llojit të skutereve elektrik për modifikim ose fshirje</h3>
								</tr>
								<tr>
									<td>
										Shkruaj:
									</td>
									<td>
										<input type="text" name="term" value="%"/>
									</td>
									<td> 
										<input type="submit" value="Kërko" class="button primary"/>
									</td>
								</tr>
							</table> 
						</div>
					</form>				
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>Lloji i Skuterit Elektrik</th>
									<th>Modifiko</th>
									<th>Fshije</th>
								</tr>
							</thead>
							<?php
								if (!empty($_REQUEST['term'])) {
									$term = mysqli_real_escape_string
									($lidhe,$_REQUEST['term']);   
									$sql= mysqli_query ($lidhe4, "CALL umseZgjedhterm_llojiskutereve_elektrik('$term')"); 
									while($rreshti = mysqli_fetch_array($sql)) { 		
										echo "<tr>";
											echo "<td>".$rreshti['Emri_Llojit_te_SkuteritElektrik']."</td>";
											echo "<td><a href=\"modifiko_llojin_skuteritelektrik.php?ID_LlojiSkuteritElektrik=$rreshti[ID_LlojiSkuteritElektrik]\" class='button primary'>Modifiko</a></td>";
											echo "<td><a href=\"fshij_llojin_skuteritelektrik.php?ID_LlojiSkuteritElektrik=$rreshti[ID_LlojiSkuteritElektrik]\" onClick=\"return confirm('A jeni te sigurt se deshironi te fshini llojin e skuterit elektrik?')\"  class='button primary'>Fshije</a></td>
										</tr>";		
									}
								}
							?>										
						</table>
					</div>
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