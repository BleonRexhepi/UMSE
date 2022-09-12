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
		<?php
			include_once("konfiguro.php");

			if(isset($_POST['shto_llojin_skuteritelektrik'])) 
			{	
				$Emri_Llojit_te_SkuteritElektrik = $_POST['Emri_Llojit_te_SkuteritElektrik'];
			
				if(empty($Emri_Llojit_te_SkuteritElektrik)) 
				{			
					if(empty($Emri_Llojit_te_SkuteritElektrik)) 
					{
						echo "<font color='red'>Fusha Emri i llojit te skuterit elektrik eshte e zbrazet.</font><br/>";
					}
				
					echo "<br/><a href='javascript:self.history.back();'>Kthehu mbrapa</a>";
				}
				else
				{
					if (strlen($Emri_Llojit_te_SkuteritElektrik) < 6) 
					{
						trigger_error("Emri i llojit te skuterit elektrik duhet te jet mbi 6 karaktere");
						echo "<script>setTimeout(function(){window.location.href = 'menaxho_llojin_skuteritelektrik.php';}, 5000);</script>";
						echo"<p><b>Ju lutem pritni 5 sekonda per tu kthyer perseri ne formen per shtim te llojit te skuterit elektrik.<b></p>";
					} 
					else 
					{ 	
						$rezultati = mysqli_query($lidhe, "CALL umseShto_llojiskutereve_elektrik ('$Emri_Llojit_te_SkuteritElektrik')");
						echo "<script>setTimeout(function(){window.location.href = 'menaxho_llojin_skuteritelektrik.php';}, 5000);</script>";
						echo"<p><b>E dhena eshte duke u regjistruar ne sistem. Ju lutem pritni 5 sekonda. <b></p>";
					}
				}
			}
		?>
	</body>
</html>