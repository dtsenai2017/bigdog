<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- T�tulo -->
<title>Administrador | Gerenciar Servi�os</title>

<!-- CSS dedicado para gerenciamento de servi�o -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-servico/gerenciar-servico.css">

<!-- CSS Time picker materialize-->
<link rel="stylesheet"
	href="resources/materialize/css/materialize-clockpicker.css"
	media="screen,projection">
</head>
<body>

	<!--  import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- main - container principal -->
	<main class="container"> <!-- Descri��o -->
	<div class="row">
		<div class="col s12 m12 l12">
			<!-- Section -->
			<div class="section">
				<!-- T�tulo -->
				<h5 class="left-align">Gerenciar Servi�o</h5>

				<!-- Subt�tulo -->
				<p class="left-align grey-text text lighten-1">Gerencie seus
					servi�os.</p>

				<!-- divider -->
				<div class="divider"></div>
			</div>
		</div>
	</div>

	<!-- Conte�do main -->
	<div class="row">
		<!-- Bot�o de adicionar novo servi�o -->
		<div class="col s12 m2 l2 center">
			<div class="row">
				<a href="#modal-servico" class="waves-effect waves-light btn green"><i
					class="material-icons center">add</i></a>
			</div>
		</div>

		<!-- T�tulo de lista de servi�os -->
		<div class="col s12 m10 l10">
			<h5 align="center">Servi�os</h5>

			<!-- divider -->
			<div class="divider"></div>

			<!-- br -->
			<br>

			<!-- Principal de lista de servi�os -->
			<div class="row">
				<!-- Col de servi�os de est�ticas -->
				<div class="col s12 m6 l6">
					<div class="row valign-wrapper">
						<!-- �cone para tipo de servi�o -->
						<div class="col s2 m3 l3" align="center">
							<img id="imagem-produto" class="responsive-img"
								src="resources/dedicated/img/administrador/gerenciar/icone-servico-estetica.png">
						</div>

						<!-- Descri��o de tipo de servi�o -->
						<div class="col s10 m9 l9">
							<h5 align="center" class="grey-text">Est�tica</h5>
						</div>
					</div>

					<!-- divider -->
					<div class="divider"></div>

					<!-- Lista de servi�os do tipo est�tica -->
					<div class="container">
						<ul id="lista-servico-estetica" class="collapsible hoverable"
							data-collapsible="accordion">
							<c:forEach items="${servicoEstetica }" var="servicoEstetica">
								<li>
									<div class="collapsible-header">
										<span>${servicoEstetica.nome }</span>
									</div>
									<div class="collapsible-body">
										<span>Valor : R$ ${servicoEstetica.valor }</span><br> <span>Tempo
											estimado : <fmt:formatDate pattern="hh:mm"
												value="${servicoEstetica.tempoEstimado }" />hrs.
										</span><br> <span>Observa��es :
											${servicoEstetica.observacao }</span>

										<p align="right">
											<a href="#modal-servico"
												onclick="modalAlterarServico('${servicoEstetica.idServico }')">Alterar</a>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>

				<!-- Espa�ado mobile -->
				<div class="col s12 m12 l12 hide-on-med-and-up">
					<!-- divider -->
					<div class="divider"></div>
					<br>
				</div>

				<!-- Col de servi�os veterin�rios -->
				<div class="col s12 m6 l6">
					<div class="row valign-wrapper">
						<!-- �cone para tipo de servi�o -->
						<div class="col s2 m3 l3" align="center">
							<img id="imagem-produto" class="responsive-img center"
								src="resources/dedicated/img/administrador/gerenciar/icone-servico-veterinario.png">
						</div>

						<!-- Descri��o de tipo de servi�o -->
						<div class="col s10 m9 l9">
							<h5 align="center" class="grey-text">Veterin�ria</h5>
						</div>
					</div>

					<!-- divider -->
					<div class="divider"></div>

					<!-- Lista de servi�os do tipo veterin�rio -->
					<div class="container">
						<ul id="lista-servico-veterinario" class="collapsible hoverable"
							data-collapsible="accordion">
							<c:forEach items="${servicoVeterinario }"
								var="servicoVeterinario">
								<li>
									<div class="collapsible-header">
										<span>${servicoVeterinario.nome }</span>
									</div>
									<div class="collapsible-body">
										<span>Valor : ${servicoVeterinario.valor }</span><br> <span>Tempo
											estimado : <fmt:formatDate pattern="hh:mm"
												value="${servicoVeterinario.tempoEstimado }" />hrs.
										</span><br> <span>Observa��es :
											${servicoVeterinario.observacao }</span>

										<p align="right">
											<a href="#modal-servico"
												onclick="modalAlterarServico('${servicoVeterinario.idServico }')">Alterar</a>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal para novo servi�o-->
	<div id="modal-servico" class="modal modal-fixed-footer">
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


				<div class="row">
					<!-- T�tulo de modal -->
					<h5 id="titulo-modal-servico" align="center">Servi�o</h5>

					<!-- divider -->
					<div class="divider"></div>

					<form id="form-servico">
						<div class="input-field col s12 m12 l12">
							<input id="idServico" type="hidden"> <input
								id="nome-servico" type="text" class="truncate" maxlength="255"
								required> <label id="label-nome-servico"
								for="nome-servico">Nome do Servi�o</label>
						</div>

						<div class="input-field col s12 m12 l12">
							<select id="tipo-servico" required>
								<option value="Veterinario">Veterin�rio</option>
								<option value="Estetica">Est�tica</option>
							</select> <label>Tipo de Servi�o</label>
						</div>

						<div class="input-field col s12 m6 l6">
							<input id="valor-servico" class="truncate" type="text"
								maxlength="6" required> <label id="label-valor-servico"
								for="valor-servico">Valor (R$)</label>
						</div>

						<div class="input-field col s12 m6 l6">
							<label id="label-tempo-servico" for="tempo-servico">Tempo
								estimado</label> <input id="tempo-servico" class="timepicker"
								type="text">
						</div>

						<div class="input-field col s12 m12 l12">
							<textarea id="observacao-servico" class="materialize-textarea"
								data-length="255"></textarea>
							<label id="label-observacao-servico" for="observacao-servico">Observa��es</label>
						</div>

						<!-- Bot�es de inseriri ou alterar -->
						<div class="col s12 m12 l12 center">
							<button id="btn-inserir-servico"
								class="btn waves-effect waves-light cyan" type="submit"
								name="action">
								Inserir <i class="material-icons right">add</i>
							</button>

							<button id="btn-alterar-servico"
								class="btn waves-effect waves-light cyan" type="submit"
								name="action">
								Alterar <i class="material-icons right">mode_edit</i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Modal footer -->
		<div class="modal-footer">
			<a id="btn-excluir-servico" href="#!"
				class="modal-action modal-close waves-effect waves-red btn-flat left"><i
				class="material-icons left red-text">delete</i>Excluir Servi�o</a>
		</div>
	</div>

	</main>
	<!-- /.container -->

	<!-- import footer -->
	<c:import url="component/footer.jsp" />

	<!-- Script's dedicado -->
	<!-- JS Time picker materialize-->
	<script type="text/javascript"
		src="resources/materialize/js/materialize-clockpicker.js"
		charset="utf-8" defer></script>

	<!-- JS dedicado para gerenciamento de servi�o -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-servico/gerenciar-servico.js"
		charset="utf-8" defer></script>

	<!-- Mascaras -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-servico/mascara-servico.js"
		charset="utf-8" defer></script>
</body>
</html>