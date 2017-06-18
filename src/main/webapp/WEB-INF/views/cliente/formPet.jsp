<%@page import="br.com.bigdog.value.Especie"%>
<%@page import="br.com.bigdog.value.Sexo"%>
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
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/materializeModificado.min.css">

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script src="resources/loja/js/vanilla-masker.min.js"></script>

<!-- Script para máscaras -->
<script type="text/javascript">
	$(document).ready(function() {
		VMasker(document.querySelector(".dataN")).maskPattern("99/99/9999");
		VMasker(document.querySelector(".peso")).maskPattern("99.99")
	});
</script>
</head>
<main>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

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
				<li id="pf"><a href="lista-dados"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
				<li class="id"><a href="lista-pet"><img
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
			<img src="resources/loja/imagens/icones/icon-10.png"> Novo Pet
		</div>

		<!-- Formulário de pete -->
		<form id="form" method="post" action="cadastra-pet" class="form">
			<div class="row roww">
				<div class="input-field col s6">
					<input type="hidden" name="idPet" value="${alterarPet.idPet }"><input
						id="p" name="nome" value="${alterarPet.nome }" required="required"
						type="text" maxlength="255"> <label class="active" for="p">*
						Nome do Pet</label>
				</div>
			</div>

			<div class="input-field col s12" id="input-f">
				<label class="active" for="first_name2" style="margin-left: -1em;">*
					Especie</label> <select name="especie">
					<c:set var="especie" value="<%=Especie.values()%>" />
					<c:forEach items="${especie}" var="especie">
						<option value="${especie }"
							${alterarPet.especie == especie ? 'selected="selected"':''}>${especie }</option>
					</c:forEach>
				</select>
			</div>

			<div class="row" id="rows">
				<label class="gen">* Sexo</label>
				<p>
					<input name="sexo" type="radio" id="test1" value="${Sexo.Macho }"
						checked="checked"
						${alterarPet.sexo == Sexo.Macho ? 'checked="checked"':'' } /> <label
						for="test1">Macho</label>
				</p>
				<p>
					<input name="sexo" type="radio" id="test2" value="${Sexo.Fêmea }"
						${alterarPet.sexo == Sexo.Fêmea ? 'checked="checked"':'' } /> <label
						for="test2">Fêmea</label>
				</p>
				<p>
			</div>

			<div class="row" id="rowww">
				<label class="gen">* Castrado</label>
				<p>
					<input name="castrado" type="radio" id="test3" value="1"
						checked="checked"
						${alterarPet.castrado == true ? 'checked="checked"':'' } /> <label
						for="test3">Sim</label>
				</p>
				<p>
					<input name="castrado" type="radio" id="test4" value="0"
						${alterarPet.castrado == false ? 'checked="checked"':'' } /> <label
						for="test4">Não</label>
				</p>
				<p>
			</div>

			<div class="row roww">
				<div class="input-field col s6">
					<input id="p01" name="raca" value="${alterarPet.raca}" type="text"
						maxlength="50"> <label class="active" for="p01">Raça</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="p02"
						value='<fmt:formatDate value="${alterarPet.dataNascimento }" pattern="dd/MM/yyyy"/>'
						name="dataNascimento" type="text" class="dataN" required>
					<label class="active" for="p02">* Data de Nascimento</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input value="${alterarPet.pedigree }" name="pedigree" id="p03"
						type="text" maxlength="20"> <label class="active"
						for="p03">Pedigree </label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input value="${alterarPet.rga }" name="rga" id="p04" type="text"
						maxlength="20"> <label class="active" for="p04">RGA</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input value="${alterarPet.carteiraVacina }" name="carteiraVacina"
						id="p05" type="text" maxlength="20"> <label class="active"
						for="p05">Carteira de Vacina</label>
				</div>
			</div>

			<div class="row" style="width: 50%; margin-left: 0;">
				<div class="row">
					<div class="input-field col s12">
						<textarea name="observacoes" id="textarea1" maxlength="255"
							class="materialize-textarea">${alterarPet.observacoes }</textarea>
						<label for="textarea1">Observação</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s6">
					<input value="${alterarPet.peso }" name="peso" id="p06" type="text"
						class="peso"> <label class="active" for="p06">Peso
					</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s6">
					<input value="${alterarPet.pelagem }" name="pelagem" id="p07"
						type="text" maxlength="50"> <label class="active"
						for="p07">Pelagem </label>
				</div>
			</div>

			<button type="submit" class="buttonn buttonBlue">
				${alterarPet != null ? 'Alterar' : 'Cadastrar'}
				<div class="ripples buttonRipples">
					<span class="ripplesCircle"></span>
				</div>
			</button>
		</form>
	</div>
</main>

<!-- Import footer -->
<c:import url="component/footerLoja.jsp"></c:import>
<!-- Script's -->
<script type="text/javascript">
	$(".button-collapse").sideNav();
	$(document).ready(function() {
		Materialize.updateTextFields();
	});

	$(document).ready(function() {
		$('select').material_select();
	});

	$('#textarea1').trigger('autoresize');
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
