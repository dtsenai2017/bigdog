<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
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
<main>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>
	<div class="cxAvatar">
		<!-- Ícone -->
		<img
			src="resources/loja/imagens/icones/${clienteLogado.genero == 'Masculino' ? 'man-icon':'female-icon' }.png"
			class="avatar" title="${clienteLogado.nome }">

		<!-- Nome do cliente -->
		<div class="cx08">
			<h2>${clienteLogado.nome }</h2>
		</div>

		<!-- Menu -->
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Menu
		</div>

		<!-- Link de menu -->
		<div class="cx05">
			<ul id="ul">
				<li id="pf"><a href="home-user"><i class="fa fa-home"
						aria-hidden="true"></i> Inicio</a></li>
				<li id="pf"><a href="lista-dados"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
				<li><a href="lista-pet"><img
						src="resources/loja/imagens/icones/icon-09.png">Meus Pets</a></li>
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
		<h3 class="hh3">Pedidos</h3>

		<div class="pds">
			<div class="demo">
				<div id="demo">
					<div class="table-responsive-vertical shadow-z-1">
						<table id="table" class="table table-hover table-mc-light-blue">
							<thead>
								<tr>
									<th>Produto</th>
									<th>Qtd.</th>
									<th>Preço</th>
									<th>Data</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listarPedidos}" var="compra">
									<c:forEach items="${compra.itensCompra}" var="itensCompra">
										<tr>
											<td data-title="Produto">${itensCompra.nome }</td>
											<td data-title="Quantidade">${itensCompra.quantidade }</td>
											<td data-title="Preço"><f:formatNumber type="currency"
													value="${itensCompra.valor }"></f:formatNumber></td>
											<td data-title="Data da Compra"><f:formatDate
													pattern="dd/MM/yyyy" value="${compra.dataCompra }"></f:formatDate></td>
											<td data-title="Status">${compra.status }</td>
										</tr>
									</c:forEach>
								</c:forEach>
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
