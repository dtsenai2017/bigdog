<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Import's CSS -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

<!-- Import's JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
</head>
<main>
<body>
	<!-- Locale para fmt money -->
	<f:setLocale value="pt-BR" />

	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<div class="totalP">
		<!-- Imagem do produto -->
		<div class="imgProduto">
			<img src="${produto.fotoString }">
		</div>

		<!-- Descrição do produto -->
		<div class="descricaoProd">
			<h2>${produto.nome }</h2>
			<p id="desc">${produto.descricao == '' ? 'Sem descrição' : produto.descricao }</p>
			<h3>
				Valor:
				<f:formatNumber type="currency" value="${produto.valor }" />
			</h3>
			<div class="btns">
				<!-- Botão para adicionar produto no carrinho -->
				<a href="addProduto?id=${produto.idProduto }"><button
						class="waves-effect waves-light btn"
						style="background-color: #770505;">
						<img src="resources/loja/imagens/icones/icon-08.png">
						<p style="margin-top: -0.5em;">Carrinho</p>
					</button></a>
			</div>
		</div>

		<!-- Descrição de outros produtos -->
		<p class="produtos">Outros Produtos</p>

		<!-- Lista de outros produtos -->
		<c:forEach items="${outrosProdutos }" var="produto2">
			<a href="produto?idProduto=${produto2.idProduto }">
				<div class="p" id="prodd">
					<img src="${produto2.fotoString }" class="responsive-img">
					<p>${produto2.nome }</p>
					<h2>
						<f:formatNumber type="currency" value="${produto2.valor }" />
					</h2>
				</div>
			</a>
		</c:forEach>
	</div>
</main>

<!-- Import footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Import JS -->
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>

<!-- Script para menu lateral -->
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