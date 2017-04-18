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

<!-- Import's JS -->
<!-- JQuery -->
<script src="resources/jquery/jquery-3.2.1.js" defer></script>

<!-- JQuery HideSeek min -->
<script type="text/javascript"
	src="resources/jquery/jquery.hideseek.min.js" defer></script>

<!-- Materialize JS min. -->
<script type="text/javascript"
	src="resources/materialize/js/materialize.min.js" defer></script>
</head>
<body>
	<!-- Navbar -->
	<header> <nav class="brown lighten-1 z-depth-0">
	<div class="container nav-wrapper">
		<div class="row">
			<!-- Logo -->
			<div class="col m3 l3">
				<a href="#" class="brand-logo waves-effect"><b><span
						style="font-size: 40px;">Bigdog</span></b></a> <a href=""
					data-activates="menu-mobile" class="button-collapse"><i
					class="material-icons">menu</i></a>
			</div>

			<!-- Pesquisar -->
			<div class="center col m4 hide-on-med-and-down">
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

			<!-- Links -->
			<div class="right col m5 l5">
				<ul id="nav-mobile" class="right hide-on-med-and-down">
					<!-- In�cio -->
					<li class="waves-effect"><a href="index"><i
							class="material-icons center">home</i></a></li>

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
		</div>
		<!-- /.row -->
	</div>
	<!-- /.nav-wrapper --></nav> <!-- Sidenav mobile -->
	<ul id="menu-mobile" class="side-nav">
		<!-- In�cio -->
		<li><a href="" class="waves-effect"><i
				class="material-icons left">home</i>In�cio</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Entrar -->
		<li><a href="#modal-login" class="waves-effect"><i
				class="material-icons left blue-text text-blue">person</i>Entrar</a></li>

		<!-- Registre-se -->
		<li><a href="formularioCliente" class="waves-effect"><i
				class="material-icons left green-text text-green">person_add</i>Registre-se
				j�!</a></li>

		<!-- Esqueceu a senha -->
		<li><a href="recuperarSenha"
			class="red-text text-lighten-2 waves-effect"><i
				class="material-icons left red-text text-red ">priority_high</i>Esqueceu
				a senha?</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Loja -->
		<li><a href="indexLoja" class="waves-effect"><i
				class="material-icons left deep-orange-text text-deep-orange">shopping_cart</i>Loja</a></li>

		<!-- Agenda -->
		<li><a href="indexAgenda" class="waves-effect"><i
				class="material-icons left cyan-text text-cyan ">event_note</i>Agenda</a></li>

		<!-- Divider -->
		<li class="container"><div class="divider"></div></li>

		<!-- Sobre N�s -->
		<li><a href="sobreNos" class="waves-effect"><i
				class="material-icons left light-blue-text text-light-blue">info</i>Sobre
				N�s</a></li>

		<!-- Contato -->
		<li><a href="contato" class="waves-effect"><i
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
	<!-- /.side-nav (mobile) --> <!-- Dropdown Login -->
	<ul id="dropdown-login" class="dropdown-content">
		<!-- Entrar -->
		<li><a href="#modal-login"><i
				class="material-icons left blue-text text-green">person</i>Entrar</a></li>

		<!-- Registre-se -->
		<li><a href="formularioCliente"><i
				class="material-icons left green-text text-green">person_add</i>Registre-se
				j�!</a></li>

		<!-- Divider -->
		<li class="divider"></li>

		<!-- Esqueceu a Senha -->
		<li><a href="" class="red-text text-lighten-2"><i
				class="material-icons left red-text text-red">priority_high</i>Esqueceu
				a senha?</a></li>
	</ul>
	<!-- /.dropdown-content --> <!-- Dropdown Empresa -->
	<ul id="dropdown-empresa" class="dropdown-content">
		<!-- Loja -->
		<li><a href="indexLoja"><i
				class="material-icons left deep-orange-text text-deep-orange">shopping_cart</i>Loja</a></li>

		<!-- Agenda -->
		<li><a href="indexAgenda"><i
				class="material-icons left cyan-text text-cyan">event_note</i>Agenda</a></li>

		<!-- Divider -->
		<li class="divider"></li>

		<!-- Sobre -->
		<li><a href="sobreNos"><i
				class="material-icons left light-blue-text text-light-blue">info</i>Sobre</a></li>

		<!-- Contato -->
		<li><a href="contato"><i class="material-icons left">call</i>Contato</a></li>
	</ul>
	<!-- /.dropdown-content --> <!-- Modal Login -->
	<div id="modal-login" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="container">
				<!-- �cone fechar -->
				<div class="row">
					<!-- Bot�o fechar modal -->
					<a href="#" class="right modal-action modal-close waves-effect"><i
						class="material-icons grey-text text-grey ">close</i></a>
				</div>

				<!-- T�tulo -->
				<div class="row">
					<p class="center-align" style="font-size: 18px;">Login do
						usu�rio</p>
				</div>

				<!-- Formul�rio de login -->
				<form action="login" method="post">
					<!-- Email -->
					<div class="row">
						<div class="input-field col s12 m12 l12">
							<input id="email" type="email" class="validate" required>
							<label data-error="Email inv�lido" data-success="Email v�lido"
								for="email">Email</label>
						</div>
					</div>

					<!-- Senha -->
					<div class="row">
						<div class="input-field col s12 m12 l12">
							<input id="password" type="password" class="validate" required>
							<label for="password">Senha</label>
						</div>
					</div>

					<!-- Bot�o entrar -->
					<div class="row">
						<div class="center col s12 m12 l12">
							<a class="waves-effect waves-light btn brown lighten-2 truncate"><i
								class="material-icons right">call_made</i>Entrar</a>
						</div>
					</div>

					<!-- Registrar -->
					<div class="row">
						<div class="col s12 m12 l12">
							<p style="font-size: 12px;" class="center-align">
								N�o possui uma conta? <a href="formularioCliente"
									class="brown-text text-lighten-3"><b>Registre-se j�</b></a>, ou
								continue com
							</p>
						</div>
					</div>

					<!-- Bot�es de login com facebook e google -->
					<div class="row">
						<!-- Bot�o Facebook -->
						<a id="btn-facebook"
							class="col s12 m5 l5 left waves-effect waves-light truncate btn">Facebook</a>

						<!-- Espa�ador para mobile -->
						<div id="espacador-btn" class="col s12 hide-on-med-and-up"></div>

						<!-- Bot�o Google -->
						<a id="btn-google"
							class="col s12 m5 l5 right waves-effect waves-light truncate btn">Google</a>
					</div>
				</form>
				<!-- /.form -->
			</div>
			<!-- /.container -->

			<!-- Modal footer -->
			<div class="modal-footer">
				<div class="container">
					<div class="row">
						<div class="col s12 m12 l12">
							<div class="section">
								<!-- Recuperar a senha -->
								<p class="center" style="font-size: 12px;">
									<a href="">Esqueceu a senha?</a> | <a href=""
										class="black-text text-black">Sobre n�s</a>
								</p>

								<!-- Divider -->
								<div class="divider"></div>

								<!-- Descri��o de login com facebook ou google -->
								<p style="font-size: 8px;" class="center-align">� 2017,
									PETSHOP BIGDOG. TODOS OS DIREITOS RESERVADOS.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal --> </header>

	<!-- Script's dedicado -->
	<!-- JS dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/util/navbar.js" defer></script>

	<!-- JS para busca -->
	<script type="text/javascript"
		src="resources/dedicated/js/util/buscar.js" defer></script>
</body>
</html>