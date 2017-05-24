<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<title>Big Dog - Bem Vindo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />
<script type="text/javascript" src="resources/loja/js/menu.js"></script>

</head>
<main>
<body>
	<c:import url="component/headerLoja.jsp"></c:import>

	<div class="totalP">

		<p class="produtos">Resultado da busca: ${buscaFeita }</p>

		<c:forEach items="${listaBusca }" var="produto">
			<a href="produto?idProduto=${produto.idProduto }">
				<div class="p">
					<img src="resources/loja/imagens/semFoto.png">
					<p>${produto.nome }
					<h2>
						R$
						<f:formatNumber type="number" maxFractionDigits="3"
							value="${produto.valor }"></f:formatNumber>
					</h2>
					</p>
				</div>
			</a>
			<br>
		</c:forEach>
	</div>
</main>

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