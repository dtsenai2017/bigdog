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
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/table.css">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/materializeModificado.min.css">

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<main>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<!-- Avatar -->
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
				<li id="pf" class="id"><a href="home-user"><i
						class="fa fa-home" aria-hidden="true"></i> Inicio</a></li>
				<li id="pf"><a href="lista-dados"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
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
			<i class="fa fa-calendar" aria-hidden="true"></i> Endereços
			Cadastrados
		</div>

		<h3 class="hh3">Endereços Cadastrados</h3>
		<div class="demo">
			<div id="demo">
				<div class="table-responsive-vertical shadow-z-1">
					<table id="table" class="table table-hover table-mc-light-blue">
						<thead>
							<tr>
								<th>CEP</th>
								<th>Logradouro</th>
								<th>Bairro</th>
								<th>UF</th>
								<th>Gerenciar</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${clienteLogado.enderecos }" var="endereco">
								<tr>
									<td>${endereco.cep }</td>
									<td>${endereco.logradouro }</td>
									<td>${endereco.bairro }</td>
									<td>${endereco.uf }</td>
									<td><a
										href="novo-endereco?id=${endereco.idEnderecoCliente }"><i
											class="fa fa-pencil-square-o" aria-hidden="true"
											title="Alterar Endereço"></i></a> <a>/</a> <a
										href="deleta-endereco?id=${endereco.idEnderecoCliente }"><i
											class="fa fa-times" aria-hidden="true"
											title="Remover Endeeço"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<a href="novo-endereco"><button class="btPet"
						style="width: auto;">
						<i class="fa fa-calendar" style="padding: 0.5em;"
							aria-hidden="true"></i> Novo Endereço
					</button></a>

			</div>
		</div>
		<br>
	</div>
</main>
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Import JS -->
<script src="resources/loja/js/jquery.min.js"></script>

<!-- Script's -->
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
