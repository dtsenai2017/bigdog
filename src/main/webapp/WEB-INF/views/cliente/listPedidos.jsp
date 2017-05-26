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
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/table.css">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

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
			<h2>${clienteLogado.nome }</h2>
		</div>
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Menu
		</div>

		<div class="cx05">
			<ul id="ul">
				<li id="pf"><a href="home-user"><i class="fa fa-home"
						aria-hidden="true"></i> Inicio</a></li>
				<li id="pf"><a href="lista-dados"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
				<li><a href="lista-pet"><img
						src="resources/loja/imagens/icones/icon-09.png"> Meus Pets</a></li>
				<li class="id"><a href="listPedidos"><i
						class="fa fa-shopping-cart" aria-hidden="true"></i> Pedidos</a></li>
				<li><a href="listAgendamentos"><i class="fa fa-calendar"
						aria-hidden="true"></i> Agendamentos</a></li>
				<li><a href="logout"><i class="fa fa-sign-in"
						aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>

		<div class="cx03">
			<i class="fa fa-shopping-cart" aria-hidden="true"></i> Pedidos
		</div>
		<div class="pds">
			<div class="demo">
				<div id="demo">
					<div class="input-field col s12" id="input-f">
						<label class="active" for="first_name2"
							style="color: black; font-size: 15px;">Pedidos</label> <select>
							<option value="3">Ultimos 3 meses</option>
							<option value="6">Ultimos 6 meses</option>
							<option value="12">Ultimos 12 meses</option>
						</select>
					</div>

					<div class="table-responsive-vertical shadow-z-1">
						<table id="table" class="table table-hover table-mc-light-blue">
							<thead>
								<tr>
									<th>Foto</th>
									<th>Produto</th>
									<th>Quantidade</th>
									<th>Preço</th>
									<th>Data da Compra</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td data-title="Foto"><img class="imgdg"
										src="resources/loja/imagens/semFoto.png"></td>
									<td data-title="Produto">Doge Mal</td>
									<td data-title="Quantidade">10</td>
									<td data-title="Preço">R$ 6,66</td>
									<td data-title="Data da Compra">20/04/1998</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td data-title="Foto"><img class="imgdg"
										src="resources/loja/imagens/semFoto.png"></td>
									<td data-title="Produto">Ração de Doge</td>
									<td data-title="Quantidade">2</td>
									<td data-title="Preço">R$ 6,66</td>
									<td data-title="Data da Compra">20/04/1998</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Import footer -->
	<c:import url="component/footerLoja.jsp"></c:import>

	<!-- Import JS -->
	<script type="text/javascript"
		src="resources/jquery/jquery-2.2.2.min.js" /></script>
	<script type="text/javascript"
		src="resources/loja/js/materialize.min.js"></script>

	<!-- Scripts -->
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
