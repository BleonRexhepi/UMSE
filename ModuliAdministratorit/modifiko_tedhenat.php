<?php
	include("kontrollo.php");	
?>

<?php
	include_once("konfiguro.php");

	if(isset($_POST['modifiko_tedhenat']))
	{	
		$ID_tedhenat = $_POST['ID_tedhenat'];
		$Shenimi=$_POST['Shenimi'];
		$Pershkrimi=$_POST['Pershkrimi'];
		$Fajlli=$_POST['Fajlli'];
		$Pamja_faqes=$_POST['Pamja_faqes'];
	
		if(empty($Pershkrimi)) 
		{			
			if(empty($Pershkrimi))
			{
				echo "<font color='red'>Fusha Pershkrimi eshte e zbrazet.</font><br/>";
			}
			echo "<br/><a href='javascript:self.history.back();'>Kthehu mbrapa</a>";
		} 
		else 
		{	
			mysqli_query($lidhe, "SET @p_ID_tedhenat=${ID_tedhenat}");
			mysqli_query($lidhe, "SET @p_Shenimi='${Shenimi}'");
			mysqli_query($lidhe, "SET @p_Pershkrimi='${Pershkrimi}'");
			mysqli_query($lidhe, "SET @p_Fajlli='${Fajlli}'");
			mysqli_query($lidhe, "SET @p_Pamja_faqes='${Pamja_faqes}'");
			$rezultati=mysqli_query($lidhe,"CALL umseModifiko_tedhena(@p_ID_tedhenat,@p_Shenimi,@p_Pershkrimi,@p_Fajlli,@p_Pamja_faqes)");
			if($rezultati)
			{
				header("Location:menaxho_tedhenat.php");
			}
			else
			{
				die("Nuk mund te ekzekutohet procedura e modifikimit!");
			}
		}
	}
?>

<?php
	$ID_tedhenat = $_GET['ID_tedhenat'];
	$rezultati = mysqli_query($lidhe10, "CALL umseZgjedhID_tedhena('$ID_tedhenat')");
	while($rezultat = mysqli_fetch_array($rezultati))
	{
		$Shenimi_1 = $rezultat['Shenimi'];
		$Pershkrimi_1 = $rezultat['Pershkrimi'];
		$Fajlli_1 = $rezultat['Fajlli'];
		$Pamja_faqes_1 = $rezultat['Pamja_faqes'];
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
						<h2>Modifiko të dhënat</h2>
						<form method="post" action="modifiko_tedhenat.php">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">Shenimi
										<input type="text" name="Shenimi" id="Titulli" value='<?php echo $Shenimi_1;?>' required />
								</div>
								<div class="col-6 col-12-xsmall">Fajlli
										<input type="text" name="Fajlli" id="Fajlli" value='<?php echo $Fajlli_1;?>' required />
								</div>
								<div class="col-6 col-12-xsmall">Pershkrimi
									<textarea name="Pershkrimi"  rows="12" cols="10"><?php echo $Pershkrimi_1;?></textarea>	
								</div>
								<div class="col-6 col-12-xsmall">Pamja e faqes
									<input type="text" name="Pamja_faqes" id="Pamja_faqes" value='<?php echo $Pamja_faqes_1;?>' required />
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="hidden" name="ID_tedhenat" value='<?php echo $_GET['ID_tedhenat'];?>' /></li>
										<li><input type="submit" name="modifiko_tedhenat" value="Modifiko" class="primary" /></li>
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