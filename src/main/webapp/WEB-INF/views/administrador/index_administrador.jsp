<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Título -->
<title>Big Dog | Área do Administrador</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/index-administrador.css">
</head>
<body>
	<!--  import navbar -->
	<c:import url="../component/navbar.jsp" />

	<!-- Container principal -->
	<div class="container">
		<!-- Row -->
		<!-- Título e descrição -->
		<div class="row">
			<!-- Section -->
			<div class="section">
				<!-- Título -->
				<h5 class="center-align">Área do Administrador</h5>

				<!-- Subtítulo -->
				<p class="center-align grey-text text lighten-2">Consulte,
					Gerencie e Agende com facilidade.</p>

				<!-- Divider -->
				<div class="divider"></div>
			</div>
		</div>

		<!-- Row -->
		<!-- Tab Links -->
		<div class="row">
			<!-- Col -->
			<div class="col s12 m12 l12">
				<!-- Tabs -->
				<ul class="tabs">
					<!-- Dashboarb -->
					<li class="tab col s4 m4 l4"
						onclick="Materialize.fadeInImage('#swipe-dashboard')"><a
						href="#swipe-dashboard" class="active waves-effect"><i
							class="material-icons center blue-text text-blue">trending_up</i>Dashboard</a></li>

					<!-- Gerenciar -->
					<li class="tab col s4 m4 l4"
						onclick="Materialize.fadeInImage('#swipe-gerenciar')"><a
						href="#swipe-gerenciar" class="waves-effect"><i
							class="material-icons center grey-text text-grey">build</i>Gerenciar</a></li>

					<!-- Agenda -->
					<li class="tab col s4 m4 l4"
						onclick="Materialize.fadeInImage('#swipe-agenda')"><a
						href="#swipe-agenda" class="waves-effect"><i
							class="material-icons center cyan-text text-cyan">event_note</i>Agenda</a></li>
				</ul>
			</div>
		</div>

		<!-- Row -->
		<!-- Swipe's -->
		<div class="row">
			<!-- Dashboard -->
			<div id="swipe-dashboard" class="col s12 m12 l12 blue">Dashboard</div>
			<!-- /.swipe-dashboard -->

			<!-- Gerenciar -->
			<div id="swipe-gerenciar" class="col s12 m12 l12">
				<!-- Row -->
				<div class="row">
					<!-- Painel lateral -->
					<div class="col s12 m3 l3 left">
						<!-- Lista de links -->
						<div class="collection with-header">
							<div class="collection-header">
								<h5 class="truncate">
									<i class="material-icons left">build</i>Gerenciar
								</h5>
							</div>

							<!-- Clientes -->
							<a
								onclick="Materialize.fadeInImage('#painel-clientes'); listarClientes();"
								class="collection-item waves-effect">Clientes<i
								class="material-icons grey-text text-grey secondary-content">people</i></a>

							<!-- Loja -->
							<a onclick="listarProdutos();" class="collection-item">Loja<i
								class="material-icons grey-text text-grey secondary-content">store</i></a>

							<!-- Agenda -->
							<a href="#" onclick="listarAgendamentos();"
								class="collection-item">Agenda<i
								class="material-icons grey-text text-grey secondary-content">event_note</i></a>
						</div>
					</div>

					<!-- Painel principal -->
					<!-- Lista de Clientes -->
					<div id="painel-clientes" class="col s12 m9 l9 cyan">
						<!-- Tabela de clientes -->
						<table id="tbl-clientes" class="responsive-table highlight">
						</table>
					</div>

					<!-- Lista de Produtos -->
					<div id="painel-produtos" class="col s12 m9 l9 red"
						style="display: none;">Lista de Produtos</div>

					<!-- Lista de Agendamentos -->
					<div id="painel-agendamentos" class="col s12 m9 l9 blue"
						style="display: none">Lista de Agendamentos</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.swipe-gerenciar -->

			<!-- Agenda -->
			<div id="swipe-agenda" class="col s12 m12 l12 hide">Agenda</div>
			<!-- /.swipe-agenda -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Imports JS -->
	<!-- AJAX dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/ajax-administrador.js"></script>

	<!-- JS dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador.js"></script>
</body>
</html>