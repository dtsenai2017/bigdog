<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Import -->
<%@ page import="br.com.bigdog.value.Genero"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- T�tulo -->
<title>Administrador | Gerenciar Cliente</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-cliente.css">
</head>
<body>
	<!--  import navbar -->
	<c:import url="../component/navbar.jsp" />

	<!-- Main - container principal -->
	<main>
	<div class="container">
		<!-- Descri��o -->
		<div class="row">
			<!-- Section -->
			<div class="section">
				<!-- T�tulo -->
				<h5 class="left-align">Gerenciar Clientes</h5>

				<!-- Subt�tulo -->
				<p class="left-align grey-text text lighten-1">Pesquise o
					cliente desejado para consultar, alterar ou excluir.</p>

				<!-- Divider -->
				<div class="divider"></div>
			</div>
		</div>

		<!-- Barra de pesquisa -->
		<div class="row">
			<!-- Barra de Pesquisa -->
			<div class="col s12 m12 l12">
				<nav class="red lighten-1 hoverable">
				<div class="nav-wrapper">
					<form>
						<div class="input-field">
							<input id="search-cliente" type="search" class="truncate"
								data-list=".lista-cliente" onkeyup="buscar(this.id)"
								placeholder="Buscar cliente"> <label class="label-icon"
								for="search-cliente"><i class="material-icons">search</i></label>
							<i class="material-icons">close</i>
						</div>
					</form>
				</div>
				</nav>
			</div>
		</div>

		<!-- Lista de clientes -->
		<div class="row">
			<!-- Lista de cliente -->
			<div id="lista-clientes" class="col s12 m12 l12">
				<ul class="collection lista-cliente">
					<!-- Foreach -->
					<c:forEach items="${clientes }" var="cliente">
						<!-- Linha do cliente -->
						<li class="collection-item avatar"><img
							title="${cliente.nome }"
							src="${cliente.genero == Genero.Masculino ? 'resources/dedicated/img/cliente/genero_masculino.png' : 'resources/dedicated/img/cliente/genero_feminino.png' }"
							class="circle"> <span class="title truncate"><b>${cliente.nome }</b></span>
							<p class="truncate">${cliente.email }
								<br> ${cliente.contato.celular }
							</p> <a onclick="buscarCliente(${cliente.idCliente})"
							href="#modal-cliente-info" class="secondary-content"><i
								class="material-icons">visibility</i></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<!-- Modal Cliente Informa��es -->
		<div class="row">
			<div id="modal-cliente-info" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<!-- Nome -->
					<h5></h5>

					<!-- Divider -->
					<div class="divider"></div>

					<!-- Lista de dados(Endere�o, Pets, Compras e Agendamentos realizados -->
					<div class="col s12 m12 l12">
						<ul class="collapsible" data-collapsible="accordion">
							<!-- Endere�os -->
							<li>
								<div class="collapsible-header">
									<i class="material-icons">room</i>Endere�os
								</div>
								<div id="lista-endereco" class="collapsible-body"></div>
							</li>

							<!-- Pets -->
							<li>
								<div class="collapsible-header">
									<i class="material-icons">pets</i>Pets
								</div>
								<div id="lista-pet" class="collapsible-body"></div>
							</li>

							<!-- Compras -->
							<li>
								<div class="collapsible-header">
									<i class="material-icons">shopping_cart</i>Compras
								</div>
								<div id="lista-compra" class="collapsible-body"></div>
							</li>

							<!-- Agendamentos -->
							<li>
								<div class="collapsible-header">
									<i class="material-icons">event</i>Agendamentos
								</div>
								<div id="lista-agendamento" class="collapsible-body"></div>
							</li>
						</ul>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="#!"
						class="modal-action modal-close waves-effect btn-flat rigth">Voltar</a>
				</div>
			</div>

			<!-- Modal editar Cliente -->
			<div id="modal-editar-cliente" class="modal">
				<!-- Model content -->
				<div class="modal-content">
					<!-- T�tulo -->
					<h6>Escolha uma op��o</h6>

					<!-- Divider -->
					<div class="divider"></div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="#!"
						class="modal-action modal-close waves-effect waves-green btn-flat">Voltar</a>
				</div>
			</div>

			<!-- EDITAR CLIENTE -->
			<!-- Modal editar endereco -->
			<div id="modal-editar-endereco" class="modal">
				<!-- Model content -->
				<div class="modal-content">
					<!-- T�tulo -->
					<h6>Editar Endere�o</h6>
					${endereco.logradouro }

					<!-- Divider -->
					<div class="divider"></div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="#!"
						class="modal-action modal-close waves-effect waves-green btn-flat">Voltar</a>
				</div>
			</div>

			<!-- Modal editar pet -->
			<div id="modal-editar-pet" class="modal">
				<!-- Model content -->
				<div class="modal-content">
					<!-- T�tulo -->
					<h6>Editar Pet</h6>

					<!-- Divider -->
					<div class="divider"></div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="#!" class="modal-action modal-close waves-effect btn-flat">Voltar</a>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </main>

	<!--  import footer	 -->
	<c:import url="../component/footer.jsp" />

	<!-- Script's dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-cliente.js"
		charset="utf-8" defer></script>
</body>
</html>