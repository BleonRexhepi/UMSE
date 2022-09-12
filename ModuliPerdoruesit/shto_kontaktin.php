<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Moduli i Perdoruesit</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		<?php
			include_once("konfiguro.php");

			if(isset($_POST['shto_kontaktin'])) 
			{	
				$Subjekti = mysqli_real_escape_string($lidhe,$_POST['Subjekti']);
				$Mesazhi = mysqli_real_escape_string($lidhe,$_POST['Mesazhi']);
				$Email = mysqli_real_escape_string($lidhe,$_POST['Email']);
					
				if(empty($Subjekti)) 
				{			
					if(empty($Subjekti)) {echo "<font color='red'>Fusha Subjekti eshte e zbrazet.</font><br/>";}
					echo "<br/><a href='javascript:self.history.back();'>Kthehu mbrapa</a>";
				}
				else 
				{ 
					$Email = filter_var($Email, FILTER_SANITIZE_EMAIL);
					if(filter_var($Email, FILTER_VALIDATE_EMAIL)==false)
					{
						echo "<b>$Email</b> nuk eshte valide";
						echo "<script>setTimeout(function(){window.location.href = 'shto_kontakt.php';}, 5000);</script>";
						echo"<p><b>Ju lutem pritni 5 sekonda per tu kthyer ne form perseri<b></p>";
					}
					else 
					{ 
						$rezultati = mysqli_query($lidhe, "CALL umseShto_kontakt ('$Subjekti','$Mesazhi','$Email')");
						echo "<script>setTimeout(function(){window.location.href = 'shto_kontakt.php';}, 5000);</script>";
						echo"<p><b>E dhena eshte duke u regjistruar ne sistem. Ju lutem pritni 5 sekonda. <b></p>";
					}
				}
			}
		?>
	</body>
</html>