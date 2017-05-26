<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Logo da aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Import CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/login.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/materializeModificado.min.css">

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
</head>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<main>
	<div class="cxAvatar">
		<img src="resources/loja/imagens/icones/avatarMasc.png" class="avatar">
		<div class="cx08">
			<h2>Cliente da Silva</h2>
		</div>
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Menu
		</div>
		<div class="cx05">
			<ul id="ul">
				<li id="pf"><a href="indexCliente"><i class="fa fa-home"
						aria-hidden="true"></i> Inicio</a></li>
				<li id="pf"><a href="formPerfil"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
				<li><a href="listPets"><img
						src="resources/loja/imagens/icones/icon-09.png"> Meus Pets</a></li>
				<li><a href="listPedidos"><i class="fa fa-shopping-cart"
						aria-hidden="true"></i> Pedidos</a></li>
				<li class="id"><a href="listAgendamentos"><i
						class="fa fa-calendar" aria-hidden="true"></i> Agendamentos</a></li>
				<li><a href="login"><i class="fa fa-sign-in"
						aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<div class="cx03">
			<i class="fa fa-calendar" aria-hidden="true"></i> Novo Agendamento
		</div>
		<form id="form" class="form">
			<div class="input-field col s12" id="input-f">
				<label class="active" for="f1" style="margin-left: -1em;">Tipo
					de Serviço</label> <select>
					<option>Clinica</option>
					<option>Banho e tosa</option>
				</select>
			</div>

			<div class="input-field col s12" id="input-f">
				<label class="active" for="f1" style="margin-left: -1em;">Serviço
					a ser realizado</label> <select>
					<option>Cirurgia</option>
					<option>Banho e tosa</option>
				</select>
			</div>

			<div class="input-field col s12" id="input-f">
				<label class="active" for="first_name2" style="margin-left: -1em;">Data
					Marcada</label> <select>
					<option>20/04/1998</option>
					<option>20/04/1998</option>
				</select>
			</div>

			<div class="input-field col s12" id="input-f">
				<label class="active" for="first_name2" style="margin-left: -1em;">Horário</label>
				<select>
					<option>20:20</option>
					<option>21:00</option>
				</select>
			</div>


			<div class="row">
				<div class="input-field col s6">
					<input id="f02" type="text" class=""> <label class="active"
						for="f02">Tempo Estimado</label>
				</div>
			</div>
			<div class="divp">
				<div class="input-field col s12" id="input-f asd">
					<label class="active" for="f3" style="margin-left: -1em;">Pet</label>
					<select>
						<option>Dalila</option>
						<option>Bill Gates</option>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="f04" type="text" class=""> <label class="active"
						for="f04">Valor do Serviço</label>
				</div>
			</div>
			<a href="#">
				<button type="button" class="buttonn buttonBlue">
					Agendar
					<div class="ripples buttonRipples">
						<span class="ripplesCircle"></span>
					</div>
				</button>
			</a>
		</form>
	</div>
	</main>

	<!-- Import footer -->
	<c:import url="component/footerLoja.jsp"></c:import>

	<!-- Import JS -->
	<script type="text/javascript"
		src="resources/jquery/jquery-2.2.2.min.js" /></script>
	<script type="text/javascript"
		src="resources/loja/js/materialize.min.js"></script>

	<!-- Script's -->
	<script type="text/javascript">
		$(".button-collapse").sideNav();
		$(document).ready(function() {
			Materialize.updateTextFields();
		});

		$(document).ready(function() {
			$('select').material_select();
		});
	</script>
	<script>
		$(".menuu").click(function() {

			$("#ul").toggle();
		});
	</script>
	<script>
		$(document).ready(function() {
			$('.menu-anchor').on('click touchstart', function(e) {
				$('html').toggleClass('menu-active');
				e.preventDefault();
			});
		})
	</script>
</body>
</html>
