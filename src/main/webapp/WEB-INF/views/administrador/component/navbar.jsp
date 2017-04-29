<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- CSS dedicado -->
<link rel="stylesheet" href="resources/dedicated/css/util/navbar.css">

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Materialize CSS min. -->
<link rel="stylesheet"
	href="resources/materialize/css/materialize.min.css">

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

<!-- JQuery Mask  -->
<script type="text/javascript" src="resources/jquery/jquery.mask.js"
	defer></script>

<!-- Materialize JS min. -->
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
				<a class="brand-logo "><b><span style="font-size: 34px;">Administrador</span></b></a>
				<a href="" data-activates="menu-mobile" class="button-collapse"><i
					class="material-icons">menu</i></a>
			</div>

			<!-- Links -->
			<div class="right col m7 l7 hide-on-med-and-down">
				<ul id="nav-mobile" class="right">
					<!-- Início -->
					<li class="waves-effect"><a href="indexAdministrador"><i
							class="material-icons center">home</i></a></li>

					<!-- Gerenciar -->
					<li><a class="dropdown-button waves-effect"
						data-activates="dropdown-gerenciar" data-constrainwidth="false"
						data-beloworigin="true"><i class="material-icons right">arrow_drop_down</i>Gerenciar</a></li>
				</ul>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.nav-wrapper --></nav> <!-- Dropdown Gerenciar -->
	<ul id="dropdown-gerenciar" class="dropdown-content">
		<!-- Cliente -->
		<li><a href="gerenciarCliente"><i
				class="material-icons left blue-text text-blue">people</i>Cliente</a></li>

		<!-- Loja -->
		<li><a href="gerenciarLoja"><i
				class="material-icons left red-text text-red">shopping_cart</i>Loja</a></li>

		<!-- Agenda -->
		<li><a href="gerenciarAgendamentos"><i
				class="material-icons left cyan-text text-cyan">event_note</i>Agenda</a></li>
	</ul>

	<!-- Sidenav mobile -->
	<ul id="menu-mobile" class="side-nav">
		<!-- Início -->
		<li><a href="indexAdministrador" class="waves-effect"><i
				class="material-icons left red-text text-red">home</i>Início</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Gerenciar -->
		<li><h6 align="center" class="grey-text text-grey">
				<b>Gerenciar</b>
			</h6></li>

		<!-- Cliente -->
		<li><a href="gerenciarCliente" class="waves-effect"><i
				class="material-icons blue-text text-blue">people</i>Cliente</a></li>

		<!-- Loja -->
		<li><a href="gerenciarLoja" class="waves-effect"><i
				class="material-icons left red-text text-red">store</i>Loja</a></li>

		<!-- Agenda -->
		<li><a href="gerenciarAgenda" class="waves-effect"><i
				class="material-icons left cyan-text text-cyan">event_note</i>Agenda</a></li>
	</ul>
	</header>

	<!-- Script's dedicado -->
	<!-- JS dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/util/navbar.js" defer></script>
	<!-- JS para busca -->
	<script type="text/javascript"
		src="resources/dedicated/js/util/buscar.js" defer></script>
</body>
</html>