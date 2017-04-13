<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- CSS Dedicado -->
<link rel="stylesheet" href="resources/dedicated/css/navbar.css">

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Materialize CSS min. -->
<link rel="stylesheet"
	href="resources/materialize/css/materialize.min.css">

<!-- JQuery min.-->
<script type="text/javascript"
	src="resources/jquery/jquery-3.2.1.min.js"></script>

<!-- Materialize JS min. -->
<script type="text/javascript"
	src="resources/materialize/js/materialize.min.js"></script>
</head>
<body>
	<!-- Navbar -->
	<nav class="brown lighten-1 z-depth-0">
	<div class="container nav-wrapper">
		<!-- Row -->
		<div class="row">
			<!-- Logo -->
			<div class="col m4 l4">
				<a href="#" class="brand-logo waves-effect"><span
					class="brown-text text-lighten-4">Petshop</span> <b><span
						style="font-size: 36px;">Bigdog</span></b></a> <a href=""
					data-activates="menu-mobile" class="button-collapse"><i
					class="material-icons">menu</i></a>
			</div>

			<!-- Links -->
			<div class="right col m5 l5">
				<ul id="nav-mobile" class="right hide-on-med-and-down">
					<!-- Início -->
					<li class="waves-effect"><a href="index">Início</a></li>

					<!-- Login -->
					<li><a class="dropdown-button waves-effect"
						data-activates="dropdown-login" data-constrainwidth="false"
						data-beloworigin="true"><i class="material-icons right">arrow_drop_down</i><b>Login</b></a></li>

					<!-- Empresa -->
					<li><a class="dropdown-button waves-effect"
						data-activates="dropdown-empresa" data-constrainwidth="false"
						data-beloworigin="true"><i class="material-icons right">arrow_drop_down</i>Empresa</a></li>
				</ul>
			</div>

			<!-- Pesquisar -->
			<div class="center col m3 hide-on-med-and-down">
				<nav class="brown lighten-1 z-depth-0">
				<div class="nav-wrapper">
					<form>
						<div class="input-field">
							<input id="search" type="search" class="truncate"
								placeholder="O que procura?" required> <label
								class="label-icon" for="search"><i
								class="material-icons">search</i></label> <i class="material-icons">close</i>
						</div>
					</form>
				</div>
				</nav>
			</div>
		</div>
		<!-- /.row -->
	</div>
	</nav>

	<!-- Sidenav mobile -->
	<ul id="menu-mobile" class="side-nav">
		<!-- Início -->
		<li><a href="" class="waves-effect"><i
				class="material-icons left brown-text text-brown">domain</i>Início</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Entrar -->
		<li><a href="#modal-login" class="waves-effect"><i
				class="material-icons left blue-text text-green">person</i>Entrar</a></li>

		<!-- Registre-se -->
		<li><a href="formularioCliente" class="waves-effect"><i
				class="material-icons left green-text text-green">person_add</i>Registre-se
				já!</a></li>

		<!-- Esqueceu a senha -->
		<li><a href="" class="red-text text-lighten-2 waves-effect"><i
				class="material-icons left red-text text-red ">priority_high</i>Esqueceu
				a senha?</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Loja -->
		<li><a href="" class="waves-effect"><i
				class="material-icons left deep-orange-text text-deep-orange">shopping_cart</i>Loja</a></li>

		<!-- Agenda -->
		<li><a href="" class="waves-effect"><i
				class="material-icons left cyan-text text-cyan ">event_note</i>Agenda</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Sobre Nós -->
		<li><a href="" class="waves-effect"><i
				class="material-icons left light-blue-text text-light-blue">info</i>Sobre
				Nós</a></li>

		<!-- Contato -->
		<li><a href="" class="waves-effect"><i
				class="material-icons left">call</i>Contato</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Pesquisar -->
		<li><div class="center">
				<nav class="brown lighten-2 z-depth-0">
				<div class="nav-wrapper">
					<form action="pesquisar" method="post">
						<div class="input-field">
							<input id="search" type="search" class="truncate"
								placeholder="O que procura?" required> <label
								class="label-icon" for="search"><i
								class="material-icons">search</i></label> <i class="material-icons">close</i>
						</div>
					</form>
				</div>
				</nav>
			</div></li>
	</ul>

	<!-- Dropdown Login -->
	<ul id="dropdown-login" class="dropdown-content">
		<!-- Entrar -->
		<li><a href="#modal-login"><i
				class="material-icons left blue-text text-green">person</i>Entrar</a></li>

		<!-- Registre-se -->
		<li><a href="formularioCliente"><i
				class="material-icons left green-text text-green">person_add</i>Registre-se
				já!</a></li>

		<!-- Divider -->
		<li class="divider"></li>

		<!-- Esqueceu a Senha -->
		<li><a href="" class="red-text text-lighten-2"><i
				class="material-icons left red-text text-red">priority_high</i>Esqueceu
				a senha?</a></li>
	</ul>

	<!-- Dropdown Empresa -->
	<ul id="dropdown-empresa" class="dropdown-content">
		<!-- Loja -->
		<li><a href=""><i
				class="material-icons left deep-orange-text text-deep-orange">call</i>Loja</a></li>

		<!-- Agenda -->
		<li><a href="#"><i
				class="material-icons left cyan-text text-cyan">event_note</i>Agenda</a></li>

		<!-- Divider -->
		<li class="divider"></li>

		<!-- Sobre -->
		<li><a href=""><i
				class="material-icons left light-blue-text text-light-blue">info</i>Sobre</a></li>

		<!-- Contato -->
		<li><a href=""><i class="material-icons left">call</i>Contato</a></li>
	</ul>

	<!-- Modal Login -->
	<div id="modal-login" class="modal">
		<!-- Modal main -->
		<div class="modal-content">
			<!-- Container -->
			<div class="container">
				<!-- Row -->
				<!-- Bem-vindo e Título -->
				<div class="row">
					<!-- Botão fechar modal -->
					<a href="#"
						class="right modal-action modal-close waves-effect waves-brown"><i
						class="material-icons grey-text text-grey ">close</i></a>
				</div>

				<!-- Form -->
				<form action="logar" method="post">
					<!-- Row -->
					<div class="row">
						<!-- Col -->
						<!-- Email -->
						<div class="input-field col s12 m12 l12">
							<input id="email" type="email" class="validate" required>
							<label data-error="Email inválido" data-success="Email válido"
								for="email">Email</label>
						</div>
					</div>

					<!-- Row -->
					<!-- Col -->
					<!-- Senha -->
					<div class="row ">
						<div class="input-field col s12 m12 l12">
							<input id="password" type="password" class="validate" required>
							<label for="password">Senha</label>
						</div>
					</div>

					<!-- Row -->
					<!-- Col -->
					<!-- Botão entrar -->
					<div class="row">
						<div class="center col s12 m12 l12">
							<a class="waves-effect waves-light btn brown lighten-2 truncate"><i
								class="material-icons right">call_made</i>Entrar</a>
						</div>
					</div>

					<!-- Row -->
					<!-- Col -->
					<!-- Registrar -->
					<div class="row">
						<div class="col s12 m12 l12">
							<p style="font-size: 12px;" class="center-align">
								Não possui uma conta? <a href="formularioCliente"
									class="brown-text text-brown"><b>Registre-se já</b></a>, ou
								continue com
							</p>
						</div>
					</div>

					<!-- Row -->
					<div class="row">
						<!-- Col -->
						<!-- Botão Facebook -->
						<a id="btn-facebook"
							class="col s12 m5 l5 left waves-effect waves-light truncate btn">Facebook</a>

						<!-- Col -->
						<!-- Botão Google -->
						<a id="btn-google"
							class="col s12 m5 l5 right waves-effect waves-light truncate btn">Google</a>
					</div>
					<!-- /.row -->
				</form>
			</div>
			<!-- /.container -->

			<!-- Modal footer -->
			<div class="modal-footer">
				<!-- Footer -->
				<p style="font-size: 10px;" class="center-align">*Você pode se
					cadastrar e se logar através da conta do Facebook ou Google.</p>

				<!-- Divider -->
				<div class="divider"></div>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<!-- SCRIPT para Collapse e Modal -->
	<script>
		// Initialize collapse button
		$(".button-collapse").sideNav();

		// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
		$('.modal').modal();
		$('#modal-login').modal('open');
		$('#modal-login').modal('close');
	</script>
</body>
</html>