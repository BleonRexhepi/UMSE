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

			if(isset($_POST['shto_skuterinelektrik'])) 
			{	
				$Emri_SkuteritElektrik	 = $_POST['Emri_SkuteritElektrik'];
				$Shpejtsia_SkuteritElektrik = $_POST['Shpejtsia_SkuteritElektrik'];
				$Pershkrimi_SkuteritElektrik = $_POST['Pershkrimi_SkuteritElektrik'];
				$ID_LlojiSkuteritElektrik = $_POST['ID_LlojiSkuteritElektrik'];
				$Foto_SkuteritElektrik =addslashes (file_get_contents($_FILES['Foto_SkuteritElektrik']['tmp_name']));
				$Emri_FotoSkuteritElektrik = $_FILES['Foto_SkuteritElektrik']['name'];
				$maxsize = 10000000; //set to approx 10 MB
			
				if(empty($Emri_SkuteritElektrik) || empty($Shpejtsia_SkuteritElektrik) || empty($Pershkrimi_SkuteritElektrik))
				{			
					if(empty($Emri_SkuteritElektrik)) {echo "<font color='red'>Fusha Emri i skuterit elektrik eshte e zbrazet.</font><br/>";}
					if(empty($Shpejtsia_SkuteritElektrik)) {echo "<font color='red'>Fusha Shpejtsia e skuterit elektrik eshte e zbrazet.</font><br/>";}
					if(empty($Pershkrimi_SkuteritElektrik)) {echo "<font color='red'>Fusha Pershkrimi i skuterit elektrik eshte e zbrazet.</font><br/>";}
					echo "<br/><a href='javascript:self.history.back();'>Kthehu mbrapa</a>";
				} 
				else 
				{ 
					$rezultati = mysqli_query($lidhe, "CALL umseShto_skuterelektrik ('$Emri_SkuteritElektrik','$Shpejtsia_SkuteritElektrik','$Pershkrimi_SkuteritElektrik','$Foto_SkuteritElektrik','$$Emri_FotoSkuteritElektrik','$ID_LlojiSkuteritElektrik')");
					echo "<script>setTimeout(function(){window.location.href = 'menaxho_skuteretelektrik.php';}, 5000);</script>";
				 	echo"<p><b>E dhena eshte duke u regjistruar ne sistem. Ju lutem pritni 5 sekonda. <b></p>";
				}
			}
		?>		
	</body>
</html>