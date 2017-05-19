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
	href="resources/dedicated/css/administrador/gerenciar-cliente/gerenciar-cliente.css">
</head>
<body>
	<!--  import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- main - container principal -->
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
			<nav class="deep-purple darken-1 hoverable">
			<div class="nav-wrapper">
				<form>
					<div class="input-field">
						<input id="search-cliente" type="search" class="truncate"
							data-list="#lista-clientes" onkeyup="buscar(this.id)"
							placeholder="Nome, CPF, Email ou Celular."> <label
							class="label-icon" for="search-cliente"><i
							class="material-icons">search</i></label> <i class="material-icons">close</i>
					</div>
				</form>
			</div>
			</nav>
		</div>

		<!-- Lista de clientes -->
		<div class="row">
			<!-- Lista de cliente -->
			<div>
				<ul id="lista-clientes" class="collection"
					data-collapsible="accordion">
					<!-- Foreach -->
					<c:forEach items="${clientes }" var="cliente">
						<!-- Linha do cliente -->
						<li class="collection-item avatar"><img
							title="${cliente.nome }"
							src="${cliente.genero == Genero.Masculino ? 'resources/dedicated/img/cliente/genero_masculino.png' : 'resources/dedicated/img/cliente/genero_feminino.png' }"
							class="circle"> <span class="title truncate"><b>${cliente.nome }</b></span>
							<p class="truncate">${cliente.cpf }<br>${cliente.email }
								<br> ${cliente.contato.celular }
							</p> <a onclick="buscarCliente(${cliente.idCliente})"
							href="#modal-cliente-info" class="secondary-content"><i
								class="material-icons red-text text-lighten-2">zoom_in</i></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<!-- Modal Cliente Informa��es -->
		<div class="row">
			<div id="modal-cliente-info" class="modal modal-fixed-footer">
				<!-- Modal content -->
				<div class="modal-content">
					<!-- Container -->
					<div class="container">
						<!-- Bot�o fechar -->
						<div class="row">
							<div class="col s12 m12 l12">
								<a class="modal-action modal-close right"><i
									class="material-icons grey-text">close</i></a>
							</div>
						</div>

						<!-- ID e Nome do cliente -->
						<input id="idCliente-selecionado" type="hidden">

						<!-- Lista de dados(Endere�o, Pets, Compras e Agendamentos realizados -->
						<div class="col s12 m12 l12">
							<!-- Lista de dados -->
							<ul class="collapsible hoverable" data-collapsible="accordion">
								<!-- Cliente -->
								<li>
									<div class="collapsible-header">
										<i class="material-icons blue-text text-blue">person_pin</i>Dados
										do cliente
									</div>
									<div id="dados-cliente"
										class="collapsible-body white-text text-white"></div>
								</li>

								<!-- Endere�os -->
								<li>
									<div class="collapsible-header">
										<i class="material-icons deep-orange-text text-lighten-2">room</i>Endere�os
									</div>
									<div id="lista-endereco"
										class="collapsible-body deep-orange lighten-1 white-text text-white"></div>
								</li>

								<!-- Pets -->
								<li>
									<div class="collapsible-header">
										<i class="material-icons green-text text-green">pets</i>Pets
									</div>
									<div id="lista-pet"
										class="collapsible-body green lighten-1 white-text text-white"></div>
								</li>

								<!-- Compras -->
								<li>
									<div class="collapsible-header">
										<i class="material-icons red-text text-red">shopping_cart</i>Compras
									</div>
									<div id="lista-compra"
										class="collapsible-body red lighten-1 white-text text-white"></div>
								</li>

								<!-- Agendamentos -->
								<li>
									<div class="collapsible-header">
										<i class="material-icons cyan-text text-cyan ">event</i>Agendamentos
									</div>
									<div id="lista-agendamento"
										class="collapsible-body cyan lighten-1 white-text text-white"></div>
								</li>
							</ul>
						</div>
					</div>
					<!-- /.container -->
				</div>
				<!-- /.modal-content -->

				<!-- Modal footer -->
				<div class="modal-footer">
					<!-- Bot�o para excluir cliente -->
					<button id="btn-excluir-cliente"
						class="btn-flat waves-effect waves-red left">
						<i class="material-icons left red-text">delete</i> Excluir Cliente
					</button>
				</div>
			</div>

			<!-- Modal editar pet -->
			<div id="modal-editar-pet" class="modal">
				<!-- Model content -->
				<div class="modal-content">
					<!-- Container -->
					<div class="container">
						<!-- Bot�o fechar -->
						<div class="row">
							<div class="col s12 m12 l12">
								<a class="modal-action modal-close right"><i
									class="material-icons grey-text">close</i></a>
							</div>
						</div>

						<!-- T�tulo -->
						<h5 class="center-align">Editar</h5>

						<!-- Divider -->
						<div class="divider"></div>

						<!-- Formul�rio de altera��o do pet -->
						<form>
							<!-- ID do pet -->
							<input type="hidden" id="idPet" value="PUT">

							<!-- Castrado ? -->
							<div class="row">
								<div class="col s12 m12 l12 center">
									<!-- Descri��o -->
									<h6>Castrado ?</h6>

									<!-- Switch -->
									<div class="switch">
										<label> N�o <input id="castrado" type="checkbox"
											value="PUT"> <span class="lever"></span> Sim
										</label>
									</div>
								</div>
							</div>

							<!-- Peso -->
							<div class="row">
								<div class="col s12 m12 l12">
									<div class="input-field col s6 m3 l3">
										<input id="peso" type="text" class="validate" value="PUT"
											step="0.01"> <label for="peso" id="labelPeso"
											pattern="[0-9]+(\.[0-9]{0,2})?%?">Peso (kg)</label>
									</div>
								</div>
							</div>

							<!-- Observa��es -->
							<div class="row">
								<div class="col s12 m12 l12">
									<div class="input-field col s12">
										<textarea id="observacoes" class="materialize-textarea"
											value="PUT"></textarea>
										<label for="observacoes" id="labelObservacoes">Observa��es</label>
									</div>
								</div>
							</div>

							<div class="row">
								<!-- Bot�es alterar ou voltar -->
								<a href="#!"
									class="btn waves-effect waves-light green lighten-2 right"
									type="submit" onclick="alterarPet();"><i
									class="material-icons left">mode_edit</i>Alterar</a>
							</div>
						</form>
						<!-- /.form -->
					</div>
					<!-- /.container -->
				</div>

				<!-- Modal footer -->
				<div class="modal-footer"></div>
			</div>
			<!-- /#modal-editar-pet -->

			<!-- Modal para visualizar compra de cliente -->
			<div id="modal-compra-cliente" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<div class="container">
						<!-- Bot�o fechar -->
						<div class="row">
							<div class="col s12 m12 l12">
								<a class="modal-action modal-close right"><i
									class="material-icons grey-text">close</i></a>
							</div>
						</div>

						<!-- T�tulo -->
						<div class="row">
							<!-- T�tulo -->
							<h5 class="center-align">Alterar Status</h5>

							<!-- divider -->
							<div class="divider"></div>
						</div>

						<!-- Alterar status -->
						<div class="row">
							<form id="form-status-compra">
								<div class="input-field col s12 m12 l12">
									<input id="idCompra-selecionada" type="hidden"> <input
										id="status-compra-selecionada" type="text" class="validate"
										required> <label for="status-compra-selecionada"
										id="label-status-compra-selecionada">Status da compra</label>
								</div>

								<div class="col s12 m12 l12">
									<button class="btn waves-effect cyan white-text right">
										<i class="material-icons left">mode_edit</i> Alterar
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer"></div>
			</div>
			<!-- /#modal-compra-cliente -->

		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </main>

	<!-- Script's dedicado -->
	<!-- JS dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-cliente/gerenciar-cliente.js"
		charset="utf-8" defer></script>

	<!-- Mascaras -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador//gerenciar-cliente/mascara-cliente.js"
		charset="utf-8" defer></script>
</body>
</html>