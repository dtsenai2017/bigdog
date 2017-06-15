<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Materialize CSS min. -->
<link rel="stylesheet" href="resources/materialize/css/materialize.css">

<!-- JQuery Confirm CSS  -->
<link rel="stylesheet" href="resources/jquery/css/jquery-confirm.css">

<!-- JQuery ui css -->
<link rel="stylesheet" href="resources/jquery/css/jquery-ui.css" />

<!-- Import's JS -->
<!-- JQuery -->
<script src="resources/jquery/jquery-3.2.1.js" defer></script>

<!-- JQuery HideSeek min (buscar) -->
<script type="text/javascript"
	src="resources/jquery/jquery.hideseek.min.js" defer></script>

<!-- JQuery Confirm (dialog, alert...) -->
<script type="text/javascript" src="resources/jquery/jquery-confirm.js"
	defer></script>

<!-- JQuery UI min -->
<script src="resources/jquery/jquery-ui.min.js" defer></script>

<!-- JQuery Mask  -->
<script type="text/javascript" src="resources/jquery/jquery.mask.js"
	defer></script>

<!-- Materialize min. -->
<script type="text/javascript"
	src="resources/materialize/js/materialize.min.js" defer></script>
</head>
<body>
	<!-- Navbar -->
	<header> <nav class="red darken-3 z-depth-0">
	<div class="container nav-wrapper">
		<div class="row">
			<!-- Logo -->
			<div class="col m3 l3">
				<a id="logo-administrador" href="#" class="brand-logo "><b><span
						style="font-size: 34px;">BIGDOG</span></b></a> <a href="#"
					data-activates="menu-mobile" class="button-collapse"><i
					class="material-icons">menu</i></a>
			</div>

			<!-- Links -->
			<div class="right col m7 l7 hide-on-med-and-down">
				<ul id="nav-mobile" class="right">
					<!-- Início -->
					<li class="waves-effect"><a id="btn-index-administrador"><i
							class="material-icons center">home</i></a></li>

					<!-- Gerenciar -->
					<li><a class="dropdown-button waves-effect"
						data-activates="dropdown-gerenciar" data-constrainwidth="false"
						data-beloworigin="true"><i class="material-icons right">arrow_drop_down</i>Gerenciar</a></li>

					<!-- Logout -->
					<li class="waves-effect"><a onclick="logout();"><i
							class="material-icons center red-text text-accent-1">power_settings_new</i></a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- /.nav-wrapper --></nav> <!-- Dropdown Gerenciar -->
	<ul id="dropdown-gerenciar" class="dropdown-content">
		<!-- Cliente -->
		<li><a id="btn-gerenciar-cliente"><i
				class="material-icons  left blue-text text-blue">people</i>Cliente</a></li>

		<!-- Loja -->
		<li><a id="btn-gerenciar-loja"><i
				class="material-icons  left red-text text-red">shopping_cart</i>Loja</a></li>

		<!-- Agenda -->
		<li><a id="btn-gerenciar-agenda"><i
				class="material-icons  left cyan-text text-cyan">event_note</i>Agenda</a></li>

		<!-- Serviço -->
		<li><a id="btn-gerenciar-servico" class="waves-effect"><i
				class="material-icons  left grey-text text-grey">work</i>Serviço</a></li>
	</ul>

	<!-- Sidenav mobile -->
	<ul id="menu-mobile" class="side-nav">
		<!-- Início -->
		<li><a id="btn-mobile-index-administrador" class="waves-effect"><i
				class="material-icons  left red-text text-red">home</i>Início</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Gerenciar -->
		<li><h6 align="center" class="grey-text text-grey">
				<b>Gerenciar</b>
			</h6></li>

		<!-- Cliente -->
		<li><a id="btn-gerenciar-cliente" class="waves-effect"><i
				class="material-icons  blue-text text-blue">people</i>Cliente</a></li>

		<!-- Loja -->
		<li><a id="btn-gerenciar-loja" class="waves-effect"><i
				class="material-icons  left red-text text-red">store</i>Loja</a></li>

		<!-- Agenda -->
		<li><a id="btn-gerenciar-agenda" class="waves-effect"><i
				class="material-icons  left cyan-text text-cyan">event_note</i>Agenda</a></li>

		<!-- Serviço -->
		<li><a id="btn-gerenciar-servico" class="waves-effect"><i
				class="material-icons  left grey-text text-grey">work</i>Serviço</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Logout -->
		<li><a onclick="logout();" class="waves-effect"><i
				class="material-icons center red-text text-accent-1">power_settings_new</i>
				Sair</a></li>
	</ul>
	</header>

	<!-- Script's dedicado -->
	<!-- JS dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/component/navbar.js" defer></script>

	<!-- JS para busca -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/component/buscar.js" defer></script>
</body>
</html>