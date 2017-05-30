<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Ícone da aba -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/dedicated/img/administrador/adm-icon.ico">

<!-- Título -->
<title>Big Dog | Index Administrador</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/index-administrador.css">

<!-- Scripts para gráficos -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript">
				function consumir() {
					console.log('entrou');
					var chart = new Array();
					// Envia a chamada ajax para o servidor
					$
							.ajax({
								url : 'adm/produto',
								type : 'GET',
								mediaType : 'JSON',
								success : function(data) {
									var produtos = data;

									Highcharts
											.chart(
													'grafico1',
													{
														chart : {
															type : 'pie',
															options3d : {
																enabled : true,
																alpha : 45
															}
														},
														title : {
															text : 'Produtos Em Estoque'
														},
														subtitle : {
															text : 'DTCommerce'
														},
														plotOptions : {
															pie : {
																innerSize : 100,
																depth : 45
															}
														},
														series : [ {
															name : 'Quantidade em estoque é de: ',
															data :  gerarProdutos(produtos) 
														} ]
													});

									function gerarProdutos(produtos) {
										for (var int = 0; int < produtos.length; int++) {
											chart[int] = [ produtos[int].nome,
												produtos[int].qtdEstoque ]; 
										}
										console.log(chart)
										return chart;
									}

								}

							});
				}
			</script>
</head>
<body>
	<!--  import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- Main - container principal -->
	<main class="container"> <!-- Row --> <!-- Título e descrição -->
	<div class="row">
		<!-- Section -->
		<div class="section">
			<!-- Título -->
			<h5 class="center-align">Consulte, Gerencie e Agende com
				facilidade</h5>

			<!-- Divider -->
			<div class="divider"></div>
		</div>
	</div>

	<!-- Row --> <!-- Tab Links -->
	<div class="row">
		<!-- Col -->
		<div class="col s12 m12 l12">
			<!-- Tabs -->
			<ul class="tabs">
				<!-- Dashboarb -->
				<li class="tab col s4 m4 l4"
					onclick="Materialize.fadeInImage('#swipe-dashboard')"><a
					href="#swipe-dashboard"><i
						class="material-icons center blue-text text-blue">trending_up</i>Dashboard</a></li>

				<!-- Gerenciar -->
				<li class="tab col s4 m4 l4"
					onclick="Materialize.fadeInImage('#swipe-gerenciar')"><a
					href="#swipe-gerenciar"><i
						class="material-icons center grey-text text-grey">settings</i>Gerenciar</a></li>

				<!-- Agenda -->
				<li class="tab col s4 m4 l4"
					onclick="Materialize.fadeInImage('#swipe-agenda')"><a
					id="btn-agenda-hoje" href="#swipe-agenda"><i
						class="material-icons center cyan-text text-cyan">event_note</i>Agenda</a></li>
			</ul>
		</div>
	</div>

	<!-- Row --> <!-- Swipe's -->
	<div class="row">
		<!-- Dashboard -->
		<div id="swipe-dashboard" class="col s12 m12 l12 center">
			<!-- Botão para carregar gráficos -->
			<div class="row">
				<a class="waves-effect btn cyan white-text truncate"
					onclick="consumir()"><i class="material-icons left">trending_up</i>Abrir
					Gráficos</a>
			</div>

			<!-- divider -->
			<div class="divider"></div>

			<!-- Caixa pra gráfico -->
			<div class="row">
				<div id="grafico1" style="height: 400px"></div>
			</div>
		</div>
		<!-- /.swipe-dashboard -->

		<!-- Gerenciar -->
		<div id="swipe-gerenciar" class="col s12 m12 l12">
			<!-- Cliente -->
			<div id="#painel-cliente" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-cliente.png"
									class="responsive-img"> <span class="card-title">Cliente</span>
								<a id="btn-gerenciar-cliente"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">recent_actors</i></a>
							</div>
							<div class="card-content">
								<p class="truncate">Gerencie clientes cadastrados.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Loja -->
			<div id="#painel-loja" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-loja.png"
									class="responsive-img"> <span class="card-title">Loja</span>
								<a id="btn-gerenciar-loja"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">store</i></a>
							</div>
							<div class="card-content">
								<p class="truncate">Gerencie produtos e fornecedores.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Agenda -->
			<div id="#painel-agenda" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-agenda.png"
									class="responsive-img"> <span class="card-title">Agenda</span>
								<a id="btn-gerenciar-agenda"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">event_note</i></a>
							</div>
							<div class="card-content">
								<p class="truncate">Gerencie agendamentos realizados.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Serviço -->
			<div id="#painel-servico" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-servico.png"
									class="responsive-img"> <span class="card-title">Serviço</span>
								<a id="btn-gerenciar-servico"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">pets</i></a>
							</div>
							<div class="card-content">
								<p class="truncate">Gerencie seus serviços.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /.swipe-gerenciar -->

		<!-- Agenda -->
		<div id="swipe-agenda" class="col s12 m12 l12">
			<div class="row">
				<!-- Consultas agendadas -->
				<div class="col s12 m12 l12">
					<!-- Título de swipe -->
					<h5 align="center">Agendamentos de Hoje</h5>

					<!-- divider -->
					<div class="divider"></div>

					<!-- Lista de agendamentos -->
					<ul id="lista-agendamento-hoje" class="collapsible popout"
						data-collapsible="accordion">
					</ul>
				</div>
			</div>
		</div>
	</main>
	<!-- /.container -->

	<!-- import footer -->
	<c:import url="component/footer.jsp" />

	<!-- Script's dedicado -->
	<!-- JS com AJAX dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/index-administrador.js"
		charset="utf-8" defer></script>
</body>
</html>