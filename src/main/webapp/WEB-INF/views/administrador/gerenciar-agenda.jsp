<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Import -->
<%@ page import="br.com.bigdog.value.TipoServico"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- �cone da aba -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/dedicated/img/administrador/adm-icon.ico">

<!-- T�tulo -->
<title>Administrador | Gerenciar Agenda</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-agenda/gerenciar-agenda.css">
</head>
<body>
	<!-- import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- main - container principal -->
	<main class="container"> <!-- Descri��o -->
	<div class="row">
		<!-- Section -->
		<div class="section">
			<!-- T�tulo -->
			<h5 class="left-align">Gerenciar Agendamentos</h5>

			<!-- Subt�tulo -->
			<p class="left-align grey-text text lighten-1">Gerencie
				agendamentos realizados.</p>

			<!-- divider -->
			<div class="divider"></div>
		</div>
	</div>

	<!-- Barra de pesquisa -->
	<div class="row">
		<!-- Barra de Pesquisa -->
		<nav class="cyan hoverable">
		<div class="nav-wrapper">
			<form>
				<div class="input-field">
					<input id="search-agendamento" type="search" class="truncate"
						data-list="#lista-agendamento" onkeyup="buscar(this.id)"
						placeholder="Data, Cliente, Pet ou Servi�o"> <label
						class="label-icon" for="search-agendamento"><i
						class="material-icons">search</i></label> <i class="material-icons">close</i>
				</div>
			</form>
		</div>
		</nav>
	</div>

	<!-- Conte�do main -->
	<div class="row">
		<!-- Lista de agendamentos -->
		<ul id="lista-agendamento" class="collection">
			<!-- Foreach -->
			<c:forEach items="${agendamentos }" var="agendamento">
				<li class="collection-item avatar">
					<h5>
						<img
							src="${agendamento.servico.tipoServico == TipoServico.Veterinario ? 'resources/dedicated/img/administrador/gerenciar/icone-servico-veterinario.png': 'resources/dedicated/img/administrador/gerenciar/icone-servico-estetica.png'}"
							title="${agendamento.servico.tipoServico }"
							alt="${agendamento.servico.tipoServico }" class="circle"> <a
							href="#modal-agendamento"
							onclick="abrirModalAgendamento('${agendamento.idAgendamento }')"
							class="secondary-content"><i
							class="material-icons right red-text">zoom_in</i></a> <b>Data</b> :
						<fmt:formatDate pattern="dd/MM/yyyy"
							value="${agendamento.dataAgendada }" />
					</h5> <span><b>Cliente</b> : ${agendamento.cliente.nome }</span><br>
					<span><b>Pet</b> : ${agendamento.pet.nome }</span><br> <span><b>Servi�o</b>
						: ${agendamento.servico.nome}</span>
				</li>
			</c:forEach>
		</ul>
	</div>
	</main>

	<!-- Modal para informa��es do agendamento -->
	<div id="modal-agendamento" class="modal modal-fixed-footer">
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

				<!-- Descri��o -->
				<div class="row">
					<h5 align="center">Informa��es do Agendamento</h5>
				</div>

				<!-- Informa��es -->
				<!-- Informa��es do Cliente -->
				<div class="row">
					<div class="col s12 m12 l12">
						<!-- ID -->
						<input id="idAgendamento-selecionado" type="hidden">

						<h6>
							<b>Informa��es do Cliente</b>
						</h6>

						<!-- divider -->
						<div class="divider"></div>
					</div>

					<div class="col s12 m12 l12 truncate">
						<h6>
							<b>Nome do Cliente</b>
						</h6>

						<p id="agendamento-cliente-nome"></p>
					</div>

					<div class="col s12 m4 l4 truncate">
						<h6>
							<b>CPF</b>
						</h6>

						<p id="agendamento-cliente-cpf"></p>
					</div>

					<div class="col s12 m4 l4 truncate">
						<h6>
							<b>Telefone</b>
						</h6>

						<p id="agendamento-cliente-telefone"></p>
					</div>

					<div class="col s12 m4 l4 truncate">
						<h6>
							<b>Celular</b>
						</h6>

						<p id="agendamento-cliente-celular"></p>
					</div>

					<div class="col s12 m12 l12 truncate">
						<h6>
							<b>Email de contato</b>
						</h6>

						<p id="agendamento-cliente-email"></p>
					</div>

					<div class="col s12 m6 l6 truncate">
						<h6>
							<b>Nome do Pet</b>
						</h6>

						<p id="agendamento-pet-nome"></p>
					</div>

					<div class="col s12 m6 l6 truncate">
						<h6>
							<b>Sexo</b>
						</h6>

						<p id="agendamento-pet-sexo"></p>
					</div>
				</div>

				<!-- Informa��es do Agendamento -->
				<div class="row">
					<div class="col s12 m12 l12">
						<h6>
							<b>Informa��es de Agendamento e Servi�o</b>
						</h6>

						<!-- divider -->
						<div class="divider"></div>
					</div>

					<div class="col s12 m6 l6 truncate">
						<h6>
							<b>Data Agendada</b>
						</h6>

						<p id="agendamento-dataAgendada"></p>
					</div>

					<div class="col s12 m6 l6 truncate">
						<h6>
							<b>Hor�rio Agendado</b>
						</h6>

						<p id="agendamento-horarioAgendado">14:30</p>
					</div>

					<div class="col s12 m12 l12 truncate">
						<h6>
							<b>Servi�o</b>
						</h6>

						<p id="agendamento-servico-nome"></p>
					</div>

					<div class="col s12 m4 l4 truncate">
						<h6>
							<b>Tipo de Servi�o</b>
						</h6>

						<p id="agendamento-servico-tipoServico"></p>
					</div>

					<div class="col s12 m4 l4 truncate">
						<h6>
							<b>Tempo Estimado</b>
						</h6>

						<p id="agendamento-servico-tempoEstimado"></p>
					</div>

					<div class="col s12 m4 l4 truncate">
						<h6>
							<b>Valor</b>
						</h6>

						<p id="agendamento-servico-valor"></p>
					</div>

					<div class="col s12 m12 l12 truncate">
						<h6>
							<b>Observa��es</b>
						</h6>

						<p id="agendamento-servico-observacoes"></p>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal footer -->
		<div class="modal-footer">
			<!-- Bot�o para excluir agendamento -->
			<button id="btn-excluir-agendamento"
				class="btn-flat waves-effect waves-red left">
				<i class="material-icons left red-text">delete</i> Excluir
				Agendamento
			</button>
		</div>
	</div>

	<!-- import footer -->
	<c:import url="component/footer.jsp" />

	<!-- Script's dedicado -->
	<!-- JS dedicado para gerenciamento de agenda -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-agenda/gerenciar-agenda.js"
		charset="utf-8" defer></script>
</body>
</html>