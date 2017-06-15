<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- �cone da aba -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/dedicated/img/administrador/adm-icon.ico">

<!-- T�tulo -->
<title>Big Dog | Index Administrador</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/index-administrador.css">
</head>
<body>
	<!--  import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- Main - container principal -->
	<main class="container"> <!-- Row --> <!-- T�tulo e descri��o -->
	<div class="row">
		<!-- Section -->
		<div class="section">
			<!-- T�tulo -->
			<h4 class="center-align">�rea do Administrador</h4>

			<!-- Divider -->
			<div class="divider"></div>
		</div>
	</div>

	<!-- Tab Links -->
	<div class="row">
		<div class="col s12 m12 l12">
			<!-- Tabs -->
			<ul class="tabs tabs-fixed-width">
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

	<!-- Swipe's -->
	<div class="row">
		<!-- Dashboard -->
		<div id="swipe-dashboard" class="col s12 m12 l12 center">
			<!-- Bot�o para carregar gr�ficos -->
			<div class="row">
				<a class="waves-effect btn cyan white-text truncate"
					onclick="consumir()"><i class="material-icons left">trending_up</i>Abrir
					Dashboard </a>
			</div>

			<!-- Informa��es gerais e �ltimas atualiza��es (Compra, Agendamento, Cliente, Fornecedor, Servi�o...) -->
			<div id="info-dashboard" class="row">
				<!-- Informa��es gerais -->
				<div class="col s12 m5 l5">
					<!-- Descri��o -->
					<h6 align="center">
						<b>Informa��es Gerais</b>
					</h6>

					<!-- divider -->
					<div class="divider"></div>

					<!-- Descri��o e informa��o -->
					<div class="row">
						<!-- Descri��o -->
						<div class="col s9 m9 l9 left-align">
							<!-- br -->
							<br> <span>Cliente</span>

							<!-- br -->
							<br> <span>Pet</span>

							<!-- br -->
							<br> <span>Endere�o de Cliente</span>

							<!-- br -->
							<br> <span>Fornecedor</span>

							<!-- br -->
							<br> <span>Endere�o de Fornecedor</span>

							<!-- br -->
							<br> <span">Categoria</span>

							<!-- br -->
							<br> <span>Subcategoria</span>

							<!-- br -->
							<br> <span>Produto</span>

							<!-- br -->
							<br> <span>Compra</span>

							<!-- br -->
							<br> <span>Servi�o</span>

							<!-- br -->
							<br> <span>Agendamento</span>
						</div>

						<!-- Informa��es -->
						<div class="col s3 m3 l3 right-align">
							<!-- br -->
							<br> <span id="qtdCliente" class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdPet" class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdEnderecoCliente"
								class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdFornecedor"
								class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdEnderecoFornecedor"
								class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdCategoria" class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdSubCategoria"
								class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdProduto" class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdCompra" class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdServico" class="grey-text text-darken-1"></span>

							<!-- br -->
							<br> <span id="qtdAgendamento"
								class="grey-text text-darken-1"></span>

							<!-- br (Ultilzado para alinhamento da ultima quantidade) -->
							<br>
						</div>
					</div>
				</div>

				<!-- Informa��es sobre �ltimas atualiza��es -->
				<div class="col s12 m7 l7">
					<!-- Descri��o -->
					<h6 align="center">
						<b>�ltimas atividades</b>
					</h6>

					<!-- divider -->
					<div class="divider"></div>

					<!-- Tabs -->
					<div class="row">
						<div class="col s12 m12 l12">
							<ul class="tabs tabs-fixed-width">
								<!-- �ltimos clientes cadastrados (20) -->
								<li class="tab col s6 m6 l6"><a id="tab-ultimos-clientes"
									class="active"
									onclick="Materialize.fadeInImage('#ultimos-clientes')"
									href="#ultimos-clientes">Clientes</a></li>

								<!-- �ltimas compras realizadas (20) -->
								<li class="tab col s6 m6 l6"><a
									onclick="Materialize.fadeInImage('#ultimas-compras')"
									href="#ultimas-compras">Compras</a></li>
							</ul>
						</div>
					</div>

					<!-- Dados de �ltimas atualiza��es -->
					<div class="row">
						<!-- �ltimos clientes -->
						<div id="ultimos-clientes" class="col s12 m12 l12">
							<!-- Lista de clientes -->
							<div id="lista-ultimos-clientes" class="col s12 m12 l12">
								<table id="table-ultimos-clientes" class="highlight">
									<tbody>
									</tbody>
								</table>
							</div>
						</div>

						<!-- �ltimas compras -->
						<div id="ultimas-compras" class="col s12 m12 l12">
							<!-- Lista de clientes -->
							<div id="lista-ultimas-compras" class="col s12 m12 l12">
								<table id="table-ultimas-compras" class="highlight">
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Gr�fico para tipo de servi�o -->
			<div class="row">
				<!-- divider -->
				<div class="divider"></div>

				<!-- Tipo de servi�os agendados -->
				<div class="col s12 m6 l6">
					<div id="grafico-compras-mes"
						style="min-width: 90%; height: 420px; max-width: 100%; margin: 0 auto"></div>
				</div>

				<!-- Compras efetuadas nos meses -->
				<div class="col s12 m6 l6">
					<div id="grafico-tipo-servico"
						style="min-width: 90%; height: 420px; max-width: 100%; margin: 0 auto"></div>
				</div>
			</div>
		</div>
		<!-- /.swipe-dashboard -->

		<!-- Gerenciar -->
		<div id="swipe-gerenciar" class="col s12 m12 l12">

			<!-- Descri��o de gerenciamento -->
			<h6 align="center">Selecione uma op��o</h6>

			<!-- divider -->
			<div class="divider"></div>

			<!-- br -->
			<br>

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
							<div class="card-content center">
								<!-- divider e br -->
								<br>
								<div class="divider"></div>

								<h6 class="red-text text-lighten-2">Consulte clientes.</h6>
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
							<div class="card-content center">
								<!-- divider e br -->
								<br>
								<div class="divider"></div>

								<h6 class="red-text text-lighten-2">Gerencie a loja.</h6>
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
							<div class="card-content center">
								<!-- divider e br -->
								<br>
								<div class="divider"></div>

								<h6 class="red-text text-lighten-2">Gerencie agenda.</h6>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Servi�o -->
			<div id="#painel-servico" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-servico.png"
									class="responsive-img"> <span class="card-title">Servi�o</span>
								<a id="btn-gerenciar-servico"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">pets</i></a>
							</div>
							<div class="card-content center">
								<!-- divider e br -->
								<br>
								<div class="divider"></div>

								<h6 class="red-text text-lighten-2">Gerencie servi�os.</h6>
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
				<!-- Descri��o para agendamentos de hoje -->
				<h6 align="center">Agendamentos de hoje</h6>



				<!-- divider -->
				<div class="divider"></div>

				<!-- Quantidade de agendamentos do dia -->
				<p id="qtd-agendamentos-hoje" align="right" style="font-size: 12px;"></p>

				<!-- br -->
				<br>

				<!-- Lista de agendamentos -->
				<div id="lista-agendamentos-hoje"></div>
			</div>
		</div>
	</div>
	</main>
	<!-- /.container -->

	<!-- import footer -->
	<c:import url="component/footer.jsp" />

	<!-- Script's dedicado -->
	<!-- JS dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/index/index-administrador.js"
		charset="utf-8" defer></script>

	<!-- JS para Dashboard -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/dashboard/dashboard.js"
		charset="utf-8" defer></script>

	<!-- JS for fixed bug in tabs on Materialize -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/index/index-tabs.js"
		charset="utf-8" defer></script>

	<!-- Scripts para gr�ficos -->
	<script src="resources/highcharts/highcharts.js" charset="utf-8" defer></script>
	<script src="resources/highcharts/exporting.js" charset="utf-8" defer></script>
</body>
</html>