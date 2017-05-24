<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<title>Big Dog - Bem Vindo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">
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
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/materializeModificado.min.css">
<script type="text/javascript" src="resources/loja/js/menu.js"></script>

<main>
<body>
	<c:import url="component/headerLoja.jsp"></c:import>

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
				<li><a href="listPedidos"><i class="fa fa-shopping-cart"
						aria-hidden="true"></i> Pedidos</a></li>
				<li class="id"><a href="listAgendamentos"><i
						class="fa fa-calendar" aria-hidden="true"></i> Agendamentos</a></li>
				<li><a href="logout"><i class="fa fa-sign-in"
						aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<div class="cx03">
			<i class="fa fa-calendar" aria-hidden="true"></i> Agendamentos
		</div>

		<h3 class="hh3">Lista de Agendamentos</h3>
		<div class="demo">
			<div id="demo">
				<div class="table-responsive-vertical shadow-z-1">
					<table id="table" class="table table-hover table-mc-light-blue">
						<thead>
							<tr>
								<th>Pet</th>
								<th>Data</th>
								<th>Hora</th>
								<th>Tipo de Serviço</th>
								<th>Observação</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td data-title="Pet">Bill Gates</td>
								<td data-title="Data">10/04/1998</td>
								<td data-title="Hora">24:00</td>
								<td>Banho e Tosa</td>
								<td data-title="Observacao"><i class="fa fa-file-pdf-o"
									aria-hidden="true"
									style="color: #770505; cursor: pointer; margin-left: 2em;"
									title="Gerar PDF"></i></td>
							</tr>
							<tr>
								<td data-title="Nome">Dalila</td>
								<td data-title="Data">10/04/1999</td>
								<td data-title="Hora">12:00</td>
								<td>Banho e Tosa</td>
								<td data-title="Observacao"><i class="fa fa-file-pdf-o"
									aria-hidden="true"
									style="color: #770505; cursor: pointer; margin-left: 2em;"
									title="Gerar PDF"></i></td>
							</tr>

						</tbody>
					</table>
				</div>
				<a href="novo-agendamento"><button class="btPet"
						style="width: auto;">
						<i class="fa fa-calendar" style="padding: 0.5em;"
							aria-hidden="true"></i> Novo Agendamento
					</button></a>

			</div>
		</div>
		<br>
	</div>
</main>
<c:import url="component/footerLoja.jsp"></c:import>


<script src="resources/loja/js/jquery.min.js"></script>
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
