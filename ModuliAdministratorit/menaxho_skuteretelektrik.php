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
					<h2 style="text-align:left;">Shto Skuterin Elektrik</h2>				
					<form 	enctype="multipart/form-data"  action="shto_skuterinelektrik.php" method="post" name="form1">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="Emri_SkuteritElektrik" id="demo-name" placeholder="Emri i skuterit elektrik" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="Shpejtsia_SkuteritElektrik" id="demo-name" placeholder="Shpejtsia e skuterit elektrik" />
							</div>
							<div class="col-6 col-12-xsmall">
								<textarea name="Pershkrimi_SkuteritElektrik" id="demo-name" placeholder="Pershkrimi i skuterit elektrik" rows="4"></textarea>
							</div>
							<div class="col-6 col-12-xsmall">
								<td><input type="hidden" name="MAX_FILE_SIZE" value="10000000" /></td>
								<td><input name="Foto_SkuteritElektrik" type="file" /></td>
							</div>
							<div class="col-6 col-12-xsmall">
								<select name="ID_LlojiSkuteritElektrik">
									<option selected="selected">Zgjedh Llojin e Skuterit Elektrik</option>
									<?php
										$rezultat= mysqli_query ($lidhe6, "CALL umseZgjedh_llojiskutereve_elektrik");
											#$res=mysqli_query($conn,"SELECT * FROM umse_llojeteskutereve_elektrik");
										while($rreshti=$rezultat->fetch_array()){
											?>
												<option value="<?php echo $rreshti['ID_LlojiSkuteritElektrik']; ?>"><?php echo $rreshti['Emri_Llojit_te_SkuteritElektrik']; ?></option>
											<?php
										}
									?>
								</select><br />
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" name="shto_skuterinelektrik" value="Shto" class="primary" /></li>
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
									<h3>Kërko të dhënat e skuterit elektrik për modifikim ose fshirje</h3>
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
									<th>Emri</th>
									<th>Shpejtesia</th>
									<th>Pershkrimi</th>
									<th>Foto</th>
									<th>Emri i fotos</th>
									<th>Lloji i skuterit elektrik</th>
									<th>Modifiko</th>
									<th>Fshije</th>
								</tr>
							</thead>					
							<?php
								if (!empty($_REQUEST['term'])) {
									$term = mysqli_real_escape_string($lidhe,$_REQUEST['term']);     
									$sql= mysqli_query ($lidhe5, "CALL umseZgjedhterm_skuterelektrik('$term')");
									while($rreshti = mysqli_fetch_array($sql)) { 		
										echo "<tr>";
											echo "<td>".$rreshti['Emri_SkuteritElektrik']."</td>";
											echo "<td>".$rreshti['Shpejtsia_SkuteritElektrik']."</td>";
											echo "<td>".$rreshti['Pershkrimi_SkuteritElektrik']."</td>";
											echo "<td><img src=data:Foto_SkuteritElektrik/jpeg;base64,".base64_encode($rreshti['Foto_SkuteritElektrik'])." width='80'  height='100'/></td>";
											echo "<td>".$rreshti['Emri_FotoSkuteritElektrik']."</td>";
											echo "<td>".$rreshti['Emri_Llojit_te_SkuteritElektrik']."</td>";			
											echo "<td><a href=\"modifiko_skuterinelektrik.php?ID_SkuteriElektrik=$rreshti[ID_SkuteriElektrik]\" class='button primary'>Modifiko</a></td>";
											echo "<td><a href=\"fshij_skuterinelektrik.php?ID_SkuteriElektrik=$rreshti[ID_SkuteriElektrik]\" onClick=\"return confirm('A jeni te sigurt se deshironi te fshini skuterin elektrik?')\"  class='button primary'>Fshije</a></td>
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