<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Ícone de aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Import's CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>

</head>
<main>
<body>
	<!-- Locale para fmt money -->
	<f:setLocale value="pt-BR" />

	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<!-- Caixa de produtos -->
	<div class="totalP">
		<!-- Descrição de busca -->
		<p class="produtos">Resultado da busca: ${buscaFeita }</p>

		<!-- Lista de produtos encontrados -->
		<c:forEach items="${listaBusca }" var="produto">
			<a href="produto?idProduto=${produto.idProduto }">
				<div class="p">
					<img src="${produto.fotoString }">
					<p>${produto.nome }</p>
					<h2>
						<f:formatNumber type="currency" value="${produto.valor }" />
					</h2>
				</div>
			</a>
			<br>
		</c:forEach>
	</div>
</main>

<!-- Import footer -->
<c:import url="component/footerLoja.jsp"></c:import>
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
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