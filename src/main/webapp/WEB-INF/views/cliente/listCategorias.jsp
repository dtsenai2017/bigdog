<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

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
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/materializeModificado.min.css">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>

</head>
<main>
<body>
	<!-- Locale para fmt money -->
	<f:setLocale value="pt-BR" />

	<!-- Import header -->
	<c:import url="component/headerLoja.jsp" />

	<!-- Div para lista de produtos -->
	<div class="totalP">
		<!-- Descrição para lista de categoria -->
		<p class="produtos">Escolha uma Categoria:</p>

		<!-- Menu -->
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Categorias
		</div>

		<!-- Lista de categorias -->
		<ul id="ul">
			<c:forEach items="${listaCategoria }" var="categoria">
				<li class="sb" value="${categoria.idCategoria }"
					onclick="teste(this.value)"><b>${categoria.nome }</b></li>

				<!-- Lista de subcategoria de categoria -->
				<ul id="ull" class="a${categoria.idCategoria }">
				</ul>
			</c:forEach>
		</ul>

		<!-- Outros itens -->
		<div class="cx05">
			<c:forEach items="${listaProduto }" var="produto">
				<br>
				<a href="produto?idProduto=${produto.idProduto }"">
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
	</div>
</main>

<!-- Import Footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Import JS -->
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script type="text/javascript" src="resources/loja/js/categoria.js"></script>

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