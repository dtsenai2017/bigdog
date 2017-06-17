<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- �cone da aba -->
<link rel="shortcut icon" type="image/png"
	href="resources/other/img/warning.png">

<!-- CSS dedicado -->
<link rel="stylesheet" type="text/css"
	href="resources/other/css/other-pages.css">

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Materialize CSS min. -->
<link rel="stylesheet" href="resources/materialize/css/materialize.css">

<!-- Import's JS -->
<!-- JQuery -->
<script src="resources/jquery/jquery-3.2.1.js" defer></script>

<!-- Materialize min. -->
<script type="text/javascript"
	src="resources/materialize/js/materialize.min.js" defer></script>

<!-- T�tulo -->
<title>N�o Autorizado</title>
</head>
<body class="red darken-1">
	<!-- Conte�do central -->
	<div id="conteudo-centro" class="container">
		<div class="row">
			<!-- Imagem -->
			<div class="col s12 m3 l3">
				<!-- Imagem -->
				<img class="center tooltipped" data-position="top" data-delay="50"
					data-tooltip="Ops!!!"
					src="resources/other/img/img-not-authorized.png"
					class="responsive-img">
			</div>

			<!-- Descri��o -->
			<div class="col s12 m9 l9">
				<!-- �cone -->
				<p align="center">
					<i class="material-icons red-text text-accent-1 medium">warning</i>
				</p>

				<!-- Descri��o -->
				<h4 class="white-text" align="center">P�gina n�o autorizada</h4>

				<!-- divider -->
				<div class="divider"></div>

				<!-- Descri��o -->
				<h5 align="center" class="white-text">A p�gina que voc�
					solicitou n�o pode ser autorizada.</h5>
				<h5 align="center" class="white-text">Verifique as credenciais
					que voc� forneceu e o endere�o e tente novamente!</h5>

				<!-- br -->
				<br>

				<!-- Ir para home -->
				<div class="center">
					<a href="home" class="waves-effect waves-light btn brown darken-1"><i
						class="material-icons left red-text">navigate_before</i>Site</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>