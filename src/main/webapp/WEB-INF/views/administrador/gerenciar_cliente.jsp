<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Import -->
<%@ page import="br.com.bigdog.value.Genero"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Título -->
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
		<!-- Descrição -->
		<div class="row">
			<!-- Section -->
			<div class="section">
				<!-- Título -->
				<h5 class="left-align">Gerenciar Clientes</h5>

				<!-- Subtítulo -->
				<p class="left-align grey-text text lighten-1">Pesquise e o
					cliente desejado para consultar, alterar ou excluir.</p>

				<!-- Divider -->
				<div class="divider"></div>
			</div>
		</div>

		<!-- Barra de pesquisa -->
		<div class="row">
			<!-- Barra de Pesquisa -->
			<div class="col s12 m12 l12">
				<nav class="red lighten-1">
				<div class="nav-wrapper">
					<form>
						<div class="input-field">
							<input id="search-cliente" type="search" class="truncate"
								data-list=".lista-cliente" onkeyup="buscar(this.id)"
								autocomplete="off" placeholder="Buscar cliente"> <label
								class="label-icon" for="search-cliente"><i
								class="material-icons">search</i></label> <i class="material-icons">close</i>
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
				<ul class="collection lista-cliente" style="list-style: upper-alpha">
					<!-- Foreach -->
					<c:forEach items="${clientes }" var="cliente">
						<!-- Linha do cliente -->
						<li class="collection-item avatar"><img
							alt="${cliente.nome }"
							src="${cliente.genero == Genero.Masculino ? 'resources/dedicated/img/cliente/genero_masculino.png' : 'resources/dedicated/img/cliente/genero_feminino.png' }"
							class="circle"> <span class="title truncate">${cliente.nome }</span>
							<p class="truncate">${cliente.email }
								<br> ${cliente.contato.celular }
							</p> <a onClick="listarClienteAdm" href="#modal-cliente-info"
							class="secondary-content"><i class="material-icons">visibility</i></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<!-- Modal Cliente Informações -->
		<div class="row">
			<div class="col s12 m6 l6 right">
				<div id="modal-cliente-info" class="modal">
					<div class="modal-content">
						<h4>Modal Header</h4>
						<p>A bunch of text</p>
					</div>
					<div class="modal-footer">
						<a href="#!"
							class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container --> </main>

	<!--  import footer	 -->
	<c:import url="../component/footer.jsp" />

	<!-- Script's dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-cliente.js" defer></script>
</body>
</html>