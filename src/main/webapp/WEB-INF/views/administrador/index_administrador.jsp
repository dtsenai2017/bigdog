<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Título -->
<title>Big Dog | Index Administrador</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/administrador.css">
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
					href="#swipe-agenda"><i
						class="material-icons center cyan-text text-cyan">event_note</i>Agenda</a></li>
			</ul>
		</div>
	</div>

	<!-- Row --> <!-- Swipe's -->
	<div class="row">
		<!-- Dashboard -->
		<div id="swipe-dashboard" class="col s12 m12 l12">Dashboard aquii</div>
		<!-- /.swipe-dashboard -->

		<!-- Gerenciar -->
		<div id="swipe-gerenciar" class="col s12 m12 l12">
			<!-- Cliente -->
			<div id="#painel-cliente" class="col s6 m4 l4">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar-cliente.png"
									class="responsive-img"> <span class="card-title">Cliente</span>
								<a href="gerenciarCliente"
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
			<div id="#painel-loja" class="col s6 m4 l4">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar-loja.png"
									class="responsive-img"> <span class="card-title">Loja</span>
								<a href="gerenciarLoja"
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
			<div id="#painel-agenda" class="col s6 m4 l4">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar-agenda.png"
									class="responsive-img"> <span class="card-title">Agenda</span>
								<a href="gerenciarAgenda"
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

		</div>
		<!-- /.swipe-gerenciar -->

		<!-- Agenda -->
		<div id="swipe-agenda" class="col s12 m12 l12 red">Agenda</div>
		<!-- /.swipe-agenda -->
	</div>
	<!-- /.row --> <!-- /.container --> </main>

	<!-- Script's dedicado -->
	<!-- JS com AJAX dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/administrador.js" defer></script>
</body>
</html>