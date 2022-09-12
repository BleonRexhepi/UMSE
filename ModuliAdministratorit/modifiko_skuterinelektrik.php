<?php
	include("kontrollo.php");	
?>

<?php
	include_once("konfiguro.php");

	if(isset($_POST['modifiko_skuterinelektrik']))
	{	
		$ID_SkuteriElektrik=$_POST['ID_SkuteriElektrik'];
		$Emri_SkuteritElektrik=$_POST['Emri_SkuteritElektrik'];
		$Shpejtsia_SkuteritElektrik=$_POST['Shpejtsia_SkuteritElektrik'];
		$Pershkrimi_SkuteritElektrik=$_POST['Pershkrimi_SkuteritElektrik'];
		$ID_LlojiSkuteritElektrik=$_POST['ID_LlojiSkuteritElektrik'];	
		$Foto_SkuteritElektrik=addslashes (file_get_contents($_FILES['Foto_SkuteritElektrik']['tmp_name']));
		$Emri_FotoSkuteritElektrik=$_FILES['Foto_SkuteritElektrik']['name'];
		$maxsize = 10000000; 
	
		if(empty($Emri_SkuteritElektrik) ) 
		{	
			if(empty($Emri_SkuteritElektrik)) 
			{
				echo "<font color='red'>Fusha Emri i skuterit elektrik eshte e zbrazet.</font><br/>";
			}
		} 
		else
		{	
			mysqli_query($lidhe, "SET @p_ID_SkuteriElektrik='${ID_SkuteriElektrik}'");
			mysqli_query($lidhe, "SET @p_Emri_SkuteritElektrik='${Emri_SkuteritElektrik}'");
			mysqli_query($lidhe, "SET @p_Shpejtsia_SkuteritElektrik='${Shpejtsia_SkuteritElektrik}'");
			mysqli_query($lidhe, "SET @p_Pershkrimi_SkuteritElektrik='${Pershkrimi_SkuteritElektrik}'");
			mysqli_query($lidhe, "SET @p_Foto_SkuteritElektrik='${Foto_SkuteritElektrik}'");
			mysqli_query($lidhe, "SET @p_Emri_FotoSkuteritElektrik='${Emri_FotoSkuteritElektrik}'");
			mysqli_query($lidhe, "SET @p_ID_LlojiSkuteritElektrik='${ID_LlojiSkuteritElektrik}'");
			$rezultati=mysqli_query($lidhe,"CALL umseModifiko_skuterelektrik(@p_ID_SkuteriElektrik,@p_Emri_SkuteritElektrik,@p_Shpejtsia_SkuteritElektrik,@p_Pershkrimi_SkuteritElektrik,@p_Foto_SkuteritElektrik,@p_Emri_FotoSkuteritElektrik, @p_ID_LlojiSkuteritElektrik)");
			if($rezultati)
			{
				header("Location:menaxho_skuteretelektrik.php");
			}
			else
			{
				die("Nuk mund te ekzekutohet procedura e modifikimit!");
			}
		}
	}
?>

<?php
	$ID_SkuteriElektrik = $_GET['ID_SkuteriElektrik'];
	$rezultati = mysqli_query($lidhe9, "CALL umseZgjedhID_skuterelektrik('$ID_SkuteriElektrik')");
	while($rezultat = mysqli_fetch_array($rezultati))
	{
		$Emri_SkuteritElektrik = $rezultat['Emri_SkuteritElektrik'];
		$Shpejtsia_SkuteritElektrik = $rezultat['Shpejtsia_SkuteritElektrik'];
		$Pershkrimi_SkuteritElektrik = $rezultat['Pershkrimi_SkuteritElektrik'];
		$ID_LlojiSkuteritElektrik = $rezultat['ID_LlojiSkuteritElektrik'];
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
						<form 	enctype="multipart/form-data"  action="modifiko_skuterinelektrik.php" method="post" name="form1">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">Emri i skuterit elektrik
									<input type="text" name="Emri_SkuteritElektrik" id="Emri_SkuteritElektrik" value='<?php echo $Emri_SkuteritElektrik;?>' required />
								</div>
								<div class="col-6 col-12-xsmall">Shpejtesia e skuterit elektrik
									<input type="text" name="Shpejtsia_SkuteritElektrik" id="Shpejtsia_SkuteritElektrik" value='<?php echo $Shpejtsia_SkuteritElektrik;?>' required />
								</div>
								<div class="col-6 col-12-xsmall">Pershkrimi i skuterit elektrik
									<textarea name="Pershkrimi_SkuteritElektrik"  rows="8" cols="10"><?php echo $Pershkrimi_SkuteritElektrik;?></textarea>
								</div>
								<div class="col-6 col-12-xsmall">
									<td><input type="hidden" name="MAX_FILE_SIZE" value="10000000" /></td>
									<td><input name="Foto_SkuteritElektrik" type="file" /></td>
								</div>
								<div class="col-6 col-12-xsmall">
									<select name="ID_LlojiSkuteritElektrik">
										<option selected="selected" required>Zgjedh llojin e skuterit elektrik</option>
										<?php
											$rezultat= mysqli_query ($lidhe6, "CALL umseZgjedh_llojiskutereve_elektrik");
											while($rreshti=$rezultat->fetch_array()){
												?>
													<option value="<?php echo $rreshti['ID_LlojiSkuteritElektrik']; ?>"><?php echo $rreshti['Emri_Llojit_te_SkuteritElektrik']; ?></option>
												<?php
											}
										?>
									</select><br />
								<div class="col-12">
									<ul class="actions">
										<li><input type="hidden" name="ID_SkuteriElektrik" value='<?php echo $_GET['ID_SkuteriElektrik'];?>' /></li>
										<li><input type="submit" name="modifiko_skuterinelektrik" value="Modifiko" class="primary" /></li>
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