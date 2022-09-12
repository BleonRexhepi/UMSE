<?php
	include("kontrollo.php");	
?>

<?php
	include_once("konfiguro.php");
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

				<!-- Second Section -->
				<section id="second" class="main special">					
					<form action="" method="post">
						<div class="table-wrapper">
							<table>
								<tr>
									<h3>Kërko të dhënat për modifikim</h3>
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
									<th>Shenimi</th>
									<th>Pershkrimi</th>
									<th>Fajlli</th>
									<th>Pamja e faqes</th>
									<th>Modifiko</th>
								</tr>
							</thead>
							<?php
								if (!empty($_REQUEST['term'])) {
									$term = mysqli_real_escape_string
									($lidhe,$_REQUEST['term']); 
									$sql= mysqli_query ($lidhe7, "CALL umseZgjedhterm_tedhena('$term')"); 
									while($rreshti = mysqli_fetch_array($sql)) { 		
										echo "<tr>";
											echo "<td>".$rreshti['Shenimi']."</td>";
											echo "<td>".$rreshti['Pershkrimi']."</td>";
											echo "<td>".$rreshti['Fajlli']."</td>";
											echo "<td>".$rreshti['Pamja_faqes']."</td>";
											echo "<td><a href=\"modifiko_tedhenat.php?ID_tedhenat=$rreshti[ID_tedhenat]\" class='button primary'>Modifiko</a></td>
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