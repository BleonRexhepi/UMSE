<?php
	include("kontrollo.php");	
?>

<?php
	include_once("konfiguro.php");

	if(isset($_POST['modifiko_llojin_skuteritelektrik']))
	{	
		$ID_LlojiSkuteritElektrik = $_POST['ID_LlojiSkuteritElektrik'];
		$Emri_Llojit_te_SkuteritElektrik=$_POST['Emri_Llojit_te_SkuteritElektrik'];
	
		if(empty($Emri_Llojit_te_SkuteritElektrik) ) 
		{	
			if(empty($Emri_Llojit_te_SkuteritElektrik)) 
			{
				echo "<font color='red'>Fusha Emri i llojit te skuterit elektrik eshte e zbrazet.</font><br/>";
			}
		} 
		else 
		{	
			mysqli_query($lidhe, "SET @p_ID_LlojiSkuteritElektrik=${ID_LlojiSkuteritElektrik}");
			mysqli_query($lidhe, "SET @p_Emri_Llojit_te_SkuteritElektrik='${Emri_Llojit_te_SkuteritElektrik}'");
			$rezultati = mysqli_query($lidhe,"CALL umseModifiko_llojiskutereve_elektrik(@p_ID_LlojiSkuteritElektrik,@p_Emri_Llojit_te_SkuteritElektrik)");
			header("Location: menaxho_llojin_skuteritelektrik.php");
		}
	}
?>

<?php
	$ID_LlojiSkuteritElektrik = $_GET['ID_LlojiSkuteritElektrik'];

	$rezultati = mysqli_query($lidhe8, "CALL umseZgjedhID_llojiskutereve_elektrik('$ID_LlojiSkuteritElektrik')");
	while($rezultat = mysqli_fetch_array($rezultati))
	{
		$Emri_Llojit_te_SkuteritElektrik = $rezultat['Emri_Llojit_te_SkuteritElektrik'];
	}
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

				<!-- Get Started -->
				<section id="content" class="main">
					<section>
						<h2>Emri i llojit te skuterit elektrik</h2>
						<form method="post" action="modifiko_llojin_skuteritelektrik.php">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">
										<input type="text" name="Emri_Llojit_te_SkuteritElektrik" id="Emri_Llojit_te_SkuteritElektrik" value='<?php echo $Emri_Llojit_te_SkuteritElektrik;?>' required />
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="hidden" name="ID_LlojiSkuteritElektrik" value='<?php echo $_GET['ID_LlojiSkuteritElektrik'];?>' /></li>
										<li><input type="submit" name="modifiko_llojin_skuteritelektrik" value="Modifiko" class="primary" /></li>
									</ul>
								</div>
							</div>
						</form> 
					</section>	
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