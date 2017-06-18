<%@page import="br.com.bigdog.value.Genero"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Ícone de aba -->
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
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<script src="resources/loja/js/vanilla-masker.min.js"></script>

<!-- Mask -->
<script type="text/javascript">
	window.onload = function mask() {
		VMasker(document.querySelector(".dataN")).maskPattern("99/99/9999");
		VMasker(document.querySelector(".cpf")).maskPattern("999.999.999-99");
		VMasker(document.querySelector(".celular")).maskPattern(
				"(99) 9 9999-9999");
		VMasker(document.querySelector(".telefone")).maskPattern(
				"(99) 9999-9999");
		$('#idCliente').val(localStorage.getItem("id_cliente"))
	}
</script>
</head>
<main>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<!-- Dados do cliente -->
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
				<li id="pf" class="id"><a href="lista-dados"><i
						class="fa fa-user" aria-hidden="true"></i> Perfil</a></li>
				<li><a href="lista-pet"><img
						src="resources/loja/imagens/icones/icon-09.png"> Meus Pets</a></li>
				<li><a href="listPedidos"><i class="fa fa-shopping-cart"
						aria-hidden="true"></i> Pedidos</a></li>
				<li><a href="listAgendamentos"><i class="fa fa-calendar"
						aria-hidden="true"></i> Agendamentos</a></li>
				<li><a href="logout"><i class="fa fa-sign-in"
						aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>

		<div class="cx03">
			<i class="fa fa-user" aria-hidden="true"></i> Perfil
		</div>
		<form id="form" class="form">
			<div class="row roww">
				<div class="input-field col s6">
					<input type="hidden" id="idCliente" name=id><input id="p01"
						type="text" readonly="readonly" value="${clienteLogado.nome }"
						name="cliente.nome" class=""> <label class="active"
						for="p01">Nome Completo</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input readonly="readonly" id="p02" name="cliente.dataNascimento"
						type="email" class="dataN"
						value='<fmt:formatDate value="${clienteLogado.dataNascimento }" pattern="dd/MM/yyyy"/>'>
					<label class="active" for="p02">Data de Nascimento</label>

				</div>
			</div>

			<div class="row" id="rooow">
				<label class="gen">Sexo</label>
				<c:if test="${clienteLogado.genero == Genero.Masculino}">

					<p>
						<input disabled="disabled" name="genero" type="radio" id="test1"
							value="Masculino" checked="checked" /> <label for="test1">Masculino</label>
					</p>
					<p>
						<input disabled="disabled" name="genero" type="radio" id="test2"
							value="Feminino" /> <label for="test2">Feminino</label>
					</p>
					<p>
				</c:if>
				<c:if test="${clienteLogado.genero == Genero.Feminino}">

					<p>
						<input disabled="disabled" name="genero" type="radio" id="test1"
							value="Masculino" /> <label for="test1">Masculino</label>
					</p>
					<p>
						<input disabled="disabled" readonly="readonly" name="genero"
							type="radio" id="test2" value="Feminino" checked="checked" /> <label
							for="test2">Feminino</label>
					</p>
					<p>
				</c:if>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="p03" type="text" readonly="readonly"
						value="${clienteLogado.cpf }" class="cpf"> <label
						class="active" for="p03">CPF</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="p05" readonly="readonly" type="text"
						name="contato.telefone" class="telefone"
						value="${clienteLogado.contato.telefone }"> <label
						class="active" for="p05">Telefone</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="p06" readonly="readonly"
						value="${clienteLogado.contato.celular }" type="text"
						name="contato.celular" class="celular"> <label
						class="active" for="p06">Celular</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="p07" type="email" readonly="readonly"
						value="${clienteLogado.email }" name="cliente.email" class="">
					<label class="active" for="p07">Email</label>
				</div>
			</div>

			<!-- Link de ajuda -->
			<p align="center" style="font-size: 12px;">
				Caso algum dado estiver incorreto ou estiver tendo problemas, <a
					href="sobreNos" class="brown-text">CONTATE-NOS.</a>
			</p>
		</form>
	</div>
</main>

<!-- Footer -->
<footer class="page-footer">
	<div class="container">
		<div class="footer-copyright">
			<div class="container" style="text-align: center;">
				© 2017 Copyright BIG Dog - SENAI Informática <a
					class="grey-text text-lighten-4 right"
					href="https://www.facebook.com/bigdogPETeVET/"><img
					style="margin-top: -0.5em"
					src="resources/loja/imagens/icones/icon-04.png"></a>
			</div>
		</div>
	</div>
</footer>

<!-- Import JS -->
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>

<!-- Script's -->
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
